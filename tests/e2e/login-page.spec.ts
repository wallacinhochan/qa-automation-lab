import { expect, test } from '@playwright/test';

test('exibe a entrada da aplicação', async ({ page }) => {
  await page.goto('/');

  await expect(page).toHaveTitle(/Mattermost/i);
});

