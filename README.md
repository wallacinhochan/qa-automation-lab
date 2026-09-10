# QA Automation Lab

Laboratório autoral de qualidade de software para estudar test design, API, E2E,
banco de dados, CI/CD, performance, segurança e observabilidade.

O primeiro sistema sob teste (SUT) é uma instância local do **Mattermost®**. O
produto, seu código-fonte e sua suíte oficial de testes não fazem parte deste
repositório.

> Projeto independente, educacional e não afiliado, patrocinado ou aprovado
> pela Mattermost, Inc. Mattermost é uma marca da Mattermost, Inc.

## Começando

Pré-requisitos: Node.js 20 ou superior, npm e Docker Desktop.

```powershell
npm install
npx playwright install
Copy-Item .env.example .env
npm run sut:setup
npm run sut:up
npm test
```

A aplicação local fica disponível em `http://localhost:8065`. Na primeira
execução, conclua o cadastro do administrador pela interface antes de rodar
testes que dependam de autenticação.

## Estrutura

```text
docs/                  estratégia, planos e registros de estudo
scripts/               automação do ambiente local
tests/
  api/                  testes pela API REST
  e2e/                  jornadas pela interface
  fixtures/             dados e fixtures próprios
.sut/                   checkout local do SUT (ignorado pelo Git)
```

## Comandos

- `npm test`: executa toda a suíte Playwright.
- `npm run test:e2e`: executa apenas testes E2E.
- `npm run test:api`: executa apenas testes de API.
- `npm run test:ui`: abre o modo interativo do Playwright.
- `npm run sut:setup`: baixa a configuração Docker oficial do SUT localmente.
- `npm run sut:up`: inicia o ambiente local.
- `npm run sut:down`: encerra o ambiente sem apagar seus dados.

## Segurança do laboratório

- Execute testes de carga e segurança apenas em instâncias locais ou ambientes
  para os quais você tenha autorização explícita.
- Nunca publique `.env`, tokens, senhas, cookies, `storageState`, dumps de banco,
  logs com dados pessoais, screenshots ou vídeos com informações sensíveis.
- Gere todos os dados de teste. Não use dados do trabalho ou de pessoas reais.

Veja [docs/legal-and-attribution.md](docs/legal-and-attribution.md) antes de
publicar evidências e [docs/test-plan.md](docs/test-plan.md) para iniciar o
planejamento.

## Licença

O código autoral deste laboratório é disponibilizado sob a licença MIT. Isso não
altera nem substitui as licenças do Mattermost ou de qualquer dependência.

