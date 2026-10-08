Feature: Autenticación de usuarios en la Obra Social de Hogwarts

  Scenario: Inicio de sesión con correo y contraseña vacíos (LOG-01)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "" y la contraseña ""
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, completa ambos campos."

  Scenario: Inicio de sesión con correo vacío y contraseña válida (LOG-02)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "" y la contraseña "hermione2025"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, completa ambos campos."

  Scenario: Inicio de sesión con correo vacío y contraseña inválida (LOG-03)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "" y la contraseña "123"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, completa ambos campos."

  Scenario: Inicio de sesión con correo registrado y contraseña vacía (LOG-04)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "ron@hogwarts.com" y la contraseña ""
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, completa ambos campos."

  Scenario: Inicio de sesión exitoso con credenciales válidas (LOG-05)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "ron@hogwarts.com" y la contraseña "hermione2025"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Acceso autorizado. Redirección a la página principal."

  Scenario: Inicio de sesión con correo registrado y contraseña incorrecta (LOG-06)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "ron@hogwarts.com" y la contraseña "123"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Usuario correcto, pero la contraseña es incorrecta."

  Scenario: Inicio de sesión con correo no registrado y contraseña vacía (LOG-07)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "vyvs@mail.com" y la contraseña ""
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, completa ambos campos."

  Scenario: Inicio de sesión con correo no registrado y contraseña válida (LOG-08)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "vyvs@mail.com" y la contraseña "hermione2025"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "El usuario no es correcto."

  Scenario: Inicio de sesión con correo no registrado y contraseña inválida (LOG-09)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "vyvs@mail.com" y la contraseña "123"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "El usuario no es correcto."

  Scenario: Inicio de sesión con correo de formato inválido y contraseña vacía (LOG-10)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "harry.com" y la contraseña ""
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, completa ambos campos."

  Scenario: Inicio de sesión con correo de formato inválido y contraseña válida (LOG-11)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "harry.com" y la contraseña "hermione2025"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, ingrese un correo electrónico válido."

  Scenario: Inicio de sesión con correo de formato inválido y contraseña inválida (LOG-12)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "harry.com" y la contraseña "123"
    And presiona el botón de ingresar
    Then se debe mostrar el mensaje "Por favor, ingrese un correo electrónico válido."

  Scenario: Tres intentos fallidos consecutivos con correo registrado (LOG-13)
    Given el usuario navega a la página de inicio de sesión "http://www.cs.uns.edu.ar/~mll/temp/testing/hogwarts/login.html"
    When el usuario ingresa el correo "ron@hogwarts.com" y la contraseña "123" 3 veces seguidas
    Then se debe mostrar el mensaje "Usuario correcto, pero la contraseña es incorrecta."
