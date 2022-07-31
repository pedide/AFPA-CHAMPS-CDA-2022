
import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { windowCount } from 'rxjs';
import { CartService } from 'src/app/services/cart/cart.service';


@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css'],
  providers: [DatePipe]
})
export class CheckoutComponent implements OnInit {
  private handler:any;
  public products:any=[];
  
 
  myDate: any = new Date();
constructor(private datePipe: DatePipe ,private cartService:CartService,
   ){
    this.myDate = this.datePipe.transform(this.myDate, 'yyyy-MM-dd','fr');
}

  ngOnInit(): void {
    this.cartService.getProducts().subscribe(
      res=>{
        this.products=res;
   
  }
  );

    this.loadStripe();
  }
  public pay(amount: any){
  var handler = (<any>window).StripeCheckout.configure({
    key:'pk_test_51KsMNtC2CASgLiYFMWKMzQIMb2qsFpb0Y3Hs1oi7wbfU348UJBYAXeb4XowazinoQZUJeX37Y76EMIZJlYYePTkH00cH0D6uOp',//public key
    locale: 'auto',
    token: function (token: any){
      console.log(token)
      alert('Thenks for your payment||');
    }
  });
  
handler.open({
  name: 'EDIDEBS SAS',
  description: '2 widgets',
  amout: amount * 100
});
}

public loadStripe(){
  if(!window.document.getElementById('stripe-script')){
    var s = window.document.createElement("script");
    s.id = "stripe-script";
    s.type = "text/javascript";
    s.src = "https://checkout.stripe.com/checkout.js";
    s.onload = ()=>{
      this.handler = (<any>window).StripeCheckout.configure({
        key:'pk_test_51KsMNtC2CASgLiYFMWKMzQIMb2qsFpb0Y3Hs1oi7wbfU348UJBYAXeb4XowazinoQZUJeX37Y76EMIZJlYYePTkH00cH0D6uOp',// public key
        locale: 'auto',
        token: function(token: any){
          console.log(token)
          alert('Payement Success!!');
        }

      });
    }
    window.document.body.appendChild(s);
  }
}

}