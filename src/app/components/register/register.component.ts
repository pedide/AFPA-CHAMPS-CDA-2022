import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { User } from 'src/app/models/user/user';
import { AuthenticationService } from 'src/app/services/authentication/authentication.service';
import { NotificationService } from 'src/app/services/notification/notification.service';
import { NotificationType } from '../enum/notification-type.enum';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit,OnDestroy {
  
  public showLoading: boolean = false;
  private subscriptions:Subscription[]=[];

  constructor(private router:Router,
    private authenticationService:AuthenticationService,
    private notificationService:NotificationService) { }

  ngOnInit(): void {
    if(this.authenticationService.isUserLoggedIn()){
      this.router.navigateByUrl('/user/management')
    }
  }

public onRegister(user:User):void {
  this.showLoading = true;
  console.log(User);
  this.subscriptions.push(//aller chercher les inscriptions
    this.authenticationService.register(user).subscribe(
      (response:User)=>{
       this.showLoading=false;
       this.sendNotification(NotificationType.SUCCESS,`A new account was created for ${response.firstName}.
       Please check your email for password to log in`);

      },
      (errorResponse:HttpErrorResponse) =>{
        this.sendNotification(NotificationType.ERROR,errorResponse.error.message)
      }
    )
  )
    }
 private sendNotification(notificationType: NotificationType, message: string) {
if (message){
  this.notificationService.notify(notificationType,message)
}else{
this.notificationService.notify(notificationType,'An error occured. Please try again')
}
}
  
ngOnDestroy():void{
  this.subscriptions.forEach(sub => sub.unsubscribe());
  }
}