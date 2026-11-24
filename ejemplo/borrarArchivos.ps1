[string]$titulo = "Planeacion"

# [string]$informe = "ResumenCambios-$titulo-" + (Get-Date -Format "yyyyMMdd-HHmm") + ".txt"
[string]$rutaLogs = "C:\_Logs"
[string]$backSlash = '\'

Remove-Item -Path ($rutaLogs + $backSlash + "ResumenCambios-$titulo" + "*.txt")
if ($?) {
    Write-Host "Scripts borrados."
}
else {
    Write-Host "No fue posible borrar los archivos o no fueron encontrados"
}
Read-Host "Presione Enter para salir..."
