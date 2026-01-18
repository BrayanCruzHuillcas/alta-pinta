# Alta Pinta

Sistema web desarrollado con **Spring Boot + Angular + MySQL** para la gestión de una tienda online.

Incluye autenticación con JWT, gestión de productos, carrito de compras, pedidos y panel administrativo.

---

## Tecnologías

- Java 17
- Spring Boot
- Angular
- MySQL
- JWT (JSON Web Token)
- Gmail SMTP

---

## Estructura del Proyecto

backend/ -> API REST desarrollada con Spring Boot  
frontend/ -> Aplicación web desarrollada con Angular  
database/ -> Script SQL para la base de datos  

---

## Instalación Local

### 1️⃣ Backend (Spring Boot)

Configurar las siguientes variables de entorno:

- DB_URL
- DB_USERNAME
- DB_PASSWORD
- MAIL_USERNAME
- MAIL_PASSWORD
- JWT_SECRET
- JWT_EXPIRATION

Luego ejecutar:

```bash
mvn spring-boot:run
