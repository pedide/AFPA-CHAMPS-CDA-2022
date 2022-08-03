import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CartComponent } from './components/cart/cart.component';
import { CheckoutComponent } from './components/checkout/checkout.component';
import { ClientComponent } from './components/client/client.component';
import { LoginComponent } from './components/login/login.component';
import { ProductsComponent } from './components/products/products.component';
import { ProduitComponent } from './components/produit/produit.component';
import { RegisterComponent } from './components/register/register.component';
import { UserComponent } from './components/user/user.component';
import { AuthenticationGuard } from './guard/authentication.guard';

const routes: Routes = [
  {path:'products',component:ProductsComponent},

  {path:'',redirectTo:'products',pathMatch:'full'},

  {path:'login',component:LoginComponent},
  {path:'register', component:RegisterComponent},
  {path:'checkout',component:CheckoutComponent},
{
  path:'user/management',
  component:CheckoutComponent,
},

  /* {path:'user/management',component:UserComponent,canActivate:[AuthenticationGuard]},
  {path:'',redirectTo:'/login',pathMatch:'full'},
   */
 
  
  {path :'client',component : ClientComponent},

  {path :'produit',component : ProduitComponent},
  
  {path :"cart",component:CartComponent},

  {path: 'user', component: UserComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
