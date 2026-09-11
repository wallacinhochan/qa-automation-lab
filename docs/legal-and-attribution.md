# Uso responsável, licenças e atribuição

Este documento é uma orientação prática para o laboratório, não aconselhamento
jurídico.

## O que pertence a este repositório

Os testes, fixtures, scripts e textos escritos especificamente para este
laboratório são autorais e estão sob a licença MIT deste repositório, exceto
quando um arquivo indicar explicitamente outra licença.

## O que não deve ser copiado

- Código-fonte ou suíte de testes oficial do SUT.
- Logos, ícones, fontes, screenshots promocionais ou identidade visual do
  fornecedor.
- Trechos extensos da documentação oficial.
- Dados, requisitos, código, screenshots ou segredos do empregador.

Se um pequeno trecho de terceiro for indispensável, registre a origem, a
licença aplicável e preserve os avisos exigidos. Prefira links e paráfrases.

## Como o SUT é usado

O checkout do Restful Booker Platform fica em `.sut/`, que é ignorado pelo Git.
Ele é usado como infraestrutura local e mantém sua licença GPL-3.0. Nenhuma
licença de terceiro é relicenciada pela licença MIT deste laboratório.

## Arquivo derivado distribuído

O arquivo `docker/restful-booker-assets.Dockerfile` deriva do Dockerfile da
interface do Restful Booker Platform e contém uma modificação para disponibilizar
as URLs internas dos serviços durante o build do Next.js. Esse arquivo mantém a
licença GPL-3.0-only, identifica sua origem no próprio cabeçalho e é acompanhado
pelo texto da licença em `LICENSES/GPL-3.0.txt`.

Os demais arquivos autorais continuam sob MIT. A licença MIT da raiz não altera
a licença do arquivo derivado.

## Independência da suíte

Os testes existentes no projeto de origem não são copiados, alterados ou usados
como base. A automação deste laboratório é escrita do zero no diretório `tests/`
e identificada como uma suíte educacional independente.

## Evidências públicas

Antes de publicar traces, vídeos, relatórios ou screenshots:

1. Use apenas contas e dados fictícios.
2. Remova tokens, cookies, e-mails, IDs, IPs e caminhos locais desnecessários.
3. Confirme que nenhuma credencial entrou no histórico do Git.
4. Evite expor vulnerabilidades ainda não corrigidas; siga a política de
   divulgação responsável do fornecedor.
5. Não execute carga ou segurança contra uma demo pública sem autorização.

## Fontes oficiais consultadas

- Projeto de origem: https://github.com/mwinteringham/restful-booker-platform
- Licença GPL-3.0 do SUT: https://github.com/mwinteringham/restful-booker-platform/blob/trunk/LICENSE
