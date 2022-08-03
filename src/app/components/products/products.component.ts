import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/cart/cart.service';
import { ProduitService } from 'src/app/services/produit/produit.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  public productList: any;

  constructor(private produitService:ProduitService, private cartService:CartService) { }

  ngOnInit(): void {
    this.produitService.getAllProduits()
    .subscribe(
      data =>{
        console.log(data);
        this.productList=data;

        this.productList.forEach((a:any)=> {
          Object.assign(a,{quantity:1,total:a.price});

        });
      }
    );
  }
  actionAddToCart(item:any){
    this.cartService.addtoCart(item);
  }

}
