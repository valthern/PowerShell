(Get-Content -Path ".\css\estilos.css") -replace "#mi-id\s*{\s*background-color:\s*blue\s*;", "#mi-id { background-color: red;" | Set-Content -Path ".\css\estilos.css"
