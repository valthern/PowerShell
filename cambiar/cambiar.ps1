<#

Configuración post-instalación:

Previamente a nivel de la carpeta wwwroot se debe ejecutar este comando con el nombre de la carpeta del proyecto:
> icacls .\<NombreCarpeta>\ /grant <usuario>:RX /T

Donde ".\<NombreCarpeta>\" es el directorio del proyecto (aplicativo) y "<usuario>" es el usuario al que se le otorgan los permisos.
(Descripción del comando en: https://learn.microsoft.com/es-es/windows-server/administration/windows-commands/icacls)
Con esto se otorgan permisos de ejecución y lectura, suficientes para ejecutar el script de PowerShell.

#>

[string]$srvApps = "lmg-servicios"
[string]$thisComp = HOSTNAME.EXE
[string]$errorNoComp = " no es un equipo valido, por lo tanto no se hizo absolutamente ni madres."

if ($thisComp -eq $srvApps) {
    Write-Host "Recolectando datos..."

    [string]$informe = "Resumen-Cotizador-" + (Get-Date -Format "yyyyMMdd-HHmm") + ".txt"
    [string]$textoInforme = ""
    [string]$rutaLogs = "C:\_Logs"
    [string]$backSlash = '\'
    [string]$BR = "\n"
    [string]$archivoCadCon = ".\csCotizador.config"
    [string]$archivoCssPrincipal = ".\css\Principal.css"
    [string]$archivoCssLogin = ".\css\Login.css"
    [string]$srvDesarrollo = "TIC-DESARROLLO\DEVELOPMENT"
    [string]$srvProduccion = "10.0.0.4\PRODUCCION"
    [string]$bdCorporacion = "Magno2_BD"
    [string]$bdInfinito = "Magno3_BD"
    [string]$bd = "Magno\d{1}_BD"
    [string]$colorDesarrollo = '#FECE00'
    [string]$colorCorporacion = '#C2F29F'
    [string]$colorInfinito = "#87CEFA" # LightSkyBlue

    [int]$compañia = Read-Host "Selecciona la compañia: 2.-Corporacion, 3.-Infinito"
    if ($compañia -ne 2 -and $compañia -ne 3) {
        Read-Host "No es una opción válida. Se saldrá de la ejecución del script"
        exit
    }

    $contenidoCadCon = Get-Content -Path $archivoCadCon -Raw
    if ($?) {
        $textoInforme += "Se obtuvo el contenido del archivo .config de la connectionString." + $BR
    }
    else {
        $textoInforme += "No se pudo obtener el contenido del archivo .config de la connectionString." + $BR
    }

    $contenidoCssPrincipal = Get-Content -Path $archivoCssPrincipal -Raw
    if ($?) {
        $textoInforme += "Se obtuvo el contenido del archivo .css Principal." + $BR
    }
    else {
        $textoInforme += "No se pudo obtener el contenido del archivo .css Principal." + $BR
    }

    $contenidoCssLogin = Get-Content -Path $archivoCssLogin -Raw
    if ($?) {
        $textoInforme += "Se obtuvo el contenido del archivo .css Login." + $BR
    }
    else {
        $textoInforme += "No se pudo obtener el contenido del archivo .css Login." + $BR
    }

    Write-Host "Ejecutando cambios..."

    $contenidoCadCon = $contenidoCadCon -replace $srvDesarrollo, $srvProduccion
    if ($compañia -eq 2) {
        $contenidoCadCon = $contenidoCadCon -replace $bd, $bdCorporacion
        $contenidoCssPrincipal = $contenidoCssPrincipal -replace $colorDesarrollo, $colorCorporacion
        $contenidoCssLogin = $contenidoCssLogin -replace $colorDesarrollo, $colorCorporacion
    } elseif ($compañia -eq 3) {
        $contenidoCadCon = $contenidoCadCon -replace $bd, $bdInfinito
        $contenidoCssPrincipal = $contenidoCssPrincipal -replace $colorDesarrollo, $colorInfinito
        $contenidoCssLogin = $contenidoCssLogin -replace $colorDesarrollo, $colorInfinito
    }

    Set-Content -Path $archivoCadCon -Value $contenidoCadCon
    if ($?) {
        $textoInforme += "Se actualizó el contenido del archivo .config de la connectionString." + $BR
    }
    else {
        $textoInforme += "No se pudo actualizar el contenido del archivo .config de la connectionString." + $BR
    }

    Set-Content -Path $archivoCssPrincipal -Value $contenidoCssPrincipal
    if ($?) {
        $textoInforme += "Se actualizó el contenido del archivo .css Principal." + $BR
    }
    else {
        $textoInforme += "No se pudo actualizar el contenido del archivo .css Principal." + $BR
    }

    Set-Content -Path $archivoCssLogin -Value $contenidoCssLogin
    if ($?) {
        $textoInforme += "Se actualizó el contenido del archivo .css Login." + $BR
    }
    else {
        $textoInforme += "No se pudo actualizar el contenido del archivo .css Login." + $BR
    }

    Add-Content -Path ($rutaLogs + $backSlash + $informe) -Value $textoInforme
    if ($?) {
        Write-Host "Se creó un informe de ejecución."
    }
    else {
        Write-Host "No se pudo crear el archivo del informe de ejecución."
    }

    Read-Host "Ejecución Terminada. Presione Enter para salir y borrar este script."
    Remove-Item .\cambiar.ps1
    if ($?) {
        Write-Host "...Script borrado. Adiosín..."
    }
    else {
        Write-Host "No fue posible borrar este script."
    }
}
else {
    Read-Host $thisComp + $errorNoComp + "\nPresione Enter para salir..."
}
