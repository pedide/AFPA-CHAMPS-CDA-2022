import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Produit } from '../models/product/product';
import { ProductService } from '../services/product/product.service';

@Component({
  selector: 'app-show-detail',
  templateUrl: './show-detail.page.html',
  styleUrls: ['./show-detail.page.scss'],
})
export class ShowDetailPage implements OnInit {

  //product: Produit;
  product: Produit;
  navCrt: any;

  constructor(
    private http: HttpClient,
    private productService: ProductService
    ) { }

  ngOnInit() {
    this.productService.findAllProducts().subscribe(
      data =>{
        console.log(data);
      }
    );
  }
}


/*     showDetails(id: number){
      //const id: number= parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
      //const id: number = this.product.id;
        //console.log(data);
        // me connecter au service
        //if(!isNaN(id)){
        this.productService.findProduitById(id).subscribe(
          data =>{
            console.log('data',data);
                this.navCrt.navigateForward('/product-detail/'+id);
          }
        );
      }
      }
    }
 */
