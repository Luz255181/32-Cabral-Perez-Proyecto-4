# Proyecto 4: Automatización de Pruebas de Login - Obra Social de Hogwarts

Este proyecto contiene la automatización de los casos de prueba `LOG-01` a `LOG-13` para la pantalla de inicio de sesión de la Obra Social de Hogwarts (`http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html`), utilizando **Cucumber.js** (Gherkin) y **Playwright** con **TypeScript**, siguiendo la arquitectura y buenas prácticas expuestas en la guía de BrowserStack.

## Estructura del Proyecto

```
.
├── test/
│  └──features/
│  │    └── login.feature      # Escenarios en Gherkin (LOG-01 a LOG-13)
│  ├── steps/
│  │   └── loginSteps.ts      # Definiciones de pasos con Playwright
│  └── support/
│     ├── world.ts           # Configuración de CustomWorld de Cucumber
│     └── hooks.ts           # BeforeAll/AfterAll (Browser) y Before/After (Context/Page/Screenshots)
├── cucumber.json          # Configuración de Cucumber.js y generación de reportes
├── package.json           # Dependencias y scripts de NPM
└── README.md              # Guía de instalación y ejecución
```

## Arquitectura y Patrones (BrowserStack Guide)

- **Optimización del ciclo de vida del navegador (`hooks.ts`)**: Se utiliza `BeforeAll` y `AfterAll` para inicializar el navegador Chromium una sola vez por suite de pruebas, mientras que cada escenario ejecuta un `BrowserContext` y `Page` aislados en los hooks `Before` y `After`.
- **Captura automática de evidencia (`this.attach`)**: En caso de fallo de un escenario, el hook `After` toma una captura de pantalla y la adjunta directamente al reporte HTML/JSON de Cucumber.
- **Pasaje de contexto (`world.ts`)**: Se extiende `World` de Cucumber para compartir las instancias de `page`, `context` y `browser` de Playwright entre los distintos *step definitions*.

## Requisitos Previos

- **Node.js**: v18 o superior instalado.
- **NPM**: Gestor de paquetes.

## Pasos para Ejecutar las Pruebas

1. **Instalar dependencias**:
   ```bash
   npm install
   ```

2. **Instalar navegadores de Playwright**:
   ```bash
   npx playwright install chromium
   ```

3. **Ejecutar el conjunto de pruebas**:
   ```bash
   npm test
   ```

## Reportes Generados

Al finalizar las pruebas, Cucumber genera automáticamente los reportes en la carpeta `reports/`:
- `cucumber-report.json`: Reporte de ejecución estructurado en JSON.
- `cucumber-report.html`: Reporte visual interactivo en HTML con capturas de pantalla adjuntas en caso de fallos.
