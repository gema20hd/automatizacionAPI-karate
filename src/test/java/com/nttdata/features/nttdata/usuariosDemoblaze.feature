@REQ_DTA-2023 @DemoblazeSet
Feature: Consultar Apis de la Demoblaze
  #Background:
  #  * header content-type = 'application/json'

  @CrearCredenciales @ignore
  Scenario:
    * header content-type = 'application/json'
    * def entrada = read('classpath:../Request/credenciales.json')
    * set entrada.username = karate.get('user')
    * set entrada.password = karate.get('pass')
    * print entrada
    Given url baseUrl+"signup"
    And request entrada
    When method POST
    Then status 200
    And print response

  @Login @ignore
  Scenario:
    * header content-type = 'application/json'
    * def entrada = read('classpath:../Request/credenciales.json')
    * set entrada.username = karate.get('user')
    * set entrada.password = karate.get('pass')
    * print entrada
    Given url baseUrl+"login"
    And request entrada
    When method POST
    Then status 200
    And print response


  @TEST_NTTDATA @CrearUsuarioExitoso @Demoblaze
  Scenario Outline: T - API - Crear credenciales de manera exitosa
    * def result = call read('usuariosDemoblaze.feature@CrearCredenciales'){user: '<user>',pass: '<pass>'}
    Examples:
      |read('classpath:../data/credenciales.csv')

  @TEST_NTTDATA @CrearUsuarioExistente @Demoblaze
  Scenario Outline: T - API - Crear un usuario ya existente
    * def result = call read('usuariosDemoblaze.feature@CrearCredenciales'){user: '<user>',pass: '<pass>'}
    And match result.response contains { errorMessage: "This user already exist." }
    Examples:
      |read('classpath:../data/credenciales.csv') |


  @TEST_NTTDATA @LoginExitoso @Demoblaze
  Scenario Outline: T - API - Login usuario y password correcto
    * def result = call read('usuariosDemoblaze.feature@Login'){user: '<user>',pass: '<pass>'}
    And match result.response.Auth_token != "#notnull"
    Examples:
      |read('classpath:../data/credenciales.csv') |

  @TEST_NTTDATA @LoginFallidoUser @Demoblaze
  Scenario Outline: T - API - Login usuario incorrecto
    * def result = call read('usuariosDemoblaze.feature@Login'){user: '<user>',pass: '<pass>'}
    And match result.response contains {"errorMessage": "User does not exist."}
    Examples:
      |read('classpath:../data/usuarioIncorrecto.csv') |

  @TEST_NTTDATA @LoginFallidoPassword @Demoblaze
  Scenario Outline: T - API - Login password incorrecto
    * def result = call read('usuariosDemoblaze.feature@Login'){user: '<user>',pass: '<pass>'}
    And match result.response contains {"errorMessage": "Wrong password."}
    Examples:
      |read('classpath:../data/claveIncorrecta.csv') |