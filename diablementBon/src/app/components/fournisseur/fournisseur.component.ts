import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FournisseurService } from 'src/app/services/fournisseur/fournisseur.service';

@Component({
  selector: 'app-fournisseur',
  templateUrl: './fournisseur.component.html',
  styleUrls: ['./fournisseur.component.css']
})

export class FournisseurComponent implements OnInit {
  declare fournisseur: any[];

  constructor(
    //private formBuilder:FormBuilder, 
    private fournisseurService:FournisseurService,
    private router:Router) { }

  ngOnInit(): void {
    /*this.form = this.formBuilder.group(
      {
        id:['',Validators.required],
        reference: ['',Validators.required],
        designation: ['',Validators.required],
        descriptif: ['',Validators.required],
        prixVente: ['',Validators.required],
      }
    );*/
    this.getFournisseur();
}

getFournisseur(){
  this.fournisseurService.getAllFournisseur().subscribe(
    data =>{
      console.log(data);
      this.fournisseur = data as any[];
    }
    );
}
}
