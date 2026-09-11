import { expect, test } from '@playwright/test';

test('exibe a plataforma de reservas', async ({ page }) => {
  await page.goto('/');

  await expect(page).toHaveTitle(/Restful-booker-platform demo/i);
});
