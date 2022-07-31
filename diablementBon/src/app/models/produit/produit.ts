export class Produit {
    //on doit mettre exactement ce qu'on a sur postman
    public id: number; 
    public reference: string;
    public designation: string;
    public descriptif: string;
    public prixVente: number;
    public image:string;
   
    constructor(){
        this.id = 0;//initialise les propriétes
        this.reference = '';
        this.designation ='';
        this.descriptif = '';
        this.prixVente = 0;
        this.image ='';
    }
}
