import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GuestBookComponent } from "./pages/guest-book/guest-book.component"

const routes: Routes = [ 
  { path: '', redirectTo: '/guestbook/0/0/1', pathMatch: 'full' },
  { path: 'guestbook/:sort/:column/:page', component: GuestBookComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
 
export class AppRoutingModule { }