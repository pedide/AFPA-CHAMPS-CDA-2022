import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Fournisseur } from 'src/app/models/fournisseur/fournisseur';
import { AppSettings } from 'src/app/settings/app.settings';


@Injectable({
  providedIn: 'root'
})
export class FournisseurService {

  constructor(private http:HttpClient) { }
  getAllFour(){
    return this.http.get(AppSettings.APP_URL+"/fournisseur/list");
  //return this.http.get("localhost:8087/fournisseur/list");
}
createProduit(produit:Fournisseur){
  return this.http.post(AppSettings.APP_URL+"/fournisseur/list",Fournisseur);

}
}