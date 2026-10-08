# Proyecto 4: Automatización de Pruebas de Login - Obra Social de Hogwarts

Este proyecto contiene la automatización de los casos de prueba `LOG-01` a `LOG-13` para la pantalla de inicio de sesión de la Obra Social de Hogwarts (`http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html`), utilizando **Cucumber.js** (Gherkin) y **Playwright** con **TypeScript**, siguiendo la arquitectura y buenas prácticas expuestas en la guía de BrowserStack.

## Estructura del Proyecto

```text
.
├── features/             # Escenarios en Gherkin (login.feature: LOG-01 a LOG-13)
├── steps/                # Definiciones de pasos con Playwright (loginSteps.ts)
├── support/              # Configuración de soporte de Cucumber y Playwright
│   ├── world.ts          # Configuración de CustomWorld para pasaje de contexto
│   └── hooks.ts          # Hooks de ciclo de vida del navegador y capturas
├── cucumber.json         # Configuración de ejecución de Cucumber.js y reportes
├── tsconfig.json         # Configuración del compilador de TypeScript
├── package.json          # Dependencias NPM y scripts de ejecución
└── README.md             # Guía de instalación, configuración y ejecución
```

> **Nota sobre la ubicación de carpetas:** Si organizaste tu proyecto colocando las subcarpetas dentro de `tests/` (`tests/features/`, `tests/steps/`, `tests/support/`), asegúrate de actualizar las rutas correspondientes en `cucumber.json` y `tsconfig.json`.

---

## Arquitectura y Patrones (BrowserStack Guide)

- **Optimización del ciclo de vida del navegador (`hooks.ts`)**: Se utilizan `BeforeAll` y `AfterAll` para inicializar el navegador Chromium una sola vez por suite de pruebas, mientras que cada escenario ejecuta un `BrowserContext` y `Page` aislados en los hooks `Before` y `After`.
- **Captura automática de evidencia (`this.attach`)**: En caso de fallo de un escenario, el hook `After` toma una captura de pantalla y la adjunta directamente al reporte HTML/JSON de Cucumber.
- **Pasaje de contexto (`world.ts`)**: Se extiende la clase `World` de Cucumber para compartir e inyectar de manera segura las instancias de `page`, `context` y `browser` de Playwright entre los distintos *step definitions*.

---

## Requisitos Previos

- **Node.js**: v18 o superior instalado.
- **NPM**: Gestor de paquetes de Node.js.

---

## Pasos para Ejecutar las Pruebas

1. **Descomprimir el archivo del proyecto** y abrir la carpeta en la terminal o VS Code.

2. **Instalar dependencias**:
   ```bash
   npm install
   ```

3. **Instalar el navegador de Playwright**:
   ```bash
   npx playwright install chromium
   ```

4. **Ejecutar el conjunto de pruebas**:
   ```bash
   npm test
   ```
   *(O alternativamente: `npx cucumber-js`)*

---

## Reportes Generados

Al finalizar la ejecución, Cucumber genera automáticamente los reportes dentro de la carpeta `reports/`:
- `reports/cucumber-report.json`: Reporte estructurado en formato JSON requerido para evaluación.
- `reports/cucumber-report.html`: Reporte visual e interactivo en HTML con capturas de pantalla adjuntas en caso de fallos.
