# AVFTQ — Avaliação Técnica de Natação

Aplicação HTML offline para fichas de avaliação técnica de natação particular.

## Arquivos

| Arquivo | Uso |
|---------|-----|
| `avaliacao_natacao.html` | Versão principal (requer pasta `vendor/` ao lado) |
| `avaliacao_natacao_standalone.html` | Versão única, 100% offline — ideal para Google Drive |
| `parent-page.js` | Gerador da página mobile para os pais |
| `vendor/` | Bibliotecas jsPDF e html2canvas |

## Página para os pais (simples — sem Firebase)

Envie a avaliação aos pais pelo WhatsApp **sem cartão, sem Firebase, sem Lovable**:

1. Salve a avaliação do aluno
2. Clique em **📱 Página para pais**
3. O arquivo `AVF_NomeAluno_data.html` é baixado
4. Envie para o **Google Drive**
5. Compartilhe: **Qualquer pessoa com o link** → **Leitor**
6. Copie o link do Drive e mande no WhatsApp

Os pais abrem no celular e rolam a ficha com leitura confortável.

## Melhorias no gerador de PDF

- **Offline**: bibliotecas locais em `vendor/` com fallback para CDN
- **Versão standalone**: um único arquivo HTML sem dependências externas
- **Indicador de carregamento** enquanto o PDF é gerado
- **Botão Visualizar** — preview legível com opção de imprimir
- **Prova opcional** — tabela e gráfico ocultos quando não incluso
- **Fontes maiores** — legível sem zoom
- **Foto do aluno** na capa do PDF

## Como usar no Google Drive

### Opção A — Um arquivo só (recomendado)

1. Baixe `avaliacao_natacao_standalone.html`
2. Envie para o Google Drive
3. Abra no Chrome (funciona sem internet)

### Opção B — Pasta completa

1. Baixe `avaliacao_natacao.html`, `parent-page.js` e a pasta `vendor/`
2. Mantenha tudo no mesmo diretório no Drive

## Gerar versão standalone

```bash
./build-standalone.sh
```

## Uso

1. Abra o HTML no Chrome ou Edge
2. Cadastre alunos e preencha avaliações
3. **Gerar PDF** — imprimir ou arquivar
4. **Página para pais** — HTML para compartilhar no WhatsApp via Drive
