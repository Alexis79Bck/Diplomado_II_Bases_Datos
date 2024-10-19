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
  $sql = $conn->prepare("INSERT INTO servicios (nombre, descripcion, duracion, precio, descuento) 
                        VALUES ('Pulido de Carroceria completo', 'Pulido de la corroceria', 60, 45.00, 10)");

  // Ejecutar la consulta
  if ($sql->execute()) {
    echo "<br /> Nuevo servicio agregado con éxito.";
  } else {
    die ("<br /> Error al agregar el servicio: " . $sql->error);
  }
  

  
}

$conn->close();

