import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ProductoService } from '../../services/producto.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-producto',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './productos.html',
  styleUrls: ['./productos.css']
})
export class ProductoComponent implements OnInit {

  productos: any[] = [];

  categorias: any[] = [];
  tipos: any[] = [];
  tallas: any[] = [];

  producto = {
    id: null,
    nombre: '',
    descripcion: '',
    stock: 0,
    precio: 0,         
    imagenUrl: '',
    categoria: null,
    tipoPrenda: null,
    talla: null,
  }

  modoEdicion = false;

  constructor(private service: ProductoService, private router: Router) {}

  ngOnInit(): void {
    this.listar();
    this.service.getCategorias().subscribe(res => this.categorias = res);
    this.service.getTipos().subscribe(res => this.tipos = res);
    this.service.getTallas().subscribe(res => this.tallas = res);
  }

  listar(){
    this.service.getTodos().subscribe(res => this.productos = res);
  }

  guardar(){
    if(!this.modoEdicion){
      this.service.crearProducto(this.producto).subscribe(()=>{
        this.listar();
        this.limpiar();
      });
    } else {
      this.service.editarProducto(this.producto.id!, this.producto).subscribe(()=>{
        this.listar();
        this.limpiar();
        this.modoEdicion = false;
      });
    }
  }

  editar(p:any){
    this.producto = { ...p };
    this.modoEdicion = true;
  }

  eliminar(id:number){
    if(confirm("¿Seguro de eliminar este producto?")){
      this.service.eliminarProducto(id).subscribe(()=>{
        this.listar();
      });
    }
  }

  limpiar(){
    this.producto = {
      id:null, nombre:'', descripcion:'', stock:0, precio:0, imagenUrl:'',
      categoria:null, tipoPrenda:null, talla:null
    }
  }

  irProductos() {
    this.router.navigate(['/productos']);
  }

  irAdmin() {
    this.router.navigate(['/admin']);
  }
}
