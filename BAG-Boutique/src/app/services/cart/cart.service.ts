import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CartService {
public cartItemList : any=[];
public productList = new BehaviorSubject<any>([]);

  constructor(private http:HttpClient) { }
  getProducts(){
    return this.productList.asObservable();
  }

  setProduct(product:any ){
    this.cartItemList.push(...product);//...veut dire les mettre a la suite de product
    this.productList.next(product);
  }
  addtoCart(product:any){
    this.cartItemList.push(product);
    this.productList.next(this.cartItemList);
    this.getTotalPrice();
    console.log(this.cartItemList);
  }
  getTotalPrice():number{

    let grandTotal =0;

    this.cartItemList.map((a:any)=>{
      console.log(a);
      grandTotal+=a.total;

    }

    );
    return grandTotal;
  }
  removeAllCart(){
    this.cartItemList=[];//retirer des elements de la table
    this.productList.next(this.cartItemList);
  }
  removeCartItem(product:any){
    this.cartItemList.map(
      (a:any, index:any)=>{
        if(product.id==a.id){
          this.cartItemList.splice(index,1);
        }

      }
    );
    this.productList.next(this.cartItemList);
  }
}
