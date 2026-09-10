import { expect, test } from '@playwright/test';

test('API responde com status de saúde', async ({ request }) => {
  const response = await request.get('/api/v4/system/ping');

  expect(response.ok()).toBeTruthy();
  await expect(response.json()).resolves.toMatchObject({ status: 'OK' });
});

