import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/cart/cart.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {
private handler: any;
  constructor() { }

  ngOnInit(): void {
    this.loadStripe();
  }

  public pay(amount: any){

    var handler = (<any>window).StripeCheckout.configure({
      key:'pk_test_51KsMRKJtAklxDm4Bv0MYbaUPvnRjPaGdcVJs4IJmXjyoivN6szIMVJXTiBuqwCdTU71lvxWa5BIOM6Q8DzJHOeXt009HsWe9KP', //public key
      locale:'auto',
      token: function(token: any){
        //you can access the token ID with 'token.id'
        //get the token ID to your server-side code for use.
        console.log(token)
        alert('Thanks for your payement!!')
      }
    });

    handler.open({
      name:'RATP Connect',
      description:'2 articles',
      amount: amount*100
    });
  }

  public loadStripe(){
    if(!window.document.getElementById('stripe-script')){
      var s = window.document.createElement("script");
      s.id ="stripe-script";
      s.type = "text/javascript";
      s.src = "https://checkout.stripe.com/checkout.js";
      s.onload=() => {
        this.handler = (<any>window).StripeCheckout.configure({
          key:'sk_test_51KsMRKJtAklxDm4Buql8FQ11EWJQbAooEyCwQ11Z5y3Kbbkb2Sk3YI8zuKqkAAe5zrFt7PxUvVYviGohw9Plpzfs00IBUANThU', //secret key
          locale:'auto',
          token: function (token: any){
            //you can access the token ID with 'token.id'
            //get the token ID to your server-side code for use.
            console.log(token)
            alert('Payement Success!!')
      }
    });
  }
  window.document.body.appendChild(s);
}
  }
}

