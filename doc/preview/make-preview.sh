#!/usr/bin/env bash
# Generate the project preview image from demo.pdf.
#
# Renders pages 1-5, 9, 20, 37 to PNG, then tiles them into a 2x4 grid
# with 1px black separators between tiles and a 1px black outer border.
#
# Dependencies: pdftoppm (poppler) + Pillow

set -euo pipefail

# --- configuration -----------------------------------------------------------

PDF=$1
PAGES=(1 2 3 4 5 9 20 37)
ROWS=2
COLS=4
DPI=120
OUT='preview.png'

# --- render pages ------------------------------------------------------------

workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT

for page in "${PAGES[@]}"; do
    "pdftoppm" -png -r "$DPI" -f "$page" -l "$page" -singlefile \
        "$PDF" "$workdir/page-$page"
done

# --- stitch grid -------------------------------------------------------------

"python" - "$workdir" "${PAGES[@]}" <<'EOF' > "$OUT"
import sys
from PIL import Image

workdir, pages = sys.argv[1], sys.argv[2:]
rows, cols, border, gap = 2, 4, 1, 1  # 1px outer frame, 1px separators

tiles = [Image.open(f'{workdir}/page-{p}.png') for p in pages]
w, h = tiles[0].size

canvas = Image.new('RGB', (cols * w + 2 * border + (cols - 1) * gap,
                            rows * h + 2 * border + (rows - 1) * gap),
                   'black')
for i, tile in enumerate(tiles):
    r, c = divmod(i, cols)
    canvas.paste(tile, (border + c * (w + gap), border + r * (h + gap)))

canvas.save(sys.stdout, format='PNG')
EOF

echo "wrote $OUT"
