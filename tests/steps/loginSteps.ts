import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { CustomWorld } from '../support/world';

Given('el usuario navega a la página de inicio de sesión {string}', async function (this: CustomWorld, url: string) {
  await this.page.goto(url);
});

When('el usuario ingresa el correo {string} y la contraseña {string}', async function (this: CustomWorld, correo: string, pass: string) {
  const emailInput = this.page.locator('#email, input[type="email"], input[name="email"], input[name="usuario"]').first();
  const passInput = this.page.locator('#password, input[type="password"], input[name="password"], input[name="clave"]').first();

  await emailInput.fill(correo);
  await passInput.fill(pass);
});

When('presiona el botón de ingresar', async function (this: CustomWorld) {
  const loginBtn = this.page.locator('#btn-login, button[type="submit"], input[type="submit"], button:has-text("Ingresar"), button:has-text("Login")').first();
  await loginBtn.click();
});

Then('se debe mostrar el mensaje {string}', async function (this: CustomWorld, mensajeEsperado: string) {
  if (mensajeEsperado.includes('Acceso autorizado')) {
    await expect(this.page).toHaveURL(/.*(bienvenida).*/);
  } else {
    const selectorMensaje = '.mensaje-error, #mensaje, #error, alert, .alert, p.error, div.error';
    const elemento = this.page.locator(selectorMensaje).first();
    const textoObservado = await elemento.innerText();
    expect(textoObservado).toContain(mensajeEsperado);
  }
});

When('el usuario ingresa el correo {string} y la contraseña {string} {int} veces seguidas', async function (this: CustomWorld, correo: string, pass: string, intentos: number) {
  const emailInput = this.page.locator('#email, input[type="email"], input[name="email"]').first();
  const passInput = this.page.locator('#password, input[type="password"]').first();
  const loginBtn = this.page.locator('#btn-login, button[type="submit"], input[type="submit"], button:has-text("Ingresar"), button:has-text("Login")').first();

  for (let i = 0; i < intentos; i++) {
    await emailInput.fill(correo);
    await passInput.fill(pass);
    await loginBtn.click();
  }
});
