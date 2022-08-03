import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { BehaviorSubject, Subscription } from 'rxjs';
import { CustomHttpResponse } from 'src/app/models/custom-http-response';
import { User } from 'src/app/models/user/user';
import { NotificationService } from 'src/app/services/notification/notification.service';
import { UserService } from 'src/app/services/user/user.service';
import { NotificationType } from '../enum/notification-type.enum';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
private titleSubject = new BehaviorSubject<string>('Users');
public titleAction$ = this.titleSubject.asObservable();
public users: User[] = [];
public refreshing: boolean=false;
public selectedUser: User = new User;
private subscriptions:Subscription[]=[];
public fileName!: string;
public profileImage!: File;
public editUser=new User();
private currentUsername!: string;

constructor(private userService:UserService,
private notificationService:NotificationService) { }

ngOnInit(): void {
  this.getUsers(true);
}

  public changeTitle(title:string):void{
    this.titleSubject.next(title);
  }
  public getUsers(showNotification:boolean):void{
    this.refreshing = true;
    this.subscriptions.push(
      this.userService.getUsers().subscribe(
        (response:User[])=>{
        this.userService.addUsersToLocalCache(response);
        this.users = response;
        this.refreshing=false;
        if(showNotification){
          this.sendNotification(NotificationType.SUCCESS,`${response.length} user(s)loaded successfully`)
        }
        },
      (errorResponse:HttpErrorResponse)=>{
        this.sendNotification(NotificationType.ERROR,errorResponse.error.message)
        this.refreshing=false;
      }
    )
    );
    }
  public onSelectUser(selectedUser:User):void{
    this.selectedUser=selectedUser;
    this.clickButton(`openUserInfo`);
  }

 public onProfileImageChange(fileName:string,profileImage:File):void{
 this.fileName= fileName;
 this.profileImage = profileImage;
 console.log(`image de profile`,this.profileImage);
} 
public saveNewUser():void{
 document.getElementById('new-user-save')?.click();
}  

/*  public onProfileImageChange(event:Event):void{
    const element = event.target as HTMLInputElement;

    console.log((element).files);
    console.log('Le filename',this.fileName);
    this.profileImage=(element).files;
    this.fileName=this.profileImage[0].name;
  }  */
/*   public saveNewUser():void{
    this.clickButton('new-user-save');
  } */
  public onAddNewUser(userForm:NgForm):void{
    const formData = this.userService.createUserFormData(null as any, userForm.value,this.profileImage)
    this.subscriptions.push(
      this.userService.addUser(formData).subscribe(
        (response:User) =>{
          this.getUsers(false);
          this.fileName=null as any;
          this.profileImage=null as any;
          userForm.reset();
          this.sendNotification(NotificationType.SUCCESS,`${response.firstName}${response.lastName} updated successfully`);
        },
        (errorResponse:HttpErrorResponse)=>{
          this.sendNotification(NotificationType.ERROR,errorResponse.error.message);
      }
    )
    );
  }

 public searchUsers(searchTerm:string):void{
  console.log(searchTerm);
  const results:User []=[]; // initilisation du tableau a vide
  for(const user of this.userService.getUsersFromLocalCache()){
  if(user.firstName.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1||
  user.lastName.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1||
  user.username.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1||
  user.userId.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1 ){

    results.push(user);
  }
 }

 this.users = results;
 if(results.length===0 || !searchTerm){
  this.users = this.userService.getUsersFromLocalCache();

 }

}
public onDeleteUser(userId:number):void{

  this.subscriptions.push(
    this.userService.deleteUser(userId).subscribe(
      (response:CustomHttpResponse) =>{
        this.sendNotification(NotificationType.SUCCESS,response.message);
        this.getUsers(true);
      },
      (errorResponse:HttpErrorResponse)=>{
        this.sendNotification(NotificationType.ERROR,errorResponse.error.message);
      }
    )
  );
}
public onEditUser(editUser:User):void{
  this.editUser = editUser;
  this.currentUsername= editUser.username;
  this.clickButton('openUserEdit');
}

  private sendNotification(notificationType: NotificationType, message: string) {
    if (message){
      this.notificationService.notify(notificationType,message)
    }else{
    this.notificationService.notify(notificationType,'An error occured. Please try again')
    }
    }
   private clickButton(buttonId:string){
      document.getElementById('buttonId')?.click();
    } 

public onUpdateUser():void{
  const formData = this.userService.createUserFormData(this.currentUsername, this.editUser,this.profileImage)
  this.subscriptions.push(
    this.userService.addUser(formData).subscribe(
      (response:User) =>{
        this.clickButton(`closeEditUserModalButton`);
        this.getUsers(false);
        this.fileName=null as any;
        this.profileImage=null as any;
        this.sendNotification(NotificationType.SUCCESS,`${response.firstName}${response.lastName} updated successfully`);
      },
      (errorResponse:HttpErrorResponse)=>{
        this.sendNotification(NotificationType.ERROR,errorResponse.error.message);
        this.profileImage = null as any;
    }
    )
  );
}
}