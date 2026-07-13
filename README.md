# AVFTQ — Avaliação Técnica de Natação

Aplicação HTML offline para fichas de avaliação técnica de natação particular.

## Arquivos

| Arquivo | Uso |
|---------|-----|
| `avaliacao_natacao.html` | Versão principal (requer pasta `vendor/` ao lado) |
| `avaliacao_natacao_standalone.html` | Versão única, 100% offline — ideal para Google Drive |
| `vendor/` | Bibliotecas jsPDF e html2canvas |
| `firebase/` | Hospedagem e página para os pais (opção C) |
| `firebase-config.js` | Configuração do Firebase (copie do `.example` e preencha) |

## Link para os pais (opção C — Firebase)

Em vez de enviar PDF, você pode publicar a avaliação na nuvem e mandar um **link no WhatsApp**. Os pais abrem no celular e rolam a ficha com leitura confortável.

### Fluxo

1. Configure o Firebase uma vez — guia completo em [`firebase/SETUP.md`](firebase/SETUP.md)
2. Na avaliação salva, clique em **🔗 Link para pais**
3. Copie o link e envie aos responsáveis

### Custo

Com ~20 alunos, 2 avaliações/ano e 1 visualização por família: **grátis** no plano Firebase Spark.

## Melhorias no gerador de PDF

- **Offline**: bibliotecas locais em `vendor/` com fallback para CDN
- **Versão standalone**: um único arquivo HTML sem dependências externas
- **Indicador de carregamento** enquanto o PDF é gerado
- **Botão Visualizar** — abre a avaliação em nova aba, legível sem zoom (com opção de imprimir/salvar PDF)
- **Prova opcional** — quando marcada como "não incluso", tabela e gráfico não aparecem
- **Fontes maiores** — texto legível sem precisar dar zoom
- **Páginas divididas** — habilidades em até 3 seções por página
- **Foto do aluno** na capa do PDF

## Como usar no Google Drive

### Opção A — Um arquivo só (recomendado)

1. Baixe `avaliacao_natacao_standalone.html`
2. Envie para o Google Drive
3. Abra no Chrome (funciona sem internet)

### Opção B — Pasta completa

1. Baixe `avaliacao_natacao.html`, `firebase-config.js` e a pasta `vendor/`
2. Mantenha tudo no mesmo diretório no Drive

> **Link para pais:** requer internet apenas ao publicar e quando os pais abrirem o link.

## Gerar versão standalone

```bash
./build-standalone.sh
```

## Uso

1. Abra o HTML no Chrome ou Edge
2. Cadastre alunos e preencha avaliações
3. **Gerar PDF** — arquivo para imprimir/arquivar
4. **Link para pais** — enviar no WhatsApp (após configurar Firebase)
