import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AdministrasiPage } from './administrasi.page';

const routes: Routes = [
  {
    path: '',
    component: AdministrasiPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AdministrasiPageRoutingModule {}
