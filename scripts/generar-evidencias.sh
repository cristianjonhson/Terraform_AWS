#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EVID_DIR="$ROOT_DIR/docs/evidencias"
ENV_NAME="dev"
RUN_APPLY="false"
SKIP_INIT="false"
DATE_TAG="$(date +%F)"

usage() {
  cat <<'EOF'
Uso:
  ./scripts/generar-evidencias.sh [opciones]

Opciones:
  --env <nombre>       Entorno para el nombre de archivos (default: dev)
  --date <YYYY-MM-DD>  Fecha para el nombre de archivos (default: fecha actual)
  --apply              Ejecuta terraform apply (ademas de plan/output)
  --skip-init          Omite terraform init
  -h, --help           Muestra esta ayuda

Ejemplos:
  ./scripts/generar-evidencias.sh
  ./scripts/generar-evidencias.sh --env qa --date 2026-04-20
  ./scripts/generar-evidencias.sh --apply
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --env)
      ENV_NAME="$2"
      shift 2
      ;;
    --date)
      DATE_TAG="$2"
      shift 2
      ;;
    --apply)
      RUN_APPLY="true"
      shift
      ;;
    --skip-init)
      SKIP_INIT="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Error: opcion no reconocida: $1" >&2
      usage
      exit 1
      ;;
  esac
done

mkdir -p "$EVID_DIR/screenshots"

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: comando requerido no encontrado: $1" >&2
    exit 1
  fi
}

require_cmd terraform
require_cmd docker

echo "[1/4] Renderizando diagramas PlantUML..."
docker run --rm -v "$ROOT_DIR":/work -w /work plantuml/plantuml \
  -tpng \
  docs/evidencias/arquitectura-aws.puml \
  docs/evidencias/c4-context.puml \
  docs/evidencias/c4-container.puml >/dev/null

echo "[2/4] Renderizando diagramas Mermaid..."
docker run --rm -u "$(id -u):$(id -g)" -v "$ROOT_DIR":/data minlag/mermaid-cli \
  -i /data/docs/evidencias/arquitectura-aws.mmd \
  -o /data/docs/evidencias/arquitectura-aws.png \
  -b white >/dev/null

docker run --rm -u "$(id -u):$(id -g)" -v "$ROOT_DIR":/data minlag/mermaid-cli \
  -i /data/docs/evidencias/arquitectura-aws-v2.mmd \
  -o /data/docs/evidencias/arquitectura-aws-v2.png \
  -b white >/dev/null

cp "$EVID_DIR/arquitectura-aws.png" "$EVID_DIR/04-aws-arch-${ENV_NAME}-${DATE_TAG}.png"
cp "$EVID_DIR/c4-context.png" "$EVID_DIR/05-c4-context-${ENV_NAME}-${DATE_TAG}.png"
cp "$EVID_DIR/c4-container.png" "$EVID_DIR/06-c4-container-${ENV_NAME}-${DATE_TAG}.png"

pushd "$ROOT_DIR" >/dev/null

echo "[3/4] Generando evidencias de Terraform..."
if [[ "$SKIP_INIT" != "true" ]]; then
  terraform init -input=false -no-color > "$EVID_DIR/00-init-${ENV_NAME}-${DATE_TAG}.txt"
fi

terraform plan -no-color -out=tfplan > "$EVID_DIR/01-plan-${ENV_NAME}-${DATE_TAG}.txt"

if [[ "$RUN_APPLY" == "true" ]]; then
  terraform apply -no-color -auto-approve tfplan > "$EVID_DIR/02-apply-${ENV_NAME}-${DATE_TAG}.txt"
else
  printf '%s\n' "Apply no ejecutado. Usa --apply para incluirlo." > "$EVID_DIR/02-apply-${ENV_NAME}-${DATE_TAG}.txt"
fi

if terraform output -no-color > "$EVID_DIR/03-output-${ENV_NAME}-${DATE_TAG}.txt"; then
  :
else
  printf '\n%s\n' "No se pudieron obtener outputs (estado inexistente o vacio)." >> "$EVID_DIR/03-output-${ENV_NAME}-${DATE_TAG}.txt"
fi

popd >/dev/null

echo "[4/4] Evidencias generadas en: $EVID_DIR"
echo "- 01-plan-${ENV_NAME}-${DATE_TAG}.txt"
echo "- 02-apply-${ENV_NAME}-${DATE_TAG}.txt"
echo "- 03-output-${ENV_NAME}-${DATE_TAG}.txt"
echo "- 04-aws-arch-${ENV_NAME}-${DATE_TAG}.png"
echo "- 05-c4-context-${ENV_NAME}-${DATE_TAG}.png"
echo "- 06-c4-container-${ENV_NAME}-${DATE_TAG}.png"
