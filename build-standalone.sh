#!/bin/bash
# Gera versão única do HTML com bibliotecas embutidas (100% offline, um arquivo só)
set -euo pipefail

python3 << 'PY'
src_path = "avaliacao_natacao.html"
out_path = "avaliacao_natacao_standalone.html"

with open(src_path, encoding="utf-8") as f:
    html = f.read()

with open("vendor/jspdf.umd.min.js", encoding="utf-8") as f:
    jspdf = f.read()
with open("vendor/html2canvas.min.js", encoding="utf-8") as f:
    h2c = f.read()
with open("parent-page.js", encoding="utf-8") as f:
    parent_page = f.read()

start_marker = '<script src="vendor/jspdf.umd.min.js"></script>'
end_marker = '})();\n</script>'

start = html.find(start_marker)
if start == -1:
    raise SystemExit('start marker not found')
end = html.find(end_marker, start)
if end == -1:
    raise SystemExit('end marker not found')
end += len(end_marker)

inline = (
    '<script>\n/* jsPDF 2.5.1 */\n' + jspdf + '\n</script>\n'
    '<script>\n/* html2canvas 1.4.1 */\n' + h2c + '\n</script>'
)

html = html[:start] + inline + html[end:]

pp_marker = '<script src="parent-page.js"></script>'
if pp_marker in html:
    html = html.replace(
        pp_marker,
        '<script>\n/* parent-page.js */\n' + parent_page + '\n</script>',
        1,
    )

with open(out_path, "w", encoding="utf-8") as f:
    f.write(html)

print(f"Gerado: {out_path} ({len(html) // 1024} KB)")
PY
