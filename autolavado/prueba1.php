<?php
// Datos de conexión a la base de datos
$servername = "127.0.0.1"; // Reemplaza con el nombre de tu servidor MySQL
$username = "dba_autolavado";   // Reemplaza con el nombre de usuario de tu base de datos
$password = "autolavado"; // Reemplaza con la contraseña de tu base de datos
$dbname = "autolavado_db";  // Nombre de la base de datos

// Crear una conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
  die("Conexión fallida: " . $conn->connect_error);
} else {
  echo "Conexión exitosa...";
  echo "<br />";
  echo "<br />";
  print_r($conn);
  // Preparar la consulta SQL (sentencia preparada para prevenir inyección SQL)
  $stmt = $conn->prepare("INSERT INTO servicios (nombre, descripcion, duracion, precio, descuento) 
                        VALUES ('Lavado completo', 'Lavado exterior e interior del vehículo', 60, 30.00, 8)");

  // Ejecutar la consulta
  if ($stmt->execute()) {
    echo "Nuevo servicio agregado con éxito.";
  } else {
    echo "Error al agregar el servicio: " . $stmt->error;
  }
  
  // Cerrar la sentencia
  $stmt->close();
}