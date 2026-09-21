import { defineConfig } from 'cypress';
import dotenv from 'dotenv';

dotenv.config();

export default defineConfig({
  video: true,
  screenshotOnRunFailure: true,
  allowCypressEnv: false,
  retries: {
    runMode: process.env.CI ? 2 : 0,
    openMode: 0,
  },
  e2e: {
    baseUrl: process.env.BASE_URL ?? 'http://localhost',
    specPattern: 'cypress/e2e/**/*.cy.ts',
    supportFile: 'cypress/support/e2e.ts',
  },
  env: {
    bookingApiUrl: process.env.BOOKING_API_URL ?? 'http://localhost:3100',
  },
});
