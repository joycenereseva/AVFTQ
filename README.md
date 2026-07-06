# AVFTQ — Avaliação Técnica de Natação

Aplicação HTML offline para fichas de avaliação técnica de natação particular.

## Arquivos

| Arquivo | Uso |
|---------|-----|
| `avaliacao_natacao.html` | Versão principal (requer pasta `vendor/` ao lado) |
| `avaliacao_natacao_standalone.html` | Versão única, 100% offline — ideal para Google Drive |
| `vendor/` | Bibliotecas jsPDF e html2canvas |

## Melhorias no gerador de PDF

- **Offline**: bibliotecas locais em `vendor/` com fallback para CDN
- **Versão standalone**: um único arquivo HTML sem dependências externas
- **Indicador de carregamento** enquanto o PDF é gerado
- **Botão Visualizar** — abre a avaliação em nova aba, legível sem zoom (com opção de imprimir/salvar PDF)
- **Prova opcional** — quando marcada como "não incluso", tabela e gráfico não aparecem
- **Fontes maiores** — texto legível sem precisar dar zoom
- **Nomenclatura única** no topo (não repetida em cada seção)
- **Páginas divididas** — habilidades em até 3 seções por página

## Como usar no Google Drive

### Opção A — Um arquivo só (recomendado)

1. Baixe `avaliacao_natacao_standalone.html`
2. Envie para o Google Drive
3. Abra no Chrome (funciona sem internet)

### Opção B — Pasta completa

1. Baixe `avaliacao_natacao.html` e a pasta `vendor/`
2. Mantenha os dois no mesmo diretório no Drive

## Gerar versão standalone

```bash
./build-standalone.sh
```

## Uso

1. Abra o HTML no Chrome ou Edge
2. Cadastre alunos e preencha avaliações
3. Clique em **Gerar PDF** na tela de avaliação
