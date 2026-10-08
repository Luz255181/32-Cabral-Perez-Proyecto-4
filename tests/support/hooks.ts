import { BeforeAll, AfterAll, Before, After, Status, setDefaultTimeout } from '@cucumber/cucumber';
import { chromium, Browser } from '@playwright/test';
import { CustomWorld } from './world';


setDefaultTimeout(30 * 1000);

let browser: Browser;


BeforeAll(async function () {
  browser = await chromium.launch({ headless: true });
});

AfterAll(async function () {
  await browser.close();
});

Before(async function (this: CustomWorld) {
  this.browser = browser;
  this.context = await browser.newContext();
  this.page = await this.context.newPage();
});

After(async function (this: CustomWorld, scenario) {
  if (scenario.result?.status === Status.FAILED && this.page) {
    try {
      const screenshot = await this.page.screenshot();
      await this.attach(screenshot, 'image/png');
    } catch (e) {
      console.log('No se pudo tomar la captura de pantalla en el escenario fallido:', e);
    }
  }
  if (this.page) await this.page.close();
  if (this.context) await this.context.close();
});
