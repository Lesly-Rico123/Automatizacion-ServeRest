@BuscarUsuarioPorId @PruebaFinal

Feature: Buscar usuario por ID

    @UsuarioID1
   Scenario Outline: Buscar un usuario por su ID existente
      * def headers = read('classpath:headers/default.json')
      * def expected = read('classpath:response/Usuario/BuscarUsuarioID.json')
     Given url baseUrl + '/usuarios'
     And path '<id>'
     When method GET
     Then status 200
     * print response
     # Verificar que la respuesta contenga el usuario correcto
      * match response == expected
        Examples:
            | id               |
            | 6756i2PxHd7UC2wp |

      @UsuarioID2
    Scenario Outline: Buscar un usuario por su ID inexistente
        Given url baseUrl + '/usuarios'
        And path '<id>'
        When method GET
        Then status 400
        * print response
        # Verificar que la respuesta indique que el usuario no fue encontrado
        * match response contains { message: 'Usuário não encontrado' }
            Examples:
              | id               |
              | 1234567890abcdef |