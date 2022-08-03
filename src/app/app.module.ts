import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';
import { FontAwesomeModule, FaIconLibrary } from '@fortawesome/angular-fontawesome';
import { fas } from '@fortawesome/free-solid-svg-icons';
import { far } from '@fortawesome/free-regular-svg-icons';
import { fab } from '@fortawesome/free-brands-svg-icons';
import { IonicModule, IonicRouteStrategy } from '@ionic/angular';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PhotoViewer } from '@ionic-native/photo-viewer/ngx';
import { NativeStorage } from '@ionic-native/native-storage/ngx';
import { SocialSharing } from '@ionic-native/social-sharing/ngx';
import { ImagePicker } from '@ionic-native/image-picker/ngx';
import { FileTransfer} from '@ionic-native/file-transfer/ngx';
import {Camera, CameraOptions} from '@ionic-native/camera/ngx';
import { Stripe } from '@awesome-cordova-plugins/stripe/ngx';
import {UserService} from './services/user/user.service';

@NgModule({
  declarations: [AppComponent],
  imports: [BrowserModule,HttpClientModule, IonicModule.forRoot(), AppRoutingModule, FontAwesomeModule,],
  providers: [{ provide: RouteReuseStrategy, useClass: IonicRouteStrategy,},
  PhotoViewer,
  NativeStorage,
  SocialSharing,
  ImagePicker,
  FileTransfer,
  Camera,
Stripe, AuthenticationService, UserService],
  bootstrap: [AppComponent],
})
export class AppModule {
  constructor(library: FaIconLibrary){
    library.addIconPacks(fas,fab,far);
  }
}
