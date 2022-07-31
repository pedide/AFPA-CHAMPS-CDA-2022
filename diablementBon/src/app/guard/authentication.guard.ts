import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { NotificationType } from '../enum/notification-type.enum';
import { AuthenticationService } from '../services/authentication/authentication.service';
import { NotificationService } from '../services/notification/notification.service';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationGuard implements CanActivate {
  
  constructor(private authenticationService: AuthenticationService,
    private router:Router,
    private notificationService: NotificationService){

  }
  
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): boolean {
      return this.isUserLoggedIn();
  }
  
  private isUserLoggedIn():boolean{
    if(this.authenticationService.isUserLoggedIn()){
      return true;
    }
    //si user non logger on le redirige vers login
    this.router.navigate(['/login']); //on envoie la notification à l'utilisateur
    this.notificationService.notify(NotificationType.ERROR, `You need to login to access to this page.`.toUpperCase());
    return false;
  }

}
