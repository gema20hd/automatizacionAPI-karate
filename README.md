Realizadas por:  Gema Zumba
1. Prerequisitos:
- Maquina local con el sistema operativo Windows o MAC
- IDE IntelliJ IDEA Community Edition 2022.3.3
- Gradle version 7.6.1 (debe estar en la variable de entorno)
- JDK versión 11 o superior (debe estar en la variable de entorno)

2. Comandos de instalación
    * Descagar el proyecto en el directorio que desee
    * Abrir el proyecto con el IDE indicado  anteriormente
    * Esperar que se descargue todas las dependencias

3. Instrucciones para ejecutar los test
* Para realizar el proceso de ejecución de los escenarios dentro del proyecto se debe realizar el siguiente proceso:
* Abrir el proyecto en el siguiente directorio: ../nttdata-prueba-karate
* Ejecutar el siguiente comando(dependiendo del escenario a correr) en el terminal del IDE:
  Comando: .\gradlew clean test "-Dkarate.options=--tags nombreTag" "-Dkarate.env=test"
  Tags: @CrearUsuarioExitoso, @CrearUsuarioExistente, @LoginExitoso, @LoginFallidoUser, @LoginFallidoPassword
  Ejemplo: .\gradlew clean test "-Dkarate.options=--tags @LoginExitoso" "-Dkarate.env=test"

4. Visualizar los reportes en el navegador de preferencia
   Al terminar de ejecutar el comando anterior, se genera una carpeta con el nombre buid
   dentro de ella contiene una carpeta llamada karate-reports, ahí se encuentra los reportes
   abrir en el IDE el archivo karate-summary.html y movemos el mouse por la parte derecha
   y aparece los navegadores donde se puede visualizar el reporte,hacer clip en el navegador de preferencia
   y se abre el navegador


5. Información adicional
   Link de descarga de Gradle : https://downloads.gradle.org/distributions/gradle-7.6.1-all.zip

6. La automatización fue desarrollada con:

    * BDD - Estrategia de desarrollo
    * Gradle - Manejador de dependencias
    * Cucumber - Framework para automatizar pruebas BDD
    * Gherkin - Lenguaje Business Readable DSL (Lenguaje especifico de dominio legible por el negocio)
