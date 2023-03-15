#[string]$tipo
$contenido = Get-Content -Path .\css\estilos.css
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

$contenido | Set-Content -Path .\css\estilos.css
