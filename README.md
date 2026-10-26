# Proyecto 4: Automatización de Pruebas de Login - Obra Social de Hogwarts

Este proyecto contiene la suite de pruebas automatizadas para la pantalla de inicio de sesión de la Obra Social de Hogwarts (*http://www.cs.uns.edu.ar/\~mll/temp/testing/hogwarts/login.html*), abarcando los escenarios de prueba *LOG-01* a *LOG-13*. Está desarrollado con **Cucumber.js** (Gherkin) y **Playwright** con **TypeScript**.

## Estructura del Proyecto

```text
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

## Diseño y Buenas Prácticas

- **Reutilización y Mantenibilidad en Gherkin**: Se utiliza  para evitar repetir el paso de navegación inicial y un  con tabla de  para agrupar las pruebas de errores de validación y credenciales.
- **Selectores Específicos**: Se emplean únicamente los identificadores reales especificados en la aplicación (#email, #password, button:has-text("Ingresar"), #error-message y #warning-message), evitando selectores alternativos genéricos.
- **Centralización de Configuración**: La URL base del sistema se administra desde  para evitar la duplicación de datos hardcodeados en los escenarios.
- **Pasos Semánticos**: Las validaciones de redirección y mensajes se manejan en pasos declarativos independientes sin condicionales dentro del código de soporte.

## Requisitos Previos

- **Node.js**: v18 o superior.
- **NPM**: Gestor de paquetes.

## Instrucciones de Ejecución

1. Instalar las dependencias del proyecto: npm install
   

2. Instalar el navegador Chromium para Playwright: npx playwright install chromium
   

3. Ejecutar la suite de pruebas: npm test
   

## Reportes Generados

Al finalizar la ejecución, los reportes se generan automáticamente en la carpeta :
- : Reporte estructurado en formato JSON.
- : Reporte interactivo en HTML con capturas de pantalla adjuntas ante fallas.

## Reporte de Defectos del Sistema bajo Prueba (SUT)

- **Falla esperada en LOG-13**: El escenario  ("Tres intentos fallidos consecutivos con correo registrado") falla intencionalmente durante la ejecución. La prueba verifica que tras el tercer intento fallido se muestre el aviso  sobre el elemento  según la especificación requerida. La falla expone un **defecto real en el sistema bajo prueba**, el cual no despliega dicho aviso de advertencia.
