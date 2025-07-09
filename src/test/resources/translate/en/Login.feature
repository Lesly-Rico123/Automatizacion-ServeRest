@LoginScenario
Feature: Login API Test
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

  Background: Obtener token

  @PRUEBA1
  Scenario: Login exitoso con credenciales válidas
    # Este escenario verifica que el sistema permita el login con credenciales válidas
    Given url 'https://serverest.dev/login'
    And header Content-Type = 'application/json'
    And request { email: 'lrico@autonoma.edu.pe', password: 'clave' }
    When method POST
    Then status 200
    * print response
    And match response contains { message: 'Login realizado com sucesso' }
    And match response contains { authorization: '#string' }

    @PRUEBA2
    Scenario: Login fallido con email inválido
        # Este escenario verifica que el sistema no permita el login con un email inválido
        Given url 'https://serverest.dev/login'
        And header Content-Type = 'application/json'
        And request { email: 'lesly@gmail' , password: 'clave' }
        When method POST
        Then status 400
        * print response
        And match response contains { email: 'email deve ser um email válido' }

    @PRUEBA3
    Scenario: Login fallido con credenciales inválidas
    # Este escenario verifica que el sistema no permita el login con credenciales inválidas
        Given url 'https://serverest.dev/login'
        And header Content-Type = 'application/json'
        And request { email: 'lrico@autonoma.edu.pe', password: 'incorrecta' }
        When method POST
        Then status 401
        * print response
        And match response contains { message: 'Email e/ou senha inválidos' }



