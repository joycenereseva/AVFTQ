# Configuração Firebase — Link para os pais

Este guia configura a **opção C**: publicar avaliações na nuvem e enviar um link para os pais abrirem no celular.

## 1. Criar projeto Firebase (grátis)

1. Acesse [https://console.firebase.google.com](https://console.firebase.google.com)
2. **Adicionar projeto** → escolha um nome (ex.: `avftq-natacao`)
3. Desative o Google Analytics se quiser (opcional)
4. Aguarde a criação do projeto

## 2. Ativar Firestore

1. No menu: **Build → Firestore Database**
2. **Criar banco de dados** → modo **Produção**
3. Escolha a região mais próxima (ex.: `southamerica-east1` — São Paulo)

## 3. Ativar autenticação anônima

A professora publica avaliações sem precisar de senha:

1. **Build → Authentication → Começar**
2. Aba **Sign-in method**
3. Ative **Anônimo** → Salvar

## 4. Registrar app Web

1. Página inicial do projeto → ícone **Web** `</>`
2. Apelido: `AVFTQ`
3. Copie o objeto `firebaseConfig` exibido

## 5. Configurar arquivos

```bash
cd firebase/public
cp firebase-config.example.js firebase-config.js
```

Edite `firebase/public/firebase-config.js` com seus dados:

```javascript
window.AVF_FIREBASE = {
  apiKey: '...',
  authDomain: '...',
  projectId: '...',
  // ...
};
window.AVF_VIEW_BASE = 'https://SEU_PROJECT_ID.web.app/v.html';
```

Copie o **mesmo arquivo** para a pasta onde está `avaliacao_natacao.html`:

```bash
cp firebase/public/firebase-config.js ../firebase-config.js
```

## 6. Publicar regras e site

Instale a CLI do Firebase (uma vez):

```bash
npm install -g firebase-tools
firebase login
```

Na pasta `firebase/`:

```bash
cp .firebaserc.example .firebaserc
# Edite .firebaserc e troque SEU_PROJECT_ID pelo ID real

firebase deploy
```

Isso publica:
- `v.html` — página para os pais (celular, scroll)
- `firestore.rules` — segurança do banco

## 7. Usar na aplicação

1. Abra `avaliacao_natacao.html` no Chrome
2. Em **Configurações**, confira a URL: `https://SEU_PROJECT_ID.web.app/v.html`
3. Abra uma avaliação salva
4. Clique em **🔗 Link para pais**
5. Copie o link e envie no WhatsApp

## Segurança

- Cada link usa um **token aleatório** (impossível de adivinhar)
- Só quem tem o link vê a avaliação
- Ninguém pode apagar avaliações publicadas (regra do Firestore)
- Dados sensíveis de crianças: envie o link só para os responsáveis

## Custo

Com ~20 alunos, 2 avaliações/ano e 1 visualização por família: **R$ 0** no plano gratuito do Firebase.

## Solução de problemas

| Problema | Solução |
|----------|---------|
| "Firebase não configurado" | Copie e preencha `firebase-config.js` |
| "Permissão negada" ao publicar | Ative autenticação **Anônima** |
| Pais não abrem o link | Verifique se rodou `firebase deploy` |
| Página em branco | Confira `AVF_VIEW_BASE` na config |
