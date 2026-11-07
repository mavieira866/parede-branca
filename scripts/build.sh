#!/usr/bin/env bash

###############################################################################
# Parede Branca
#
# Script de compilação: PDF, Word e EPUB
#
# Autor: Marcos Vieira
# Projeto: Parede Branca
###############################################################################

set -euo pipefail

###############################################################################
# Configuração
###############################################################################

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD_DIR="${PROJECT_ROOT}/build"
PDF_DIR="${BUILD_DIR}/pdf"
WORD_DIR="${BUILD_DIR}/word"
EPUB_DIR="${BUILD_DIR}/epub"
MAIN_FILE="${PROJECT_ROOT}/parede-branca.tex"
BOOK_TITLE="Parede Branca"
BOOK_AUTHOR="Marcos Aurélio Vieira"

ENGINE="xelatex"

###############################################################################
# Cores
###############################################################################

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0m"

###############################################################################
# Funções
###############################################################################

info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERRO]${NC} $1" >&2
}

check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        error "Comando '$1' não encontrado. Instale a dependência e tente novamente."
        exit 1
    fi
}

###############################################################################
# Verificações
###############################################################################

info "Verificando arquivos e dependências..."

if [[ ! -f "$MAIN_FILE" ]]; then
    error "Arquivo principal não encontrado: $MAIN_FILE"
    exit 1
fi

check_command latexmk
check_command "$ENGINE"
check_command pandoc

success "Dependências encontradas."

###############################################################################
# Diretórios
###############################################################################

mkdir -p "$PDF_DIR" "$WORD_DIR" "$EPUB_DIR"

###############################################################################
# Limpeza
###############################################################################

info "Removendo arquivos temporários do LaTeX..."
latexmk -C -output-directory="$PDF_DIR" "$MAIN_FILE" >/dev/null 2>&1 || true

###############################################################################
# PDF
###############################################################################

info "Compilando PDF..."

latexmk \
    -interaction=nonstopmode \
    -file-line-error \
    -xelatex \
    -output-directory="$PDF_DIR" \
    "$MAIN_FILE"

PDF="${PDF_DIR}/parede-branca.pdf"

if [[ ! -f "$PDF" ]]; then
    error "Falha na geração do PDF."
    exit 1
fi
success "PDF gerado: $PDF"

###############################################################################
# Word (DOCX)
###############################################################################

info "Gerando arquivo Word..."

pandoc "$MAIN_FILE" \
    --from=latex \
    --to=docx \
    --standalone \
    --metadata="title:${BOOK_TITLE}" \
    --metadata="author:${BOOK_AUTHOR}" \
    --resource-path="$PROJECT_ROOT" \
    --output="${WORD_DIR}/parede-branca.docx"

if [[ ! -f "${WORD_DIR}/parede-branca.docx" ]]; then
    error "Falha na geração do Word."
    exit 1
fi
success "Word gerado: ${WORD_DIR}/parede-branca.docx"

###############################################################################
# EPUB (e-book)
###############################################################################

info "Gerando EPUB..."

pandoc "$MAIN_FILE" \
    --from=latex \
    --to=epub3 \
    --standalone \
    --metadata="title:${BOOK_TITLE}" \
    --metadata="author:${BOOK_AUTHOR}" \
    --resource-path="$PROJECT_ROOT" \
    --output="${EPUB_DIR}/parede-branca.epub"

if [[ ! -f "${EPUB_DIR}/parede-branca.epub" ]]; then
    error "Falha na geração do EPUB."
    exit 1
fi
success "EPUB gerado: ${EPUB_DIR}/parede-branca.epub"

###############################################################################
# Resumo
###############################################################################

echo
success "Compilação concluída."
echo "Arquivos gerados:"
echo "  PDF:   $PDF"
echo "  Word:  ${WORD_DIR}/parede-branca.docx"
echo "  EPUB:  ${EPUB_DIR}/parede-branca.epub"

echo
warning "Observação: o Pandoc pode não interpretar automaticamente comandos LaTeX personalizados"
warning "(por exemplo, macros da classe paredebranca). Confira a formatação do DOCX e do EPUB."
