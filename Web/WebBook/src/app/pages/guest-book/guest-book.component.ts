import { Component, OnInit, Inject } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormControl, Validators, ReactiveFormsModule, FormsModule} from '@angular/forms';

import { ApiService } from '../../services/api.service';
import { Message } from '../../models/message';
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

  constructor(
    public dialog: MatDialog,
    private route: ActivatedRoute, 
    private router: Router, 
    private api: ApiService) {
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

  openDialog(): void{
    let dialogRef = this.dialog.open(DialogOverviewExampleDialog, {
      width: '50%',
      minWidth: '300px'
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      
    });
  }

}

@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'dialog-overview-example-dialog.html',
  styleUrls: ['./guest-book.component.css']
})
export class DialogOverviewExampleDialog {

  message: Message;

  emailFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  nameFormControl = new FormControl('', [
    Validators.required,
    Validators.minLength(3)
  ]);

  textFormControl = new FormControl('', [
    Validators.required,
    Validators.minLength(1)
  ]);

  constructor(
    public dialogRef: MatDialogRef<DialogOverviewExampleDialog>,
    private api: ApiService,
    @Inject(MAT_DIALOG_DATA) public data: any) { 
      this.message = new Message();
      this.message.Text = "";
      this.message.UserName = "";
      this.message.Email = "";
    }

    cancelButton(): void {
    this.dialogRef.close();
    }

    clearFields(){
      this.message.UserName = "";
      this.message.Email = "";
      this.message.Text = "";

      this.nameFormControl.setValue("");
      this.emailFormControl.setValue("");
      this.textFormControl.setValue("");
    } 

    sendMessage(){
      this.message.UserName =  this.nameFormControl.value;
      this.message.Email =  this.emailFormControl.value;
      this.message.Text =  this.textFormControl.value;
    }

    post(){
      this.api.getIPAddress().subscribe((ip: string)=> {
        this.message.Ip = ip;
        this.api.postMessage(this.message).subscribe(()=>{
        }, e=>console.log(e.message));
    }, e => {
      console.log(e.message);
      this.api.postMessage(this.message).subscribe(()=>{
      }, e=>console.log(e.message));
      });
    }
}