<#!/usr/bin/env pwsh#>
<#
Para saber el resultado de la última operación se puede utilizar la variable "$?", 
la cual registra el resultado booleano de la operación realizada.
#>

[int]$edad = Read-Host "Introduce tu edad"
if ($edad -ge 18) {
    Write-Host "Eres mayor de edad"
}
elseif (($edad -lt 18) -and ($edad -ge 13)) {
    Write-Host "Eres adolescente"
}
else {
    Write-Host "Eres menor de edad"
}

$color = Read-Host "Introduce el color del semáforo (rojo, verde o amarillo)"
switch ($color) {
    'rojo' {
        Write-Host "No puedes pasar."
        Break
    }
    'amarillo' {
        Write-Host "Precaución."
        Break
    }
    'verde' {
        Write-Host "Puedes pasar."
        Break
    }
    Default { "No se acepta este color." }
}

[int]$nota = Read-Host"Introduce tu nota"
switch ($nota) {
    { $_ -in 6..10 } {
        Write-Host "Aprobado"
        Break
    }
    { $_ -in 0..5 } {
        Write-Host "Suspenso"
        break
    }
    Default { Write-Host "Nota no válida" }
}