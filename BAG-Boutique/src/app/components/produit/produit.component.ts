import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { Produit } from 'src/app/models/produit/produit';
import { ProduitService } from 'src/app/services/produit/produit.service';

@Component({
  selector: 'app-produit',
  templateUrl: './produit.component.html',
  styleUrls: ['./produit.component.css']
})
export class ProduitComponent implements OnInit {
declare produit:any[];
  //form:FormGroup;
   //produit!:object;

  constructor(
    private produitService:ProduitService,
    private router:Router) { }

  ngOnInit(): void {

  this.getProduits();
}
getProduits(){
this.produitService.getAllProduits().subscribe(
data =>{
console.log(data);
this.produit=data as any;}
);
}
}
