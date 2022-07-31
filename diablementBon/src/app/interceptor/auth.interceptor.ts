import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthenticationService } from '../services/authentication/authentication.service';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
 

  constructor(private authenticationService:AuthenticationService) {}

  intercept(httpRequest: HttpRequest<any>, httpHandler: HttpHandler): Observable<HttpEvent<any>> {
    //si on a la requette de login on retourne httpHandler
    if (httpRequest.url.includes(`${this.authenticationService.host}/user/login`)){
      return httpHandler.handle(httpRequest);
    }

    if (httpRequest.url.includes(`${this.authenticationService.host}/user/register`)){
      return httpHandler.handle(httpRequest);
    }

    if (httpRequest.url.includes(`${this.authenticationService.host}/user/resetPassword`)){
      return httpHandler.handle(httpRequest);
    }

    //on recupere le token et on le charge
    this.authenticationService.loadToken();

    const token = this.authenticationService.getToken();
    //on va chercher le httprequest et on va le cloner
    const request = httpRequest.clone({setHeaders:{Authorization:`Bearer ${token}`}});

    return httpHandler.handle(request);
  }
}
