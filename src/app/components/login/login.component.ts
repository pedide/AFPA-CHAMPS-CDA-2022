import { HttpErrorResponse, HttpResponse } from '@angular/common/http';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { User } from 'src/app/models/user/user';
import { AuthenticationService } from 'src/app/services/authentication/authentication.service';
import { NotificationService } from 'src/app/services/notification/notification.service';
import { HeaderType } from '../enum/header-type.enum';
import { NotificationType } from '../enum/notification-type.enum';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit,OnDestroy {
  public showLoading: boolean = false;
  private subscriptions:Subscription[]=[];

  constructor(private router:Router,
    private authenticationService:AuthenticationService,
    private notificationService:NotificationService) { }

  ngOnInit(): void {
    if(this.authenticationService.isUserLoggedIn()){
      this.router.navigateByUrl('/user/management')
    }else{
      this.router.navigateByUrl('/login')
    }
  }

public onLogin(user:User):void {
  this.showLoading = true;
  console.log(user);
  this.subscriptions.push(//aller chercher les inscriptions
    this.authenticationService.login(user).subscribe(
      (response:HttpResponse<User>)=>{
       const token = response.headers.get(HeaderType.JWT_TOKEN);
       this.authenticationService.saveToken(token!);
       this.authenticationService.addUserToLocalCache(response.body!);
       this.router.navigateByUrl('/user/management');
       this.showLoading=false; 
      },
      (errorResponse:HttpErrorResponse) =>{
        //console.log(errorResponse);
        this.sendErrorNotification(NotificationType.ERROR,errorResponse.error.message);
        this.showLoading=false;
      }
    )
  )
    }
  sendErrorNotification(notificationType: NotificationType, message: string) {
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