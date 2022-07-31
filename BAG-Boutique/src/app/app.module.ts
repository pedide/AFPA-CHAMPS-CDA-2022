import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { ClientComponent } from './components/client/client.component';
import { ProduitComponent } from './components/produit/produit.component';
import { FournisseurComponent } from './components/fournisseur/fournisseur.component';
import { HeaderComponent } from './components/header/header.component';
import { CartComponent } from './components/cart/cart.component';
import { ProductsComponent } from './components/products/products.component';
import { AuthenticationService } from './services/authentication/authentication.service';
import { UserService } from './services/user/user.service';
import { AuthInterceptor } from './interceptor/auth.interceptor';
import { NotifierModule } from 'angular-notifier';
import { NotificationModule } from './notification.module';
import { NotificationService } from './services/notification/notification.service';
import { AuthenticationGuard } from './guard/authentication.guard';
import { AppRoutingModule } from './app-routing.module';
import { LoginComponent } from './components/login/login/login.component';
import { RegisterComponent } from './components/register/register/register.component';
import { UserComponent } from './components/user/user.component';
import { FormsModule } from '@angular/forms';
import { CheckoutComponent } from './components/checkout/checkout/checkout.component';





@NgModule({
  declarations: [
    AppComponent,
    ClientComponent,
    ProduitComponent,
    FournisseurComponent,
    HeaderComponent,
    CartComponent,
    ProductsComponent,
    LoginComponent,
    RegisterComponent,
    UserComponent,
    CheckoutComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    NotificationModule,
    FormsModule
    
    
  ],
  providers: [NotificationService,AuthenticationGuard, AuthenticationService, UserService,
    { provide:HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi:true}],
  bootstrap: [AppComponent]
})
export class AppModule { }