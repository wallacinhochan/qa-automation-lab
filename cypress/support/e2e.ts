// Comandos e configurações compartilhados pelos testes E2E podem ser adicionados aqui.

Cypress.on('uncaught:exception', (error) => {
  // O build de demonstração do SUT pode emitir este erro conhecido de hidratação.
  // Outras exceções da aplicação continuam falhando o teste.
  if (error.message.includes('Minified React error #418')) {
    return false;
  }

  return undefined;
});
