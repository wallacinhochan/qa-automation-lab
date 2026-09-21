# QA Automation Lab

Laboratório autoral de qualidade de software para estudar test design, API, E2E,
banco de dados, CI/CD, performance, segurança e observabilidade usando um único
sistema sob teste.

O SUT é uma instância local do
[Restful Booker Platform](https://github.com/mwinteringham/restful-booker-platform),
uma plataforma de reservas criada para treinamento em exploração, estratégia e
automação de testes. O checkout e a suíte oficial do SUT não fazem parte deste
repositório. A única exceção derivada do projeto original é o Dockerfile de
compatibilidade descrito na seção de licença.

> Projeto educacional independente. Os testes, planos e evidências deste
> laboratório não são a suíte oficial do Restful Booker Platform.

## Começando

Pré-requisitos: Windows com PowerShell, Node.js 20.1 ou superior, npm e Docker
Desktop em execução.

```powershell
npm ci
Copy-Item .env.example .env
npm run sut:setup
npm run sut:up
npm test
```

A primeira construção dos containers pode levar alguns minutos. O Maven e o
Java necessários para compilar o SUT rodam em um container; a suíte oficial é
ignorada durante essa compilação. A interface fica disponível em
`http://localhost`, e a API de reservas em `http://localhost:3100`; as
credenciais públicas do laboratório são `admin` / `password`.

O laboratório usa um Dockerfile próprio apenas para fornecer ao build da
interface as URLs internas dos serviços. O checkout original em `.sut/` não é
alterado. O setup usa a revisão testada
[`d36bd3f`](https://github.com/mwinteringham/restful-booker-platform/commit/d36bd3f8647a091d406e53bad463c5e3e5d2ece1)
para que execuções futuras usem a mesma versão do SUT.

O Cypress 15.21.1 é instalado pelo `npm ci`, incluindo seu navegador Electron.
Os testes deste laboratório ficam em `cypress/e2e/` e são independentes dos
testes oficiais do SUT. Para desenvolver com o runner visual, use
`npm run test:ui`; para uma execução headless completa, use `npm test`.

## Swagger e APIs

Cada microsserviço possui sua própria documentação Swagger. O ambiente precisa
estar em execução com `npm run sut:up` para que os links funcionem. Abra o
Swagger UI pelas rotas `/api/*` da interface principal; o acesso direto pelas
portas dos microsserviços abre a página, mas não resolve corretamente o endereço
do contrato OpenAPI.

| Serviço | API | Swagger |
| --- | --- | --- |
| Reservas | `http://localhost:3100/booking` | [Abrir Swagger de reservas](http://localhost/api/booking/swagger-ui/index.html) |
| Quartos | `http://localhost:3001/room` | [Abrir Swagger de quartos](http://localhost/api/room/swagger-ui/index.html) |
| Branding | `http://localhost:3002/branding` | [Abrir Swagger de branding](http://localhost/api/branding/swagger-ui/index.html) |
| Autenticação | `http://localhost:3004/auth` | [Abrir Swagger de autenticação](http://localhost/api/auth/swagger-ui/index.html) |
| Relatórios | `http://localhost:3005/report` | [Abrir Swagger de relatórios](http://localhost/api/report/swagger-ui/index.html) |
| Mensagens | `http://localhost:3006/message` | [Abrir Swagger de mensagens](http://localhost/api/message/swagger-ui/index.html) |

O contrato OpenAPI em JSON usado pelo Swagger segue o padrão
`http://localhost/api/<serviço>/v3/api-docs`. Por exemplo:

```text
http://localhost/api/room/v3/api-docs
```

A interface principal está em [http://localhost](http://localhost). As rotas
`/api/*` dessa interface funcionam como proxy para os microsserviços internos.

## Estrutura

```text
docs/                  estratégia, planos e registros de estudo
docker/                adaptação GPL-3.0 do build da interface do SUT
LICENSES/              licenças aplicáveis a arquivos derivados
scripts/               automação do ambiente local
cypress/
  e2e/api/              testes pela API REST
  e2e/web/              jornadas pela interface
  fixtures/             dados e fixtures próprios
  support/              configuração e comandos compartilhados
cypress.config.ts       configuração do runner Cypress
.sut/                   checkout local GPL-3.0 do SUT (ignorado pelo Git)
```

## Comandos

- `npm test`: executa toda a suíte Cypress em modo headless.
- `npm run test:e2e`: executa apenas testes E2E.
- `npm run test:api`: executa apenas testes de API.
- `npm run test:ui`: abre o Cypress em modo interativo.
- `npm run cypress:verify`: verifica se o binário do Cypress está funcional.
- `npm run typecheck`: valida os arquivos TypeScript sem gerar código.
- `npm run sut:setup`: baixa a configuração Docker oficial do SUT localmente.
- `npm run sut:up`: constrói e inicia o ambiente local.
- `npm run sut:down`: encerra o ambiente sem apagar seus dados.
- `npm run sut:status`: mostra o estado dos serviços do SUT.

## Segurança do laboratório

- Execute testes de carga e segurança apenas em instâncias locais ou ambientes
  para os quais você tenha autorização explícita.
- Nunca publique `.env`, tokens, senhas, cookies, sessões, dumps de banco,
  logs com dados pessoais, screenshots ou vídeos com informações sensíveis.
- Gere todos os dados de teste. Não use dados do trabalho ou de pessoas reais.

Veja [docs/legal-and-attribution.md](docs/legal-and-attribution.md) antes de
publicar evidências e [docs/test-plan.md](docs/test-plan.md) para iniciar o
planejamento.

## Licença

Os testes, scripts e documentos autorais deste laboratório são disponibilizados
sob a licença MIT. O arquivo `docker/restful-booker-assets.Dockerfile`, derivado
do projeto original, permanece sob GPL-3.0-only; o texto correspondente está em
`LICENSES/GPL-3.0.txt`. Isso não altera as licenças do Restful Booker Platform ou
de qualquer dependência.
