import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { BehaviorSubject, Subscription } from 'rxjs';
import { NotificationType } from 'src/app/enum/notification-type.enum';
import { CustomHttpResponse } from 'src/app/models/custom-http-response';
import { User } from 'src/app/models/user/user';
import { AuthenticationService } from 'src/app/services/authentication/authentication.service';
import { NotificationService } from 'src/app/services/notification/notification.service';
import { UserService } from 'src/app/services/user/user.service';

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
  public editUser: User=new User;
  private currentUsername!: string;
  public user:User = new User();

  constructor(private userService:UserService,private notificationService:NotificationService, 
    private authenticationService:AuthenticationService) { }

  ngOnInit(): void {
    this.user = this.authenticationService.getUserFromLocalCache();
    this.getUsers(true);
  }

  public changeTitle(title:string):void{
    this.titleSubject.next(title);
  }

  public getUsers( showNotification:boolean):void{
    this.refreshing = true;
    this.subscriptions.push(
      this.userService.getUsers().subscribe(
        (response:User[]) =>{
          this.userService.addUsersToLocalCache(response);
        this.users =  response;
        this.refreshing=false;
        if(showNotification){
          this.sendNotification(NotificationType.SUCCESS,`${response.length} user(s) loaded successfully.`)
        }
        },
        (errorResponse:HttpErrorResponse)=>{
          this.sendNotification(NotificationType.ERROR,errorResponse.error.message);
          this.refreshing=false;
        }
      )
    );
  }

  public onSelectUser(selectedUser:User):void{
    this.selectedUser=selectedUser;
    this.clickButton('openUserInfo');
    

  }

/*  public onProfileImageChange(event:Event):void{
    const element = event.target as HTMLInputElement;     

   console.log((element).files);
   console.log('Le filename',this.fileName);
   this.profileImage=(element).files;
   this.fileName=this.profileImage[0].name;
   
   
  }*/
  
  public onProfileImageChange(fileName: string, profileImage: File): void {
    this.fileName =  fileName;
    this.profileImage = profileImage ;
    console.log('Image de profile :',this.profileImage);
    console.log('Le filename',this.fileName);
  }
  

  public saveNewUser():void{
    this.clickButton('new-user-save');
    
  }
  
  public onAddNewUser(userForm:NgForm):void{
    const formData = this.userService.createUserFormData(null as any,userForm.value,this.profileImage);
    this.subscriptions.push(
      this.userService.addUser(formData).subscribe(
        (response:User)  =>{
          this.clickButton('new-user-close');
          this.getUsers(false);
          this.fileName=null as any;
          this.profileImage=null as any;
          userForm.reset();
          this.sendNotification(NotificationType.SUCCESS,`${response.firstName} ${response.lastName} updated successfully`);

        },
        (errorResponse:HttpErrorResponse) =>{
          this.sendNotification(NotificationType.ERROR,errorResponse.error.message);
        }
      )
    );

  }

  public onResetPassword(emailForm:NgForm):void{
    this.refreshing=true;
    const emailAddress = emailForm.value['reset-password-email'];

    this.subscriptions.push(
      this.userService.resetPassword(emailAddress).subscribe(
        (response:CustomHttpResponse)=>{
          this.sendNotification(NotificationType.SUCCESS, response.message);
        },
        (errorResponse:HttpErrorResponse) =>{
          this.sendNotification(NotificationType.WARNING, errorResponse.error.message);
          this.refreshing=false;
        },
        ()=>{emailForm.reset();}
      )
    );
  }

  public searchUsers(searchTerm:string):void{
    console.log(searchTerm);
    const results:User[]=[];
    for(const user of this.userService.getUsersFromLocalCache())
    {if(user.firstName.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 || 
      user.lastName.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 ||
      user.username.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 ||
      user.userId.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 ){
        results.push(user);
      }

    }
    this.users = results;
    if(results.length===0 || !searchTerm){
      this.users = this.userService.getUsersFromLocalCache();

    } 
  }

  public onDelateUser(userId:number):void{
    this.subscriptions.push(
      this.userService.deleteUser(userId).subscribe(
        (response:CustomHttpResponse)=>{
          this.sendNotification(NotificationType.SUCCESS, response.message);
          this.getUsers(true);
        },
        (errorResponse:HttpErrorResponse) =>{
          this.sendNotification(NotificationType.ERROR,errorResponse.error.message);
        }
      )
    );
  }

  public onEditUser(editUser: User):void{
    this.editUser = editUser;
    this.currentUsername = editUser.username;
    this.clickButton('openUserEdit');
}

 public onUpdateUser():void{
    const formData = this.userService.createUserFormData(this.currentUsername, this.editUser, this.profileImage);
    this.subscriptions.push(
      this.userService.updateUser(formData).subscribe(
        (response:User)  =>{
          this.clickButton('closeEditUserModalButton');
          this.getUsers(false);
          this.fileName=null as any;
          this.profileImage=null as any;
          this.sendNotification(NotificationType.SUCCESS,`${response.firstName} ${response.lastName} updated successfully`);

        },
        (errorResponse:HttpErrorResponse) =>{
          this.sendNotification(NotificationType.ERROR,errorResponse.error.message);
          this.profileImage = null as any;
        }
      )
    );
  }


  private sendNotification(notificationType: NotificationType, message: string):void {
    if(message){
      this.notificationService.notify(notificationType,message) 
    }else{
      this.notificationService.notify(notificationType,'An error occured. Please try again.')
    }
    }
    private clickButton(buttonId: string):void{
      document.getElementById(buttonId)?.click();
    }
 

}
