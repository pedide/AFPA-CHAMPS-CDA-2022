import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthenticationService } from '../services/authentication/authentication.service';
import { User } from '../models/user/user';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  constructor(private authenticationService:AuthenticationService) {}

  intercept(HttpRequest: HttpRequest<any>, HttpHandler:HttpHandler): Observable<HttpEvent<User>> {
    if(HttpRequest.url.includes(`${this.authenticationService.host}/user/login`)){
      return HttpHandler.handle(HttpRequest);
    }
    if(HttpRequest.url.includes(`${this.authenticationService.host}/user/register`)){
      return HttpHandler.handle(HttpRequest);
  }
  if(HttpRequest.url.includes(`${this.authenticationService.host}/user/resstpassword`)){
    return HttpHandler.handle(HttpRequest);
  }
  this.authenticationService.loadToken();
  const token = this.authenticationService.getToken();
  const request = HttpRequest.clone({setHeaders:{Authorization:`Bearer ${token}`}});
  return HttpHandler.handle(HttpRequest);
}
}
