import { Component, OnInit, Injectable, Input } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';

import { ApiService } from '../../services/api.service';
import { Message } from '../../models/message';
import { cwd } from 'process';
import { Column } from '../../models/table.enum';

@Component({
  selector: 'app-guest-book',
  templateUrl: './guest-book.component.html',
  styleUrls: ['./guest-book.component.css']
})

export class GuestBookComponent implements OnInit {
  sort: any;
  column: any;
  page: any;
  messages: Message[];

  minPage: any = 1;

  radius: number = 10;
  color: string = "#BA55D3";

  countPages: number;

  backDisabled: boolean;
  fowardDisabled: boolean;

  displayedColumns = ["userName", "email", "created", "text"];

  constructor(private route: ActivatedRoute, private router: Router, private api: ApiService) {
  }

  ngOnInit(): void {
    this.sort = this.route.snapshot.paramMap.get('sort');
    this.column = this.route.snapshot.paramMap.get('column');
    this.page = this.route.snapshot.paramMap.get('page');

    this.download();
  }

  public async download() {
    this.api.getCountPages().subscribe((count: number) => {
      this.countPages = count;
      this.api.getMessages(this.column, this.sort, this.page).subscribe((messages: Message[]) => {
        this.messages = messages;
        this.Equals();
      }, error => {
        console.log(error.message);
      });
    }, error => {
      console.log(error.message);
    });
  }

  public Equals() {
    if (this.countPages == this.page) {
      this.fowardDisabled = true;
    } else this.fowardDisabled = false;

    if (this.page == this.minPage) {
      this.backDisabled = true;
    } else this.backDisabled = false;

  }

  sortData(column: Column) {
    if (Number(this.column) == Number(column)) 
    if (Number(this.sort) == 0) this.sort = 1; else this.sort = 0;
    this.column = column;
    this.download();
    
    this.router.navigateByUrl(`/guestbook/${this.sort}/${this.column}/${(Number(this.page))}`); 
    }



  public backButton() {
    this.page = (Number(this.page) - 1 );
    this.download();
    this.router.navigateByUrl(`/guestbook/${this.sort}/${this.column}/${(Number(this.page))}`);    
  }

  public fowardButton() {
    this.page = (Number(this.page) + 1 );
    this.download();
    this.router.navigateByUrl(`/guestbook/${this.sort}/${this.column}/${(Number(this.page))}`);
  }

  post(){
    this.api.getIPAddress().subscribe((ip: string)=> {
      console.log(ip);
      this.messages[0].Ip = ip;
      console.log(this.messages[0]);
      this.api.postMessage(this.messages[0]).subscribe(()=>{

      }, e=>console.log(e.message));
  }, e => {
    console.log(e.message);
    this.api.postMessage(this.messages[0]).subscribe(()=>{

    }, e=>console.log(e.message));
  });
  }
}
