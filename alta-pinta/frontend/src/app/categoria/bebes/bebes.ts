import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { ProductoService } from '../../../services/producto.service';
import { FavoritoService } from '../../../services/favorito.service';
import { CarritoService } from '../../../services/carrito.service';
import { AuthService } from '../../auth.service';

@Component({
  selector:'app-bebe',
  standalone:true,
  imports:[CommonModule, FormsModule, RouterModule],
  templateUrl:'./bebes.html',
  styleUrl:'./bebes.css'
})

export class BebesComponent implements OnInit{

  tituloCategoria = "Bebés"; 

  productos:any[] = [];
  filtrados:any[] = [];
  favoritos:number[] = [];
  categorias: any[] = [];
  tipos: any[] = [];
  favoritosIds: number[] = [];
  busqueda: string = "";
  contadorCarrito = 0;
  tipoSeleccionado: string = '';
  tallas: any[] = [];
  tallaSeleccionada: string = '';



  constructor(
    private productoService:ProductoService,
    private favService:FavoritoService,
    private carritoService: CarritoService,
    private router:Router,
    private authService: AuthService
  ){}

    ngOnInit(){
    this.cargarProductosBebes();
    this.cargarTallasBebes();
    this.cargarTiposBebes();
    this.cargarFavoritos();
    this.cargarCategorias();
    this.cargarTipos();

    this.carritoService.contadorObservable$
      .subscribe(c => this.contadorCarrito = c);
  }

  cargarProductosBebes() {
    this.productoService.getPorCategoria("bebe").subscribe(res => {
      this.productos = res;
      this.filtrados = res;
    });
  }

  aplicarFiltros() {
    this.filtrados = this.productos.filter(p => {

      const cumpleTipo =
        !this.tipoSeleccionado ||
        p.tipoPrenda?.nombre === this.tipoSeleccionado;

      const cumpleTalla =
        !this.tallaSeleccionada ||
        p.talla?.nombre === this.tallaSeleccionada;

      return cumpleTipo && cumpleTalla;
    });
  }

  cargarTiposBebes() {
    this.productoService
      .getTiposPorCategoria('bebe')
      .subscribe(res => {
        console.log('TIPOS:', res);
        this.tipos = res;
      });
  }

  cargarTallasBebes() {
    this.productoService
      .getTallasPorCategoria('bebe')
      .subscribe(res => {
        console.log('TALLAS:', res);
        this.tallas = res;
      });
  }

  /*filtrarTalla(): void {
    if (!this.tallaSeleccionada) {
      this.filtrados = this.productos;
      return;
    }

    this.productoService
      .getPorTalla(this.tallaSeleccionada.nombre)
      .subscribe(res => this.filtrados = res);
  }*/

  filtrarTalla() {
    this.aplicarFiltros();
  }

  cargarFavoritos(){
    this.favService.getFavoritos().subscribe((r:any[])=>{
      this.favoritos = r.map(f=>f.id);
    });
  }

  toggleFavorito(p:any){
    if(this.favoritos.includes(p.id)){
      this.favService.eliminar(p.id).subscribe(()=> this.favoritos = this.favoritos.filter(id=>id!==p.id));
    }else{
      this.favService.agregar(p.id).subscribe(()=> this.favoritos.push(p.id));
    }
  }

  verDetalles(p:any){
    this.router.navigate(['/detalle',p.id]);
  }

  irCategoria(nombre:string){
    const ruta = nombre.trim()
        .toLowerCase()
        .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
        .replace(/ñ/g,"n") 
        .replace(/s$/,"");

    this.router.navigate([`/${ruta}`]);
  }

  /*buscar(){
    this.filtrados = this.productos.filter(p =>
      p.nombre.toLowerCase().includes(this.busqueda.toLowerCase())
    );
  }*/

  buscar() {
    this.aplicarFiltros();
  }

  irFavoritos(){
  this.router.navigate(['/favoritos']);
  }

  irCarrito(){
    this.router.navigate(['/carrito']);
  }

  esFavorito(id:number){
    return this.favoritosIds.includes(id);
  }

  cargarCategorias(){
    this.productoService.getCategorias().subscribe(res => this.categorias = res);
  }

  cargarTipos(){
    this.productoService.getTipos().subscribe(res => this.tipos = res);
  }

  cargarTallas(){
    this.productoService.getTallas().subscribe(res => this.tallas = res);
  }

  filtrarTipo(tipo: string) {
    this.tipoSeleccionado = tipo;
    this.aplicarFiltros();
  }

  irMenu(){
  this.router.navigate(['/menu']);
  }

  cerrarSesion() { 
    //localStorage.clear(); 
    this.authService.logout();
  } 

  agregarCarrito(p:any){
    this.carritoService.agregar(p.id).subscribe({
      next: () => {
        // opcional: toast / animación
        console.log('Producto agregado al carrito');
      }
    });
  }

  irPerfil(){ 
    this.router.navigate(['/perfil']); 
  } 
}


  
