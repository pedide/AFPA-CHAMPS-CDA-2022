import { DatePipe } from '@angular/common';
import {formatDate} from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/cart/cart.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css'],
  providers: [DatePipe]
})
export class CheckoutComponent implements OnInit {
  private handler:any;
  maDate:any = new Date();
  

  constructor(
    private datePipe: DatePipe,
   
    ){
    this.maDate = this.datePipe.transform(this.maDate, 'yyyy-MM-dd', 'fr');
    
}

  ngOnInit(): void {
    this.loadStripe();
  }

  public pay(amount:any){

    var handler = (<any>window).StripeCheckout.configure({
      key:'pk_test_51KsMNVLKYS2bssV2pv0ZUc8PvK4ziQKAAnSPwoh05b5uAaOslrAeO2AipLfOfzn1TALWgWeCZW1TbRlX9I409bdB00CJ0QpuNZ',//public key
      locale:'auto',
      token: function(token:any){
        //on peut acceder à token ID avec token.id
        //mettre le token ID dans le server-side code pour l'utiliser
        console.log(token)
        alert('Merci pour votre paiement !');
      }
    });

    handler.open({
      name:'Diablement Bon',
      description:'2 widgets',
      amount: amount*100
    });
  }

  public loadStripe(){
    if(!window.document.getElementById('stripe-stripe')){
      var s = window.document.createElement("script");
      s.id = "text/javascript";
      s.src = "https://checkout.stripe.com/checkout.js";
      s.onload = ()=>{
        this.handler = (<any>window).StripeCheckout.configure({
          key:'pk_test_51KsMNVLKYS2bssV2pv0ZUc8PvK4ziQKAAnSPwoh05b5uAaOslrAeO2AipLfOfzn1TALWgWeCZW1TbRlX9I409bdB00CJ0QpuNZ',//public key
          locale:'auto',
          token:function(token:any){
            console.log(token)
            alert("Paiement s'est bien passé !");
          }
        });
      }
      window.document.body.appendChild(s);
    }
  }



}
