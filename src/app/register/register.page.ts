import { Component, OnInit } from '@angular/core';
import { LoginPage } from '../login/login.page';
import {ModalController} from '@ionic/angular';

@Component({
  selector: 'app-register',
  templateUrl: './register.page.html',
  styleUrls: ['./register.page.scss'],
})
export class RegisterPage implements OnInit {

  constructor(
    public modalCtrl: ModalController,
  ) { }

  ngOnInit() {
  }

async login(){
const modal = await this.modalCtrl.create({
  component: LoginPage,
  animated: true,
  mode:'ios',
  backdropDismiss: false,
  cssClass:'login-modal',
});

return await modal.present();
}
}
