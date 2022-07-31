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

  setProduct(product:any){
    this.cartItemList.push(...product);//on met à la suite des produits
    this.productList.next(product);
  }

  addtoCart(product:any){
    this.cartItemList.push(product);
    this.productList.next(this.cartItemList);
    this.getTotalPrice();
    console.log(this.cartItemList);//on affiche la liste d'objet
    
  }

  getTotalPrice():number{
    let grandTotal = 0;
    this.cartItemList.map(
      (a:any)=>{
        console.log(a);
        
        grandTotal+=a.total;
      }
    );
    return grandTotal;
  }
  //enlever les produits du panier
  removeAllCart(){
    this.cartItemList = [];
    this.productList.next(this.cartItemList);
  }

  removeCartItem(product:any){
    this.cartItemList.map(//on va mapper les elm de la liste
    (a:any, index:any)=>{
      if(product.id == a.id){//si id du produit qui correspond à notre a
        this.cartItemList.splice(index,1);//on le retire
      }
    }
    );
    this.productList.next(this.cartItemList);
  }

}
