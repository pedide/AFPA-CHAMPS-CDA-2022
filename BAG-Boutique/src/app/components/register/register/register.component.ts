import { HttpErrorResponse, HttpResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { HeaderType } from 'src/app/enum/header-type-enum';
import { NotificationType } from 'src/app/enum/notification-type.enum';
import { User } from 'src/app/models/user/user';
import { AuthenticationService } from 'src/app/services/authentication/authentication.service';
import { NotificationService } from 'src/app/services/notification/notification.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  public showLoading: boolean = false;
  private subscription : Subscription[]=[];
 

  constructor(private router:Router,
    private authenticationService:AuthenticationService,
    private notificationService:NotificationService) { }


  ngOnInit(): void {
    if(this.authenticationService.isUserLoggedIn()){
      this.router.navigateByUrl('/user/management')
    }   
  }
  onRegister(user:User):void{
    this.showLoading = true;
    console.log(user);
    this.subscription.push(
      this.authenticationService.register(user).subscribe(
        (response:User)=>{
          this.sendErrorNotification(NotificationType.SUCCESS,
            `A new account was created  for ${response.firstName}.please chack your email for password to log in.`)
        this.showLoading=false;
      },
      (errorResponse : HttpErrorResponse)=>{
        
        this.sendErrorNotification(NotificationType.ERROR,errorResponse.error.message);
        this.showLoading=false;
      }
      )
    )
    
    }
    private sendErrorNotification(notificationType: NotificationType, message: string) {
      if(message){
        this.notificationService.notify(notificationType,message)
      }else{
        this.notificationService.notify(notificationType, 'An error occured. Please try again!');
  
      }
    }
  
    
    ngOnDestroy():void{
      this.subscription.forEach(sub => sub.unsubscribe());
  
    }
}
