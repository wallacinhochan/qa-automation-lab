describe('API de reservas', () => {
  it('responde com status de saúde', () => {
    cy.env(['bookingApiUrl']).then(({ bookingApiUrl }) => {
      cy.request(`${bookingApiUrl}/booking/actuator/health`).then(({ status, body }) => {
        expect(status).to.eq(200);
        expect(body).to.deep.include({ status: 'UP' });
      });
    });
  });
});
