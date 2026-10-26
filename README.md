# Proyecto 4: Automatización de Pruebas de Login - Obra Social de Hogwarts

Este proyecto contiene la suite de pruebas automatizadas para la pantalla de inicio de sesión de la Obra Social de Hogwarts (), abarcando los escenarios de prueba  a . Está desarrollado con **Cucumber.js** (Gherkin) y **Playwright** con **TypeScript**.

## Estructura del Proyecto



## Diseño y Buenas Prácticas

- **Reutilización y Mantenibilidad en Gherkin**: Se utiliza  para evitar repetir el paso de navegación inicial y un  con tabla de  para agrupar las pruebas de errores de validación y credenciales.
- **Selectores Específicos**: Se emplean únicamente los identificadores reales especificados en la aplicación (, , ,  y ), evitando selectores alternativos genéricos.
- **Centralización de Configuración**: La URL base del sistema se administra desde  para evitar la duplicación de datos hardcodeados en los escenarios.
- **Pasos Semánticos**: Las validaciones de redirección y mensajes se manejan en pasos declarativos independientes sin condicionales dentro del código de soporte.

## Requisitos Previos

- **Node.js**: v18 o superior.
- **NPM**: Gestor de paquetes.

## Instrucciones de Ejecución

1. Instalar las dependencias del proyecto:
   

2. Instalar el navegador Chromium para Playwright:
   

3. Ejecutar la suite de pruebas:
   

## Reportes Generados

Al finalizar la ejecución, los reportes se generan automáticamente en la carpeta :
- : Reporte estructurado en formato JSON.
- : Reporte interactivo en HTML con capturas de pantalla adjuntas ante fallas.

## Reporte de Defectos del Sistema bajo Prueba (SUT)

- **Falla esperada en LOG-13**: El escenario  ("Tres intentos fallidos consecutivos con correo registrado") falla intencionalmente durante la ejecución. La prueba verifica que tras el tercer intento fallido se muestre el aviso  sobre el elemento  según la especificación requerida. La falla expone un **defecto real en el sistema bajo prueba**, el cual no despliega dicho aviso de advertencia.
