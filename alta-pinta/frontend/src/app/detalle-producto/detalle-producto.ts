import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductoService } from '../../services/producto.service';
import { FavoritoService } from '../../services/favorito.service';
import { CarritoService } from '../../services/carrito.service';
import { CarritoStateService } from '../../services/carrito-state.service';
import { CommonModule, DecimalPipe } from '@angular/common';
import { EnvioService } from '../../services/envio.service'; 
import { Router } from '@angular/router'; 

@Component({
  selector: 'app-detalle-producto',
  imports: [CommonModule, DecimalPipe],
  templateUrl: './detalle-producto.html',
  styleUrls: ['./detalle-producto.css']
})
export class DetalleProductoComponent implements OnInit {

  productos: any[] = []; 
  filtrados: any[] = []; 
  categorias: any[] = []; 
  tipos: any[] = []; 
  tallas: any[] = []; 
  favoritosIds: number[] = [];    
  busqueda: string = ""; 
  contadorCarrito = 0; 
  producto: any = null;
  esFav = false;
  loadingCarrito = false;

  constructor(
    private route: ActivatedRoute,
    private productoService: ProductoService,
    private favService: FavoritoService,
    private carritoService: CarritoService,
    private carritoState: CarritoStateService,
    private envioService: EnvioService, 
    private router: Router 
  ) {}

  ngOnInit(): void {
    this.cargarCategorias(); 
    this.cargarFavoritos(); 
    const id = Number(this.route.snapshot.paramMap.get('id'));

    this.productoService.getUno(id).subscribe(p => {
      this.producto = p;

      this.favService.getFavoritos().subscribe(res => {
        this.esFav = res.some((r:any) => r.id === id);
      });
    });
  }

  toggleFav() {
    if (this.esFav) {
      this.favService.eliminar(this.producto.id)
        .subscribe(() => this.esFav = false);
    } else {
      this.favService.agregar(this.producto.id)
        .subscribe(() => this.esFav = true);
    }
  }

  agregarCarrito() {
    this.loadingCarrito = true;

    this.carritoService.agregar(this.producto.id, 1).subscribe(() => {
      this.carritoState.incrementar();
      this.loadingCarrito = false;
    });
  }

  irCategoria(nombre:string){ 
    const ruta = nombre.trim() 
        .toLowerCase() 
        .normalize("NFD").replace(/[\u0300-\u036f]/g, "") 
        .replace(/ñ/g,"n")  
        .replace(/s$/,""); 
    this.router.navigate([`/${ruta}`]); 
  } 

  irMenu(){ 
  this.router.navigate(['/menu']); 
  } 

  cerrarSesion() { 
    //localStorage.clear(); 
    this.router.navigate(['/login']); 
  } 

  irFavoritos(){ 
  this.router.navigate(['/favoritos']); 
  } 

  irCarrito(){ 
    this.router.navigate(['/carrito']); 
  } 

  buscar(){ 
    this.filtrados = this.productos.filter(p => 
      p.nombre.toLowerCase().includes(this.busqueda.toLowerCase()) 
    ); 
  } 
 
  cargarCategorias(){ 
    this.productoService.getCategorias().subscribe(res => this.categorias = res); 
  } 
 
  cargarFavoritos() { 
    this.favService.getFavoritos().subscribe({ 
      next: data => { 
        this.favoritosIds = data.map(f => f.id); 
      }, 

      error: err => { 
        console.error('Error favoritos', err); 
        /*if (err.status === 403) { 
          this.cerrarSesion(); 
        }*/ 
      } 
    }); 
  } 

  irPerfil(){ 
    this.router.navigate(['/perfil']); 
  } 
}
