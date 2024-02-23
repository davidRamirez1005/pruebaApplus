
# SOLUCION PRUEBA 2

### => Consulta 1 - Libros Prestados:

ncuentra el título y el autor de los libros actualmente prestados, junto
con el nombre del usuario que los tiene prestados. Incluye también la
fecha de préstamo y la fecha de devolución.

```sql
SELECT prestamo.fecha_prestamo, prestamo.fecha_devolucion, libro.titulo AS titulo_libro, libro.autor, usuario.nombre AS nombre_usuario
FROM prestamo
INNER JOIN libro
ON libro.id = prestamo.libro_id
INNER JOIN usuario
ON usuario.id = prestamo.usuario_id
WHERE prestamo.fecha_devolucion IS NOT NULL
```

#### => Consulta 2 - Libros No Devueltos en 7 días:

• Encuentra los títulos y autores de los libros que fueron prestados hace
más de 7 días y aún no han sido devueltos. Incluye el nombre del
usuario que los tiene prestados y la fecha de préstamo.

```sql
SELECT prestamo.fecha_prestamo AS fecha_prestamo, prestamo.fecha_devolucion AS fecha_devolucion, libro.titulo AS titulo_libro, libro.autor, usuario.nombre AS nombre_usuario
FROM prestamo
INNER JOIN libro
ON libro.id = prestamo.libro_id
INNER JOIN usuario
ON usuario.id = prestamo.usuario_id
WHERE prestamo.fecha_devolucion IS NULL AND DATEDIFF(CURDATE(), fecha_prestamo) > 7;

```

# SOLUCION PRUEBA 1

```
http://localhost:8000/product
```

METODOS:
GET
POST
PUT
DELETE

Ejemplo de data a insertar
```json
{
  "code": "ABC123",
  "name": "Sample Product",
  "category": 1,
  "price": 19.99,
  "createdAt": "2024-02-23",
  "updatedAt": "2024-02-23"
}
```


