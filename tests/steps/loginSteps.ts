import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { CustomWorld } from '../support/world';

Given('que el usuario navega a la página de inicio de sesión', async function (this: CustomWorld) {
  await this.page.goto(this.baseUrl);
});

When('el usuario ingresa el correo {string} y la contraseña {string}', async function (this: CustomWorld, correo: string, pass: string) {
  await this.page.locator('#email').fill(correo);
  await this.page.locator('#password').fill(pass);
});

When('presiona el botón de ingresar', async function (this: CustomWorld) {
  await this.page.locator('button:has-text("Ingresar")').click();
});

Then('se debe mostrar el mensaje de error {string}', async function (this: CustomWorld, mensajeEsperado: string) {
  const errorMessageLocator = this.page.locator('#error-message');
  await expect(errorMessageLocator).toHaveText(mensajeEsperado);
});

Then('el usuario debería ser redirigido a la página de bienvenida', async function (this: CustomWorld) {
  await expect(this.page).toHaveURL(/.*bienvenida.*/);
});

When('el usuario ingresa el correo {string} y la contraseña {string} {int} veces seguidas', async function (this: CustomWorld, correo: string, pass: string, intentos: number) {
  const emailInput = this.page.locator('#email');
  const passInput = this.page.locator('#password');
  const loginBtn = this.page.locator('button:has-text("Ingresar")');

  for (let i = 0; i < intentos; i++) {
    await emailInput.fill(correo);
    await passInput.fill(pass);
    await loginBtn.click();
  }
});

Then('se debe mostrar el mensaje de advertencia de bloqueo {string}', async function (this: CustomWorld, mensajeEsperado: string) {
  const warningMessageLocator = this.page.locator('#warning-message');
  await expect(warningMessageLocator).toHaveText(mensajeEsperado);
});
