import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AppSettings } from 'src/app/settings/app.settings';
import { Produit } from 'src/app/models/produit/produit';

@Injectable({
  providedIn: 'root'
})
export class ProduitService {

  constructor(private http:HttpClient) { }

  getAllProduits(){
    //return this.http.get(AppSettings.APP_URL+"/produits");
    return this.http.get("http://localhost:8085/produits");
  }

  createProduit(produit:Produit){
    return this.http.post(AppSettings.APP_URL+"/produits", produit);
  }
}
