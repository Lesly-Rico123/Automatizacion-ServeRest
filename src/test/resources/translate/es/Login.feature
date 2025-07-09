@LoginScenario
Característica: Login API Test
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

  Antecedentes: Obtener token

  @PRUEBA1
  Escenario: Login exitoso con credenciales válidas
    # Este escenario verifica que el sistema permita el login con credenciales válidas
    Dado url 'https://serverest.dev/login'
    Y header Content-Type = 'application/json'
    Y request { email: 'lrico@autonoma.edu.pe', password: 'clave' }
    Cuando method POST
    Entonces status 200
    * print response
    Y match response contains { message: 'Login realizado com sucesso' }
    Y match response contains { authorization: '#string' }

    @PRUEBA2
    Escenario: Login fallido con email inválido
        # Este escenario verifica que el sistema no permita el login con un email inválido
        Dado url 'https://serverest.dev/login'
        Y header Content-Type = 'application/json'
        Y request { email: 'lesly@gmail' , password: 'clave' }
        Cuando method POST
        Entonces status 400
        * print response
        Y match response contains { email: 'email deve ser um email válido' }

    @PRUEBA3
    Escenario: Login fallido con credenciales inválidas
    # Este escenario verifica que el sistema no permita el login con credenciales inválidas
        Dado url 'https://serverest.dev/login'
        Y header Content-Type = 'application/json'
        Y request { email: 'lrico@autonoma.edu.pe', password: 'incorrecta' }
        Cuando method POST
        Entonces status 401
        * print response
        Y match response contains { message: 'Email e/ou senha inválidos' }



