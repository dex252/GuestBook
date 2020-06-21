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
        this.Equals();
        console.log(error.message);
      });
    }, error => {
      this.countPages = 0;
      console.log(error.message);
    });
  }

  public Equals() {
   
    if (this.countPages == this.page || this.countPages == 0) {
      this.fowardDisabled = true;
    } else this.fowardDisabled = false;
    
    if (this.page == this.minPage || this.countPages == 0) {
      this.backDisabled = true;
    } else this.backDisabled = false;

    if (this.countPages != 0 && this.countPages < this.page){
      this.page = this.countPages;
      this.download();
    
      this.router.navigateByUrl(`/guestbook/${this.sort}/${this.column}/${(Number(this.page))}`); 
    }

    if (this.countPages != 0 && this.page <=0){
      this.page = this.minPage;
      this.download();
    
      this.router.navigateByUrl(`/guestbook/${this.sort}/${this.column}/${(Number(this.page))}`); 
    }
  }

  sortData(column: Column) {
    if (Number(this.column) == Number(column)) 
    if (Number(this.sort) == 0) this.sort = 1; else this.sort = 0;
    this.column = column;
    this.page = 1 ;
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
      if (result != undefined) this.download();
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
    Validators.pattern('[.\\-_a-z0-9]+@([a-z0-9][\\-a-z0-9]+\\.)+[a-z]{2,6}')
  ]);
  
  nameFormControl = new FormControl('', [
    Validators.required,
    Validators.pattern('[A-Za-z0-9\\s]{3,}')
  ]);

  textFormControl = new FormControl('', [
    Validators.required,
    Validators.minLength(1),
    Validators.pattern('^((?!\/\>).)*$')
  ]);

  homePageFormControl = new FormControl('', [
    Validators.pattern('https://.*|http://.*')
  ]);

  constructor(
    public dialogRef: MatDialogRef<DialogOverviewExampleDialog>,
    private api: ApiService,
    @Inject(MAT_DIALOG_DATA) public data: any) { 
      this.message = new Message();
      this.message.Text = "";
      this.message.UserName = "";
      this.message.Email = "";
      this.message.HomePage = "";
    }

    cancelButton(): any {
    this.dialogRef.close();
    }

    clearFields(){
      this.message.UserName = "";
      this.message.Email = "";
      this.message.Text = "";
      this.message.HomePage = "";

      this.nameFormControl.setValue("");
      this.emailFormControl.setValue("");
      this.textFormControl.setValue("");
      this.homePageFormControl.setValue("");
    } 

    async sendMessage(){
      this.message.UserName =  await this.nameFormControl.value;
      this.message.Email =  await this.emailFormControl.value;
      this.message.Text =  await this.textFormControl.value;
      this.message.HomePage =  await this.homePageFormControl.value;

      await this.post();
    }

    post(): any{
        this.api.postMessage(this.message).subscribe(()=>{
          this.dialogRef.close(true);
        }, e=>console.log(e.message));
    }
    
}