import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./home/home.module').then( m => m.HomePageModule)
  },
  {
    path: 'login',
    loadChildren: () => import('./pages/login/login.module').then( m => m.LoginPageModule)
  },
  {
    path: 'register',
    loadChildren: () => import('./pages/register/register.module').then( m => m.RegisterPageModule)
  },
  {
    path: 'informasi',
    loadChildren: () => import('./page/informasi/informasi.module').then( m => m.InformasiPageModule)
  },
  {
    path: 'administrasi',
    loadChildren: () => import('./page/administrasi/administrasi.module').then( m => m.AdministrasiPageModule)
  },
  {
    path: 'jadwal',
    loadChildren: () => import('./page/jadwal/jadwal.module').then( m => m.JadwalPageModule)
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
