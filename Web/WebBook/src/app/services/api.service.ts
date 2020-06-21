import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { timeout, map } from 'rxjs/operators';
import { environment } from '../../environments/environment.prod';

import { Sort, Column } from '../models/table.enum';
import { Message } from '../models/message';

@Injectable({
  providedIn: 'root'
})

export class ApiService {

  constructor(private http: HttpClient) { }

  getMessages(column: Column, sort: Sort, startIndex: number): Observable<Message[]>{
    return this.http.get<Message[]>(`${environment.url}/api/message/${column}/${sort}/${startIndex}`).pipe(timeout(10000));
  }

  getCountPages(): Observable<number>{
    return this.http.get<number>(`${environment.url}/api/message/count`).pipe(timeout(10000));
  }

  postMessage(message: Message): Observable<Boolean>{
    console.log('start');
    return this.http.post<Boolean>(`${environment.url}/api/message`, message).pipe(timeout(10000));
  }

  //TODO: insecure
  getIPAddress(): Observable<any> 
  {  
    return this.http.get<any>("http://api.ipify.org/?format=json").pipe(map(data=> {return data.ip;}));  
  } 
}
