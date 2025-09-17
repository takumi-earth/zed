#!/usr/bin/env bash
# Sanitize inputs that may include BOM, zero-width, NBSP, CR, mixed newlines.
# Agentic hint: use sanitize_file_to or sanitize_line in scripts reading user-provided content.
set -euo pipefail

sanitize_file_to() {
  # args: <infile> <outfile>
  local in="$1" out="$2"
  perl -CSDA -pe 's/\x{FEFF}//g; s/[\x{200B}\x{200C}\x{200D}]//g; s/\x{00A0}/ /g; s/\r//g;' "$in" > "$out"
}

sanitize_line() {
  # read stdin line, emit sanitized to stdout (no trailing CR, strip BOM/ZWSP/NBSP)
  perl -CSDA -pe 's/\x{FEFF}//g; s/[\x{200B}\x{200C}\x{200D}]//g; s/\x{00A0}/ /g; s/\r//g;' 
}

