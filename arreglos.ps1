$enteros = @(1, 2, 3, 4, 5, 6, 7, 8, 9)
Write-Host $enteros[4]
# empieza desde atrás
Write-Host $enteros[-2]
Write-Host $enteros.Length
# Se añaden elementos con el operador "+="
$enteros += 10
Write-Host $enteros
Write-Host ""
<#  No se pueden eliminar elementos porque son de tipo estático.
    Para poder eliminar deberíamos crear otro array con todos 
    los elementos, menos el que deseamos elmiminar.

    Para hacer arrays dinámicos se utilizan los "ArrayList"
#>
[System.Collections.ArrayList]$caps = "A", "B", "C", "D", "E"
for ($i = 0; $i -lt $caps.Count; $i++) {
    Write-Host $caps[$i]
}
$caps.Remove("B")
Write-Host $caps
Write-Host ""
# Concatenar dos arrays
$a = @(2, 3)
$b = 4, 5
$c = $a + $b
Write-Host $c
$c -join '-'
#Write-Host $c
