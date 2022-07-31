import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/cart/cart.service';
import { OrderService } from 'src/app/services/order/order.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css'],
  

})
export class CartComponent implements OnInit {
  public products:any = [];
  public grandTotal! : number;//non null
  public quantite:number=1;

  constructor(private cartService:CartService) { }


  ngOnInit(): void {
    //on va recuperer ts les produits
    this.cartService.getProducts() 
    .subscribe(
      res=>{
        console.log(res);
        this.products = res; 
        this.grandTotal = this.cartService.getTotalPrice();
        
      }
    );
  }

  removeItem(item:any){
    this.cartService.removeCartItem(item);
  }

  //vider le panier
  emptyCart(){
    this.cartService.removeAllCart();
  }

  incrementQuantite(quantite:any){
    this.quantite = this.quantite+1;
  }
 
  descrementQuantite(quantite:any){
   
    if (quantite >1){
       this.quantite = this.quantite-1;
    }else{
      this.removeItem(this.products);
  
    }
  }
  //sauvegarder les produits du panier
  saveData(){
    sessionStorage['setProduct'](this.products);
  }

  getData() {
    return sessionStorage.getItem('getProduct');
  } 
}
