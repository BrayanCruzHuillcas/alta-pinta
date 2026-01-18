import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { environment } from '../environments/environment';

export interface Producto {
  id: number;
  nombre: string;
  precio: number;
  stock: number;
  descripcion?: string;
}

export interface TipoPrenda {
  id: number;
  nombre: string;
}

export interface Talla {
  id: number;
  nombre: string;
}

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  private URL = `${environment.apiUrl}`;

  constructor(private http: HttpClient) {}

  getTodos(){ return this.http.get<any[]>(`${this.URL}/productos`); }
  getUno(id:number){ return this.http.get<any>(`${this.URL}/productos/${id}`); }

  getCategorias(){ return this.http.get<any[]>(`${this.URL}/categorias`); }
  getPorCategoria(nombre:string){ return this.http.get<any[]>(`${this.URL}/productos/categoria/${nombre}`); }

  getTipos(){ return this.http.get<any[]>(`${this.URL}/tipos`); }
  getPorTipo(nombre:string){ return this.http.get<any[]>(`${this.URL}/productos/tipo/${nombre}`); }

  getTallas(){ return this.http.get<any[]>(`${this.URL}/tallas`); }
  getPorTalla(nombre:string){ return this.http.get<any[]>(`${this.URL}/productos/talla/${nombre}`); }

  crearProducto(data:any){ return this.http.post(`${this.URL}/productos`,data); }
  editarProducto(id:number,data:any){ return this.http.put(`${this.URL}/productos/${id}`,data); }
  eliminarProducto(id:number){ return this.http.delete(`${this.URL}/productos/${id}`); }

  getTiposPorCategoria(categoria: string) {
    return this.http.get<TipoPrenda[]>(
      `${this.URL}/tipos/categoria/${categoria}`
    );
  }

  getTallasPorCategoria(categoria: string) {
    return this.http.get<Talla[]>(
      `${this.URL}/tallas/categoria/${categoria}`
    );
  }

  listar(): Observable<Producto[]> {
    return this.http.get<Producto[]>(this.URL);
  }

}

