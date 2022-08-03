import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PhotoViewer } from '@ionic-native/photo-viewer/ngx';
import { NativeStorage } from '@ionic-native/native-storage/ngx';
import { SocialSharing } from '@ionic-native/social-sharing/ngx';
import { NavController, ToastController } from '@ionic/angular';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { itemCart } from '../models/itemCart-interface';
import { Produit } from '../models/product/product';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.page.html',
  styleUrls: ['./product-detail.page.scss'],
})
export class ProductDetailPage implements OnInit {
product: Produit;
rate: any;
slideOpt={
  speed:1000,
  autoplay:{
    delay:500
  }
};
  constructor(private activatedRoute: ActivatedRoute,
    private http: HttpClient, private photoViewer: PhotoViewer,
    private storage: NativeStorage, private toastCtrl: ToastController,
    private navCtrl: NavController,private sharing: SocialSharing,
    ) { }

  ngOnInit() {
    // eslint-disable-next-line radix
    const id: number = parseInt(this.activatedRoute.snapshot.paramMap.get('id'));
    console.log('id',id);
    //On lance la requête pour récuppérer l'article correspondant à cet 'id'
    this.loadData(id).subscribe(
      data =>{
        this.product=data;
      }
    );

  }

  loadData(id: number): Observable<Produit>{
   const url = `${environment.api_url}/produits`;
   return this.http.get<Produit>(url);
  }
  openCart(){
    this.navCtrl.navigateForward('/cart');
  }
  async share(){
    try {
    await this.sharing.share(
      this.product.designation,
      null,
      null,
      `https://localhost:8100/product-detail/${this.product.id}`
    );
    console.log('sharing OK !');
  } catch (e) {

console.log('error',e);
  }
}

showImage(imgId: number, imgTitle: string){
  this.photoViewer.show(`http://localhost:8085/${this.product.image}`,
  imgTitle,
  {share:true}
  );
}

leaveNote(): void {
  console.log('rate',this.rate);
  //on stocke la moyenne dans'average'
  const average: number =(this.product.averageStar +this.rate) / 2;
   // on arrondi 'average' et on stocke le résultat dans 'aroundi'
   const aroundi: number = Math.ceil(average);
   const utilisateurId: number = this.product.userId;
   const productId: number = this.product.id;
   const url = `${environment.api_url}/user/${utilisateurId}`;
   console.log('url', url);
   this.http.put(url, {averageStar: aroundi})
     .subscribe(res => {
       this.presentToast('Votre note a réussi !', 2000);
     });
}

async addToCart(item: Produit) {
  try {
    let data: itemCart[];
    let added = false;
  data = await this.storage.getItem('Cart');
  console.log('data', data);
  // on vérifie si le panier est vide
  if (data === null || data.length === 0) {
    data.push({
      item,
      qty: 1,
      amount: item.prixVente
    });
  }
  // Si le panier n'est pas vide
  else {
    // eslint-disable-next-line @typescript-eslint/prefer-for-of
    for (let i = 0; i < data.length; i++) {
      const element: itemCart = data[i];
      if (item.id === element.item.id) {
        // le panier contient déjà cette article
        element.qty += 1;
        element.amount += item.prixVente;
        added = true;
      }
    }
  }
  if (!added) {
    // le panier n'est pas vide et ne contient pas l'article
    data.push({
      item,
      qty: 1,
      amount: item.prixVente
    });
  }
    await this.storage.setItem('Cart', data);
    this.presentToast('Votre panier a été mis à jour', 1500);
  }
  catch(e){
    const myData: itemCart[] = [];
    console.log('error', e);
    if (e.code === 2) {
      myData.push({
        item,
      qty:1,
      amount: item.prixVente
    });
    await this.storage.setItem('Cart', myData);
      this.presentToast('Votre panier a été mis à jour', 1500);
    }

}
}
//  on affiche un message toast grace à cette methode
async presentToast(message: string, duration: number) {

  const toast = await this.toastCtrl.create({
    message,
    duration
  });
  toast.present();
}



}

