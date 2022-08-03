import { Injectable } from '@angular/core';
import { HttpClient} from '@angular/common/http';
import { User } from 'src/app/models/user/user';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private http: HttpClient) { }

  findAllUsers(){
    return this.http.get('http://localhost:14010/list');
  }

saveUser(user: User){
  return this.http.post('lhttp://localhost:14010/user/add',user);
}

deleteUser(id: number){
return this.http.delete('lhttp://localhost:14010/user/delete'+id);
}
}
