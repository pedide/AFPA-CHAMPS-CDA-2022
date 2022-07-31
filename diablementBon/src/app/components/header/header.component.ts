import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user/user';
import { AuthenticationService } from 'src/app/services/authentication/authentication.service';
import { CartService } from 'src/app/services/cart/cart.service';
import { ProduitService } from 'src/app/services/produit/produit.service';
import { UserService } from 'src/app/services/user/user.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  public totalItem:number = 0;
  public user:User = new User();
 /* public products: Product[] = [];*/

  constructor(
    private cartService:CartService,
    private userService:UserService,
    private authenticationService:AuthenticationService,
    private produitService:ProduitService) { }

  ngOnInit(): void {
    this.cartService.getProducts().subscribe(
      res =>{
        console.log(res);
        this.totalItem = res.length;//nb elem de ma liste
      }
    );

    /*ajout h */
    this.user = this.authenticationService.getUserFromLocalCache();
  
  }



/* a modifier*/ 
  /*public searchProducts(searchTerm:string):void{
    console.log(searchTerm);
    const results:User[]=[];
    for(const user of this.userService.getUsersFromLocalCache())
    {if(user.firstName.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 || 
      user.lastName.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 ||
      user.username.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 ||
      user.userId.toLowerCase().indexOf(searchTerm.toLocaleLowerCase()) !==-1 ){
        results.push(user);
      }

    }
    this.users = results;
    if(results.length===0 || !searchTerm){
      this.users = this.userService.getUsersFromLocalCache();

    } 
  }*/

  logout():void{
    this.authenticationService.clearToken();
    
  }

  logOut():void{
    
  }

  login(){

  }
}
