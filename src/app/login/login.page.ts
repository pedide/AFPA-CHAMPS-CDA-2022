import { Component, OnInit } from '@angular/core';
import { FormGroup,FormBuilder} from '@angular/forms';
import { NavController } from '@ionic/angular';
import * as Constants from'../../constants';
import { LoginService } from '../services/login/login-service';
import { User} from 'src/app/models/user/user';
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { HeaderType } from '../enum/header-type.enum';
import { NotificationType } from '../enum/notification-type.enum';
import { AuthenticationService } from '../services/authentication/authentication.service';
import { Router} from '@angular/router';
import { Subscription} from 'rxjs';
import { NotificationService } from '../services/notification/notification.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {
  public showLoading = false;
  private subscriptions: Subscription[]=[];
  // eslint-disable-next-line @typescript-eslint/member-ordering
  users: any;

  constructor(private router: Router,
    private authenticationService: AuthenticationService,
    private notificationService: NotificationService,
    //private navCtrl: NavController,
    private userService: LoginService) { // creation du formulaire

  }
  ngOnInit(): void {
    this.userService.findAllUsers().subscribe(
      data =>{
        console.log(data);
        this.users=data;
      }
    );
  }
public onLogin(user: User): void {
    this.showLoading = true;
    console.log(user);
    this.subscriptions.push(//aller chercher les inscriptions
      this.authenticationService.login(user).subscribe(
        (response: HttpResponse<User>)=>{
         const token = response.headers.get(HeaderType.JWT_TOKEN);
         // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
         this.authenticationService.saveToken(token!);
         // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
         this.authenticationService.addUserToLocalCache(response.body!);
         this.router.navigateByUrl('/home');
         this.showLoading=false;
        },
        (errorResponse: HttpErrorResponse) =>{
          //console.log(errorResponse);
          this.sendErrorNotification(NotificationType.ERROR,errorResponse.error.message);
          this.showLoading=false;
        }
      )
    );
}

sendErrorNotification(notificationType: NotificationType, message: string) {
  if (message){
    //this.notificationService.notify(notificationType,message)
  }else{
  //this.notificationService.notify(notificationType,'An error occured. Please try again')
  }
  }
}
