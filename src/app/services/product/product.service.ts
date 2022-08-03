import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Produit } from 'src/app/models/product/product';
import { User } from 'src/app/models/user/user';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  getProducts() {
    throw new Error('Method not implemented.');
  }

  // eslint-disable-next-line @typescript-eslint/member-ordering
  constructor(private http: HttpClient) {}

public findAllProducts(){
    return this.http.get('http://localhost:14010/produits');
  }

public saveProduit(product: Produit){
  return this.http.post('http://localhost:14010/produits',product);
}

public deleteProduits(id: number){
return this.http.delete('http://localhost:14010/produits');
}
public findProduitById(id: number){
  return this.http.get('http://localhost:14010/produits');
  }
}

