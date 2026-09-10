# Uso responsável, licenças e atribuição

Este documento é uma orientação prática para o laboratório, não aconselhamento
jurídico.

## O que pertence a este repositório

Os testes, fixtures, scripts e textos escritos especificamente para este
laboratório são autorais e estão sob a licença MIT deste repositório.

## O que não deve ser copiado

- Código-fonte ou suíte de testes oficial do SUT.
- Logos, ícones, fontes, screenshots promocionais ou identidade visual do
  fornecedor.
- Trechos extensos da documentação oficial.
- Dados, requisitos, código, screenshots ou segredos do empregador.

Se um pequeno trecho de terceiro for indispensável, registre a origem, a
licença aplicável e preserve os avisos exigidos. Prefira links e paráfrases.

## Como o SUT é usado

O checkout oficial Docker fica em `.sut/`, que é ignorado pelo Git. Ele é usado
sem alteração como infraestrutura local e mantém sua própria licença. Nenhuma
licença de terceiro é relicenciada pela licença MIT deste laboratório.

## Marca

Use “Mattermost” apenas para identificar com precisão o sistema que está sendo
testado. Não use o logotipo, não sugira parceria ou aprovação e prefira um nome
neutro para o repositório. Inclua o aviso:

> Projeto independente, educacional e não afiliado, patrocinado ou aprovado
> pela Mattermost, Inc. Mattermost é uma marca da Mattermost, Inc.

## Evidências públicas

Antes de publicar traces, vídeos, relatórios ou screenshots:

1. Use apenas contas e dados fictícios.
2. Remova tokens, cookies, e-mails, IDs, IPs e caminhos locais desnecessários.
3. Confirme que nenhuma credencial entrou no histórico do Git.
4. Evite expor vulnerabilidades ainda não corrigidas; siga a política de
   divulgação responsável do fornecedor.
5. Não execute carga ou segurança contra uma demo pública sem autorização.

## Fontes oficiais consultadas

- Licença do código-fonte: https://github.com/mattermost/mattermost/blob/master/LICENSE.txt
- Ambiente Docker oficial: https://github.com/mattermost/docker
- Guia oficial de containers: https://docs.mattermost.com/deployment-guide/server/deploy-containers
- Política de marcas: https://mattermost.com/trademark-standards-of-use/

