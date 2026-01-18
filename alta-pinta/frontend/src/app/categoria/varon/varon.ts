import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { ProductoService } from '../../../services/producto.service';
import { FavoritoService } from '../../../services/favorito.service';
import { CarritoService } from '../../../services/carrito.service';
import { AuthService } from '../../auth.service';

@Component({
  selector:'app-varon',
  standalone:true,
  imports:[CommonModule, FormsModule, RouterModule],
  templateUrl:'./varon.html',
  styleUrl:'./varon.css'
})
export class VaronComponent implements OnInit{

  tituloCategoria = "Varones"; 

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
  //tallaSeleccionada: any = null;
  tallaSeleccionada: string = '';

  constructor(
    private productoService:ProductoService,
    private favService:FavoritoService,
    private carritoService: CarritoService,
    private router:Router,
    private authService: AuthService
  ){}

  ngOnInit(){
    this.cargarProductosVaron();
    this.cargarTallasVaron();
    this.cargarTiposVaron();
    this.cargarFavoritos();
    this.cargarCategorias();
    
    this.carritoService.contadorObservable$
      .subscribe(c => this.contadorCarrito = c);
  }

  cargarProductosVaron(){
    this.productoService.getPorCategoria("varon").subscribe(res=>{
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

  /*filtrarTipo(tipo:string){
    this.productoService.getPorTipo(tipo).subscribe(res => this.filtrados = res);
  }*/

  filtrarTipo(tipo: string) {
    this.tipoSeleccionado = tipo;
    this.aplicarFiltros();
  }

  cargarTiposVaron() {
    this.productoService
      .getTiposPorCategoria('varon')
      .subscribe(res => {
        console.log('TIPOS:', res);
        this.tipos = res;
      });
  }

  cargarTallasVaron() {
    this.productoService
      .getTallasPorCategoria('varon')
      .subscribe(res => {
        console.log('TALLAS:', res);
        this.tallas = res;
      });
  }

  /*filtrarTalla(): void {
    if (!this.tallaSeleccionada || this.tallaSeleccionada === "Todos") {
      return this.cargarProductosMujer(); 
    }

    this.productoService.getPorTalla(this.tallaSeleccionada).subscribe(data => {
      this.productos = data;
    });
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

  buscar(){
    this.filtrados = this.productos.filter(p =>
      p.nombre.toLowerCase().includes(this.busqueda.toLowerCase())
    );
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

  /*filtrarTipo(tipo:string){
    this.productoService.getPorTipo(tipo).subscribe(res => this.filtrados = res);
  }*/

  irMenu(){
  this.router.navigate(['/menu']);
  }

  cerrarSesion() { 
    //localStorage.clear(); 
    this.authService.logout();
  } 

  irPerfil(){ 
    this.router.navigate(['/perfil']); 
  } 

  agregarCarrito(p:any){
    this.carritoService.agregar(p.id).subscribe({
      next: () => {
        // opcional: toast / animación
        console.log('Producto agregado al carrito');
      }
    });
  }
}
