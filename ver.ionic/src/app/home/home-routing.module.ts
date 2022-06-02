import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomePage } from './home.page';

const routes: Routes = [
  {
    path: 'tabs',
    component: HomePage,
    children: [
      {
        path: 'informasi',
        loadChildren: () => import('../page/informasi/informasi.module').then(m => m.InformasiPageModule)
      },
      {
        path: 'jadwal',
        loadChildren: () => import('../page/jadwal/jadwal.module').then(m => m.JadwalPageModule)
      },
      {
        path: 'administrasi',
        loadChildren: () => import('../page/administrasi/administrasi.module').then(m => m.AdministrasiPageModule)
      },
      {
        path: '',
        redirectTo: '/tabs/informasi',
        pathMatch: 'full'
      }
    ]
  },
  {
    path: '',
    redirectTo: '/tabs/informasi',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
})
export class HomeRoutingModule { }
