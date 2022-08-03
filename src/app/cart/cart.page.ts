import { Component, OnInit } from '@angular/core';
import { CartService } from '../services/cart/cart.service';
import { ProductService } from '../services/product/product.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.page.html',
  styleUrls: ['./cart.page.scss'],
})
export class CartPage implements OnInit {
  public products: any=[];
  public grandTotal!: number;
  public quantite=1;

  constructor(private cartService: CartService,
    private productService: ProductService) { }

  ngOnInit(): void{
    this.cartService.getProducts()
    .subscribe(res=>{
      this.products = res;
      this.grandTotal=this.cartService.getTotalPrice(); //methode get total price
    });
  }

}
