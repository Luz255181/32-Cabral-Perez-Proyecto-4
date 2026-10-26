# language: es
Característica: Autenticación de usuarios en la Obra Social de Hogwarts

  Antecedentes:
    Dado que el usuario navega a la página de inicio de sesión

  Esquema del escenario: Intentos de inicio de sesión con errores de validación o credenciales
    Cuando el usuario ingresa el correo "<correo>" y la contraseña "<password>"
    Y presiona el botón de ingresar
    Entonces se debe mostrar el mensaje de error "<mensaje>"

    Ejemplos:
      | caso   | correo           | password     | mensaje                                            |
      | LOG-01 |                  |              | Por favor, completa ambos campos.                  |
      | LOG-02 |                  | hermione2025 | Por favor, completa ambos campos.                  |
      | LOG-03 |                  | 123          | Por favor, completa ambos campos.                  |
      | LOG-04 | ron@hogwarts.com |              | Por favor, completa ambos campos.                  |
      | LOG-06 | ron@hogwarts.com | 123          | Usuario correcto, pero la contraseña es incorrecta. |
      | LOG-07 | vyvs@mail.com    |              | Por favor, completa ambos campos.                  |
      | LOG-08 | vyvs@mail.com    | hermione2025 | El usuario no es correcto.                         |
      | LOG-09 | vyvs@mail.com    | 123          | El usuario no es correcto.                         |
      | LOG-10 | harry.com        |              | Por favor, completa ambos campos.                  |
      | LOG-11 | harry.com        | hermione2025 | Por favor, ingrese un correo electrónico válido.   |
      | LOG-12 | harry.com        | 123          | Por favor, ingrese un correo electrónico válido.   |

  Escenario: Inicio de sesión exitoso con credenciales válidas (LOG-05)
    Cuando el usuario ingresa el correo "ron@hogwarts.com" y la contraseña "hermione2025"
    Y presiona el botón de ingresar
    Entonces el usuario debería ser redirigido a la página de bienvenida

  Escenario: Tres intentos fallidos consecutivos con correo registrado (LOG-13)
    Cuando el usuario ingresa el correo "ron@hogwarts.com" y la contraseña "123" 3 veces seguidas
    Entonces se debe mostrar el mensaje de advertencia de bloqueo "Atención, su cuenta está a punto de ser bloqueada."
