# check
Framework de test basado en bash


# Uso

El make copia los arvchivos al directorio ./check segun el target elegido se eligen distintos sets de ejecucion

Al ejecutar check con la opcion --exec ejecuta las scripts de prueba que esten el dir ./check.d


# Pendientes
- [x] ✅ agregar un contador de tests-ejecutados/tests-ok
- [ ] clean up de codigo residual y hardcodes 🚧
- [ ] Version con Jenkinsfile 🚧
- [x] agregar un contador de tests-ejecutados/tests-ok
- [ ] ver como tomar parte del filename dek test por parametro 
- [ ] registar un log de actividad en Logger
  - [ ] en ELK
- [ ] implementar la generacion de un esqueleto de test


# Changelog
## 2020-05-24
- Empezando con check rust version

## 2020-05-17 
- Probado existozamente en CentOS y Ubuntu
- empezando a control calidad (shellcheck)
- Error de Falso Failure por Java 11
  
## 2020-05-16 
- Agregado de tests de herramientas para PHP CI http://jenkins-php.org/
