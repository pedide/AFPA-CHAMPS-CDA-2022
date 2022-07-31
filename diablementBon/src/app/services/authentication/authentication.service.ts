import { HttpClient, HttpErrorResponse, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User } from 'src/app/models/user/user';
import { environment } from 'src/environments/environment';
import { JwtHelperService } from "@auth0/angular-jwt";
import { Router } from '@angular/router';



@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  public host = environment.apiUrl;//on fait appelle à notre constant envir
  private token: string;
  private loggedInUsername: string;
  private jwtHelper = new JwtHelperService();


  constructor(private http : HttpClient,
    private router:Router,) {
    this.token='';
    this.loggedInUsername='';
  }

  public login(user:User):Observable<HttpResponse<User>> {
    return this.http.post<User>
    (`${this.host}/user/login`, user, {observe:'response'});
  }

  public register(user:User):Observable<User>{
    return this.http.post<User>(`${this.host}/user/register`, user);
  }

  public logOut():void {
    this.token = '';
    this.loggedInUsername = '';
    localStorage.removeItem('user');
    localStorage.removeItem('token');
    localStorage.removeItem('users');
    
  }

  clearToken(){
    localStorage.removeItem('token');
    this.router.navigate(['/']);
  }

  //enregistrer le token
  public saveToken(token:string):void{
    this.token = token;
    localStorage.setItem('token', token);
  }

  //ajouter un utilisateur ds cahce local
  public addUserToLocalCache(user:User):void{
    localStorage.setItem('user', JSON.stringify(user)); //setItem prend la clef et value
  }

  public getUserFromLocalCache(): User{
    //on retourne un utilisateur non null
    return JSON.parse(localStorage.getItem('user')!);//getItem prend uniquement la clef
  }

  public loadToken(): void{
    this.token != localStorage.getItem('token');
  }

  public getToken(): string{
    return this.token;
  }

  //vérifie si l'utilisateur est connecté
  public isUserLoggedIn(): boolean{
    
    //il va loader le token 
    this.loadToken();
    //puis décode le token
    if(this.token != null && this.token!== ''){
      if(this.jwtHelper.decodeToken(this.token).sub != null || ''){
        if(!this.jwtHelper.isTokenExpired(this.token)){
          //on enlève la partie où il y a bear
          this.loggedInUsername = this.jwtHelper.decodeToken(this.token).sub;
          return true;
        }
      }
    }else{
      this.logOut();//si c'est null on se déconnecte
      return false;
    }
    //s'il n'a pas pu décoder token on retourne false
    return false;
  }


}
