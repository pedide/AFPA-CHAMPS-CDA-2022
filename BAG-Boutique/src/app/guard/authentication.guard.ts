import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { NotificationType } from '../enum/notification-type.enum';
import { AuthenticationService } from '../services/authentication/authentication.service';
import { NotificationService } from '../services/notification/notification.service';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationGuard implements CanActivate {

  constructor(private authenticationService:AuthenticationService,
    private router:Router,
    private notificationService:NotificationService){}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): boolean{
    return true;
  }
  private isUserLggedIn():boolean{
    if (this.authenticationService.isUserLoggedIn()){
      return true;
    }
    this.router.navigate(['/login']

    );
    this.notificationService.notify(NotificationType.ERROR,`You need to log in to access to this page`.toUpperCase());
return false ;
  }
  
}
