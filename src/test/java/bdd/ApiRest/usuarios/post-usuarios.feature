@CrearUsuario @PruebaFinal

Feature: Crear usuario

  @Crear1
  Scenario Outline: Crear un usuario con datos válidos
    Given url 'https://serverest.dev/usuarios'
    And header Content-Type = 'application/json'
    And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
    When method POST
    Then status 201
    * print response
    # Verificar que la respuesta contenga el usuario creado
    And match response contains { message: 'Cadastro realizado com sucesso' }
    Examples:
      | nome               | email                   | password | administrador |
      | Briggitte Elescano | Briggittw7@gmail.com.pe | clave    | true          |

  @Crear2
    Scenario Outline: Validar que el email ya existe al crear un usuario
      Given url 'https://serverest.dev/usuarios'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
      When method POST
      Then status 400
      * print response
      # Verificar que la respuesta indique que el email ya está en uso
     And match response contains { message: 'Este email já está sendo usado' }

      Examples:
        | nome               | email                            | password | administrador |
        | Briggitte Elescano | jhomar_1752006921327@example.com | clave    | true          |

    @Crear3
    Scenario Outline: Validar email es inválido al crear un usuario
      Given url 'https://serverest.dev/usuarios'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
      When method POST
      Then status 400
      * print response
      # Verificar que la respuesta indique que el email es inválido
      And match response contains { email: 'email deve ser um email válido' }
      Examples:
        | nome            | email    | password | administrador |
        | Prueba Elescano | Prueba1@ | clave    | true          |

    @Crear4
    Scenario Outline: Validar que el campo administrador es requerido al crear un usuario
      Given url 'https://serverest.dev/usuarios'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', email: '<email>', password: '<password>' }
      When method POST
      Then status 400
      * print response
      # Verificar que la respuesta indique que el campo administrador es requerido
        * match response == { administrador: 'administrador é obrigatório' }
      Examples:
        | nome               | email             | password |
        | Briggitte Elescano | brig@gmail.com.pe | clave    |

    @Crear5
    Scenario Outline: Validar que el campo nome es requerido al crear un usuario
      Given url 'https://serverest.dev/usuarios'
      And header Content-Type = 'application/json'
      And request { email: '<email>', password: '<password>', administrador: '<administrador>' }
      When method POST
      Then status 400
      * print response
      # Verificar que la respuesta indique que el campo nome es requerido
      And match response contains { nome: 'nome é obrigatório' }
      Examples:
        | email             | password | administrador |
        | brig@gmail.com.pe | clave    | true          |

    @Crear6
    Scenario Outline: Validar que el campo email es requerido al crear un usuario
      Given url 'https://serverest.dev/usuarios'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', password: '<password>', administrador: '<administrador>' }
      When method POST
      Then status 400
      * print response
      # Verificar que la respuesta indique que el campo email es requerido
      And match response contains { email: 'email é obrigatório' }
      Examples:
        | nome               | password | administrador |
        | Briggitte Elescano | clave    | true          |

    @Crear7
    Scenario Outline: Validar que el campo password es requerido al crear un usuario
      Given url 'https://serverest.dev/usuarios'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', email: '<email>', administrador: '<administrador>' }
      When method POST
      Then status 400
      * print response
      # Verificar que la respuesta indique que el campo password es requerido
      And match response contains { password: 'password é obrigatório' }
      Examples:
        | nome               | email             | administrador |
        | Briggitte Elescano | brig@gmail.com.pe | true          |


    @Crear8
    Scenario Outline: Validar que el campo administrador es booleano al crear un usuario
      Given url 'https://serverest.dev/usuarios'
      And header Content-Type = 'application/json'
      And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
      When method POST
      Then status 400
      * print response
      # Verificar que la respuesta indique que el campo administrador debe ser booleano
    * match response contains
    """
     { administrador: "administrador deve ser 'true' ou 'false'" }
     """

      Examples:
        | nome               | email             | password | administrador |
        | Briggitte Elescano | brig@gmail.com.pe | clave    | 123456        |

  @Crear9
    Scenario Outline: Validar que los campos no esten en blanco al crear un usuario
      Given url 'https://serverest.dev/usuarios'
        And header Content-Type = 'application/json'
        And request { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
        When method POST
        Then status 400
        * print response
        # Verificar que la respuesta indique que los campos no pueden estar en blanco
    And match response contains { nome: 'nome não pode ficar em branco' }
    And match response contains { email: 'email não pode ficar em branco' }
    And match response contains { password: 'password não pode ficar em branco' }
    And match response contains
    """
     { administrador: "administrador deve ser 'true' ou 'false'" }
     """
        Examples:
          | nome | email | password | administrador |
          |      |       |          |               |