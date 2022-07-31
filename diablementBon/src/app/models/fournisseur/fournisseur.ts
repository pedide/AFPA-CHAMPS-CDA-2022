export class Fournisseur {

        public idFour: number;
        public nomFournisseur: string;
        public raisonSocial: string;
        public adresseFour : string;
        public cpFour: string;
        public villeFour: string;
        public paysFour: string;
        public telFour: string;
        public faxFour: string;
        public emailFour: string;
        public commande: []

        constructor(){
            this.idFour = 0;
            this.nomFournisseur = '';
            this.raisonSocial = '';
            this.adresseFour = '';
            this.cpFour = '';
            this.villeFour = '';
            this.paysFour = '';
            this.telFour = '';
            this.faxFour = '';
            this.emailFour = '';
            this.commande = [];
        }
}