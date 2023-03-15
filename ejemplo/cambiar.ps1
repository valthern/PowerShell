$archivoCss = ".\css\estilos.css"
$contenido = Get-Content -Path $archivoCss
# $contenido | ForEach-Object {
#     if ($_ -match "#mi-id.*") {
#         $tipo = $_.GetType().Name
#         Write-Host $tipo
#     }
# }

for ($i = 0; $i -lt $contenido.Count; $i++) {
    if ($contenido[$i] -match "#mi-id.*") {
        Write-Host $contenido[$i + 1]
        $contenido[$i + 1] = "    color:red;"
        break
    }
}

Set-Content -Path $archivoCss -Value $contenido
