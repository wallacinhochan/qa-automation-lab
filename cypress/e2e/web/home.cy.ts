describe('Plataforma de reservas', () => {
  it('exibe a plataforma de reservas', () => {
    cy.visit('/');

    cy.title().should('match', /Restful-booker-platform demo/i);
  });
});
