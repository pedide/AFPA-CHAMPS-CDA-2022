import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { CartService } from '../services/cart/cart.service';
import { ProductService } from '../services/product/product.service';
import {ActivatedRoute} from '@angular/router';
import {Router} from '@angular/router';
import { Produit } from '../models/product/product';


@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {
productsList: any;
product: Produit;

  constructor(
  private navCrt: NavController,
  private productService: ProductService,
  private cartService: CartService,
  private router: Router, private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.productService.findAllProducts().subscribe(
      data =>{
        console.log(data);
        this.productsList=data;

        this.productsList.forEach((a: any)=>{
          Object.assign(a,{quantity:1,total:a.price});
        });
      }
      );
    }
    addToCart(product: any){
      this.cartService.addToCart(product);
    }

  showDetails(id: number){
  //const id: number= parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
  //const id: number = this.product.id;
    //console.log('data','toto');
    // me connecter au service
    if(!isNaN(id)){
    this.productService.findProduitById(id).subscribe(
      data =>{
        console.log('data',data);
            this.navCrt.navigateForward('/product-detail/'+id);
      }
    );
  }else{
    console.log('erreur de show detail !');
  }
  }
}
