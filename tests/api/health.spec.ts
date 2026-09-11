import { expect, test } from '@playwright/test';

test('serviço de reservas responde com status de saúde', async ({ request }) => {
  const response = await request.get('/booking/actuator/health');

  expect(response.ok()).toBeTruthy();
  await expect(response.json()).resolves.toMatchObject({ status: 'UP' });
});
