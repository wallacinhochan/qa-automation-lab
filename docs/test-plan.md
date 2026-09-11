# Plano de teste

## Objetivo

Avaliar os fluxos críticos de uma instância local do Restful Booker Platform e
construir evidências reproduzíveis sobre comportamento, riscos e qualidade.

## Escopo inicial

- Autenticação e encerramento de sessão administrativa.
- Consulta de quartos e disponibilidade.
- Criação, edição e cancelamento de reservas.
- Administração de quartos, mensagens e relatórios.
- APIs REST dos mesmos fluxos críticos.

## Fora do escopo inicial

- Código-fonte e suíte oficial do fornecedor.
- Testes destrutivos, de carga ou segurança em ambientes públicos.
- Dados reais ou provenientes do trabalho.

## Estratégia

1. Exploração manual e registro dos riscos.
2. Casos de API para preparar e limpar dados.
3. E2E somente para jornadas que exigem interface.
4. Evidências automáticas com trace, screenshot e vídeo apenas em falhas.
5. Revisão de flakiness e valor do teste antes de ampliar a suíte.

## Critérios de entrada

- Instância local acessível e versão registrada.
- Dados e usuários de teste identificados.
- Risco e resultado esperado documentados.

## Critérios de saída

- Cenários prioritários executados.
- Falhas reproduzíveis com evidências sem dados sensíveis.
- Riscos residuais e limitações descritos.
