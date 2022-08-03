import { Component, OnInit } from '@angular/core';
import { publishLast } from 'rxjs';
import { CartService } from 'src/app/services/cart/cart.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
public products:any=[] //ajout list des produits
public grandTotal!: number; // grandTotal not null
public quantite:number=1;
i=1;

  constructor(private cartService:CartService) {} // calcul total

  ngOnInit(): void {
    this.cartService.getProducts()
    .subscribe(res=>{
        this.products = res;
        this.grandTotal=this.cartService.getTotalPrice(); //methode get total price   
      })
  }
removeItem(item:any){
  this.cartService.removeCartItem(item);
}
emptycart(){
  this.cartService.removeAllCart();
}

incProduct(){
  if(this.i !=99){
  this.i ++;
  this.products.quantite = this.products.quantite 
  console.log(this.products.quantite);
  }
 
}
decProduct(){
  if (this.i !=1){
    this.i--;
    this.products.quantite = this.products.quantite;
    console.log(this.products.quantite);
  }  
  }
}
