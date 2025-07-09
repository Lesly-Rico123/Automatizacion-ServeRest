@EliminarUsuarioId  @PruebaFinal
Feature: Eliminar usuario por ID

  @Eliminar1
  Scenario Outline: Eliminar usuario por ID
    Given url baseUrl + '/usuarios/'
    And path '<id>'
    When method DELETE
    Then status 200
    And print response
    # Verificar que la respuesta contenga el mensaje de éxito
    * match response == { message: 'Registro excluído com sucesso' }
    Examples:
      | id |
      | 0d8FURDBs5aCn49v   |

  @Eliminar2
  Scenario Outline: Eliminar usuario con ID inexistente
    Given url baseUrl + '/usuarios/'
    And path '<id>'
    When method DELETE
    Then status 200
    And print response
    # Verificar que la respuesta contenga el mensaje
    * match response == { message: 'Nenhum registro excluído' }

    Examples:
      | id               |
      | 1234567890abcdef |

    @Eliminar3
    Scenario Outline: Eliminar usuario sin ID
      Given url baseUrl + '/usuarios/'
      And path '<id>'
      When method DELETE
      Then status 405
      And print response
        # Verificar que la respuesta contenga el mensaje de error
        * match response == { message: 'Não é possível realizar DELETE em /usuarios/. Acesse https://serverest.dev para ver as rotas disponíveis e como utilizá-las.' }
      Examples:
        | id |
        |    |


