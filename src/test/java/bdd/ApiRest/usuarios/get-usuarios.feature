@ListarUsuarios @PruebaFinal
Feature: Listar usuarios

@Usuario1
  Scenario: Listar usuarios registrados y obtener la cantidad de usuarios
    * def headers = read('classpath:headers/default.json')
    Given url baseUrl + '/usuarios'
    And headers headers
    When method GET
    Then status 200
    * print response
    # Extraer el array de usuarios
    * def usuarios = response.usuarios
    # Mostrar la cantidad de registros
    * def cantidad = usuarios.length
    * print 'Cantidad de usuarios registrados:', cantidad


  @Usuario2
  Scenario: Listar usuario registrado ingresando como parámetro el ID de un usuario específico
    * def headers = read('classpath:headers/default.json')
    Given url baseUrl + '/usuarios'
    And headers headers
    And param _id = '0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200
    * print response
    # Verificar datos del usuario
  * match response ==
  """
  {
    quantidade: 1,
    usuarios: [
      {
        "nome": "Fulano da Silva",
        "email": "fulano@qa.com",
        "password": "teste",
        "administrador": "true",
        "_id": "0uxuPY0cbmQhpEz1"
       }
    ]
  }
  """

  @Usuario3
  Scenario: Listar usuario registrado ingresando como parámetro el nombre de un usuario específico
    * def headers = read('classpath:headers/default.json')
    * def expected = read('classpath:response/Usuario/ListarUsuarios.json')
    Given url baseUrl + '/usuarios'
    And headers headers
    And param nome = 'Fulano da Silva'
    When method GET
    Then status 200
    * print response
     # Verificar que la respuesta coincida con el JSON esperado
    * match response == expected

  @Usuario4
    Scenario: Listar usuario registrado ingresando como parámetro email de un usuario específico
    * def headers = read('classpath:headers/default.json')
    Given url baseUrl + '/usuarios'
    And headers headers
    And param email = 'rico2@gmail.com.pe'
    When method GET
    Then status 200
    * print response
# Verificar datos del usuario
  * match response.quantidade == 1
  * match response.usuarios[0].nome == 'Eli Rico'
  * match response.usuarios[0].email == 'rico2@gmail.com.pe'
  * match response.usuarios[0].password == 'clave'

  @Usuario5
    Scenario: Listar usuario registrado ingresando como parámetro password
    * def headers = read('classpath:headers/default.json')
      Given url baseUrl + '/usuarios'
      And headers headers
      And param password = '123456'
      When method GET
      Then status 200
      * print response
    * match response.usuarios[2].nome == 'Teste QA'
    * match response.usuarios[2].password == '123456'


      @Usuario6
        Scenario: Listar usuarios administradores
    * def headers = read('classpath:headers/default.json')
    Given url baseUrl + '/usuarios'
    And headers headers
    And param administrador = 'true'
    When method GET
    Then status 200
    * print response

  @Usuario7
  Scenario: Listar usuarios ingresando un parametro inexistente
    * def headers = read('classpath:headers/default.json')
    Given url baseUrl + '/usuarios'
    And headers headers
    And param parametroInexistente = 'valorInexistente'
    When method GET
    Then status 400
    * print response
    # Verificar que la respuesta contenga el mensaje de error esperado
    * match response == { parametroInexistente: 'parametroInexistente não é permitido' }

    @Usuario8
    Scenario: Validar error del servicio
    * def headers = read('classpath:headers/default.json')
      Given url baseUrl + '/usuariosInvalido'
      And headers headers
      When method GET
      Then status 405
      * print response
      # Verificar que la respuesta contenga el mensaje de error esperado
      * match response == { message: 'Não é possível realizar GET em /usuariosInvalido. Acesse https://serverest.dev para ver as rotas disponíveis e como utilizá-las.' }