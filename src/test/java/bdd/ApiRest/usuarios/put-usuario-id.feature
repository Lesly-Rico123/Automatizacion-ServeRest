@ActualizarUsuario @PruebaFinal

Feature: Actualizar usuario

  @Actualizar1
    Scenario Outline: Actualizar un usuario con datos específicos
      Given url 'https://serverest.dev/usuarios/<id>'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
      When method PUT
      Then status 201
     And print response
     And match response.message == 'Cadastro realizado com sucesso'
     And match response._id != '<id>'

      Examples:
        | id               | nome     | email              | password | administrador |
        | V9ptmbO2phjrFmKW | Eli Rico | rico7@gmail.com.pe | clave    | true          |

  @Actualizar2
    Scenario Outline: Actualizar un usuario con gmail ya registrado
      Given url 'https://serverest.dev/usuarios/<id>'
      And header Content-Type = 'application/json'
    And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
      When method PUT
      Then status 400
     And print response
     And match response.message == 'Este email já está sendo usado'

      Examples:
        | id               | nome               | email                      | password        | administrador |
        | VVvajXddhVTt5lto | Dr. Dolores Hessel | Brionna_Pouros@hotmail.com | 0XawXd0g6SNdxvc | true          |

    @Actualizar3
    Scenario Outline: Validar los campos obligatorios al actualizar un usuario
      Given url 'https://serverest.dev/usuarios/<id>'
      And header Content-Type = 'application/json'
      And request { }
      When method PUT
      Then status 400
     And print response
     And match response.nome == 'nome é obrigatório'
      And match response.password == 'password é obrigatório'
      And match response.email == 'email é obrigatório'
      And match response.administrador == 'administrador é obrigatório'
      Examples:
        | id               |
        | V9ptmbO2phjrFmKW |

  @Actualizar4
    Scenario Outline: Validar que los campos no pueden estar vacíos al actualizar un usuario
      Given url 'https://serverest.dev/usuarios/<id>'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
      When method PUT
      Then status 400
      And print response
      And match response.nome == 'nome não pode ficar em branco'
      And match response.email == 'email não pode ficar em branco'
      And match response.password == 'password não pode ficar em branco'
      And match response contains
    """
     { administrador: "administrador deve ser 'true' ou 'false'" }
     """
      Examples:
        | id               | nome | email              | password | administrador |
        | V9ptmbO2phjrFmKW |      |                    |          |               |

