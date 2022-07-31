import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/cart/cart.service';
import { OrderService } from 'src/app/services/order/order.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
public products:any=[];
public grandTotal!:number;
public quantite:number=0;

  constructor(private cartService:CartService,
    ) { }

  ngOnInit(): void { 
    this.cartService.getProducts().subscribe(
      res=>{
        this.products=res;
        
        this.quantite++;
      this.grandTotal=this.cartService.getTotalPrice();
      console.log(res);
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
saveData(){
  sessionStorage['setProduct'](this.products);
}
getData(){
  return sessionStorage['getProduct']('this.products');
}

incrementQuantite(quantite:any){
  this.quantite = this.quantite+1;

}
descrementQuantite(quantite:any){
  this.quantite = this.quantite-1;
  if (quantite <= 1){
    this.removeItem(this.products);
} }
 
  }


