export class Fournisseur {

   public idFour: number;
   public rsFour: string;
   public nomFour: string;
   public rueAdressFour: string;
   public cpAdressFour: string;
   public villeAdressFour: string;
   public paysFour: string;
   public telFour: string;
   public faxFour: string;
   public mailFour: string;
   public commande: [];

   constructor(){ 
     this.idFour=0,
     this.rsFour= "",
     this.nomFour= "",
     this.rueAdressFour= "",
     this.cpAdressFour= "",
     this.villeAdressFour= "",
     this.paysFour= "",
     this.telFour= "",
     this.faxFour= "",
     this.mailFour= "",
     this.commande= []
   }
}
