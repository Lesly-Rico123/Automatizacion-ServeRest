<h1>Continuous Testing - Karate DSL</h1>

<h3>Descripción del Proyecto de automatización</h3>

Este proyecto permite utilizar los metodos nativos del Framework de Karate DSL para las pruebas automatizadas.

Para la ejecución via **Maven** se debe realizar lo siguiente:

```mvn
mvn clean test "-Dkarate.options=--tags @PruebaFinal"
```
"@PruebaFinal" es nombre del TAG que ejecuta todos los métodos del usuario, en caso se desea ejecutar otro TAG, modificar dicho parametro
el TAG "@ActualizarUsuario" es para el método PUT/usuarios/{_id}
el TAG "@EliminarUsuarioId" es para el método DELETE/usuarios/{_id}
el TAG "@BuscarUsuarioPorId" es para el método GET/usuarios/{_id}
el TAG "@CrearUsuario" es para el método POST/usuarios
el TAG "@ListarUsuarios" es para el método GET/usuarios

