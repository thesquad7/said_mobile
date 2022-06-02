import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { AdministrasiPageRoutingModule } from './administrasi-routing.module';

import { AdministrasiPage } from './administrasi.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    AdministrasiPageRoutingModule
  ],
  declarations: [AdministrasiPage]
})
export class AdministrasiPageModule {}
