import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AppSettings } from 'src/app/settings/app.settings';

@Injectable({
  providedIn: 'root'
})
export class OrderService {

  public products:any[]=[];
  constructor(private http:HttpClient) { }

  getSingleOrder(orderId:Number){
    return this.http.get(AppSettings.APP_URL+'orderp/$(orderId)')

  }
  getAllOrderp(){
    return this.http.get(AppSettings.APP_URL+"/orderp");
    // return this.http.get("http://localhost:8087/produits");
      }
    
      createProduit(order:any){
        return this.http.post(AppSettings.APP_URL+"/orderp",order);
      }
}
