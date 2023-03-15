$archivoCss=".\css\estilos.css"
$nuevoColor="#71fc88"
(Get-Content -Path $archivoCss) -replace "#mi-id\s*{\s*color:\s*gold;","#mi-id { color: $nuevoColor;" | Set-Content -Path $archivoCss
