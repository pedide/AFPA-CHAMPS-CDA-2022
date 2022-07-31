import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { CartComponent } from "./components/cart/cart.component";
import { CheckoutComponent } from "./components/checkout/checkout.component";
import { ClientComponent } from "./components/client/client.component";
import { FournisseurComponent } from "./components/fournisseur/fournisseur.component";
import { LoginComponent } from "./components/login/login.component";
import { ProductsComponent } from "./components/products/products.component";
import { ProduitComponent } from "./components/produit/produit.component";
import { RegisterComponent } from "./components/register/register.component";
import { UserComponent } from "./components/user/user.component";
import { AuthenticationGuard } from "./guard/authentication.guard";

//tableau qui va contenir mes routes
const routes:Routes = [
    {path:'login', component:LoginComponent},
    {path:'register', component:RegisterComponent},
    {path:'checkout', component:CheckoutComponent},
    //{path:'user/management', component:UserComponent, canActivate:[AuthenticationGuard]},
    //{path:'user/management', component : ProductsComponent}, //on l'avais mis juste pour test
    {path:'user/management', component : UserComponent},
    //{path:'',redirectTo:'/login', pathMatch:'full'},
    {path :'', redirectTo:'products',pathMatch:'full'}, 
    {path :'products', component : ProductsComponent},
    {path :'client', component : ClientComponent},
    {path :'produit', component : ProduitComponent},
    {path :'fournisseur', component : FournisseurComponent},
    {path :'cart',component : CartComponent}
 ];

@NgModule({
    imports : [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule{

}
