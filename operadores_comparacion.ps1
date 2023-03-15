<#
    Operadores (al parecer igual que en Bash):
    -igualdad: -eq
    -desigualdad: -ne
    -mayor que: -gt
    -mayor o igual que: -ge
    -menor que: -lt
    -menor o igual que: -le

    Para comparación de cadenas de caracteres (admite comodines):
    -como...: -like
    -no como...: -notlike

    Comparación de cadenas con Expresiones Regulares:
    -(Se empareja con)...: -match
    -(No se empareja con)...: -notmatch

    Operadores de arrays:
    -contiene: -contains
    -no contiene: -notcontains

    Operadores lógicos:
    -Y: -And
    -O: -Or
    -O exclusivo: -Xor
    -No: -Not

    Operadores de tipo de datos:
    -Es (de tipo)...: -is
    -No es (de tipo)...: -isnot
#>

Write-Host "Multiplicación con cadenas:"
Write-Host ("¡Hola!" * 5)
Write-Host ""
Write-Host "Operadores de tipo de dato:"
$a="Hola"
Write-Host ($a -is [int])
Write-Host ($a -isnot [int])
