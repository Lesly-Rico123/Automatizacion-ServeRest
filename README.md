<h1>Continuous Testing - Karate DSL</h1>

<h3>Descripción del Proyecto de automatización</h3>

Este proyecto permite utilizar los metodos nativos del Framework de Karate DSL para las pruebas automatizadas.

Para la ejecución via **Maven** se debe realizar lo siguiente:

```mvn
mvn clean test "-Dkarate.options=--tags @PruebaFinal"
```

"PruebaFinal" es nombre del TAG que se desea ejecutar, en caso se desea ejecutar otro TAG, modificar dicho parametro