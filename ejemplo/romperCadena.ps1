# Cadena con saltos de línea
$cadena = "Primera línea`nSegunda línea`nTercera línea"

# Ruta del archivo
$rutaArchivo = ".\\archivito.txt"

# Escribe la cadena en el archivo
$cadena | Out-File -FilePath $rutaArchivo
