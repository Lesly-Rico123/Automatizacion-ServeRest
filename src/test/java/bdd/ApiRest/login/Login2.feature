@Login
Feature: Login API Test
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

  Background: Obtener token

    @Test1
    Scenario Outline: Login exitoso con credenciales válidas
      Given url baseUrl + '/login'
      And header Content-Type = 'application/json'
      And request { email: '<email>', password: '<password>' }
      When method POST
      Then status 200
      * print response
      And match response contains { message: 'Login realizado com sucesso' }
      And match response contains { authorization: '#string' }
        Examples:
            | email                  | password |
            | lrico@autonoma.edu.pe  | clave    |

      @Test2
        Scenario Outline: Login fallido con credenciales inválidas
          Given url baseUrl + '/login'
          And header Content-Type = 'application/json'
          And request { email: '<email>', password: '<password>' }
          When method POST
          Then status 401
            * print response
          And match response contains { message: 'Email e/ou senha inválidos' }
            Examples:
              | email               | password |
              | leslyrico@gmail.com | clave    |

        @Test3
        Scenario Outline: Login fallido con email inválido
          Given url baseUrl + '/login'
          And header Content-Type = 'application/json'
          And request { email: '<email>', password: '<password>' }
          When method POST
          Then status 400
            * print response
          And match response contains { email: 'email deve ser um email válido' }
            Examples:
              | email               | password |
              | lesly@gmail        | clave    |