import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class EnvioService {

  private API = `${environment.apiUrl}/envio`;

  constructor(private http: HttpClient) {}

  obtenerTodos(): Observable<any[]> {
    return this.http.get<any[]>(this.API);
  }
}
