# Guia rapida de nombres para evidencias

## Objetivo
Mantener un criterio consistente para que PR y portfolio sean faciles de leer y comparar.

## Convencion recomendada
Formato:

`<orden>-<tipo>-<entorno>-<fecha>.<ext>`

Ejemplo:

`01-plan-dev-2026-04-20.txt`

## Catalogo sugerido

- `01-plan-dev-YYYY-MM-DD.txt`: salida de `terraform plan`.
- `02-apply-dev-YYYY-MM-DD.txt`: salida de `terraform apply` exitoso.
- `03-output-dev-YYYY-MM-DD.txt`: salida de `terraform output` o `terraform output public_ip`.
- `04-aws-arch-dev-YYYY-MM-DD.png`: arquitectura AWS (vista general).
- `05-c4-context-dev-YYYY-MM-DD.png`: diagrama C4 nivel Context.
- `06-c4-container-dev-YYYY-MM-DD.png`: diagrama C4 nivel Container.

## Reglas practicas

- Usa minusculas y guiones medios.
- Evita espacios y caracteres especiales.
- Mantiene el mismo orden numerico para facilitar comparaciones historicas.
- Si cambias entorno (`dev`, `qa`, `prod`), manten el resto del nombre igual.
- Si hay varias iteraciones el mismo dia, agrega sufijo incremental: `-v2`, `-v3`.

## Ubicacion sugerida

Guarda capturas finales en `docs/evidencias/`.
Puedes usar `docs/evidencias/screenshots/` como carpeta temporal de trabajo.
