# check
Framework de test basado en bash

[![Build Status](https://travis-ci.org/paulrm/check.svg?branch=master)](https://travis-ci.org/paulrm/check)

# Uso

El make copia los arvchivos al directorio ./check segun el target elegido se eligen distintos sets de ejecucion

Al ejecutar check con la opcion --exec ejecuta las scripts de prueba que esten el dir ./check.d


# Pendientes
- [ ] :2Do: agregar un contador de tests-ejecutados/tests-ok
- [ ] :2Do: ver como tomar el dir de check.d 
- [ ] :2Do: registar un log de actividad 
- [ ] :2Do: implementar un esqueleto de test
- [ ] :2Do: clean up de codigo residual en la opciones


# Changelog
## 2020-05-17 
- Probado existozamente en CentOS y Ubuntu
- empezando a control calidad (shellcheck)
- Error de Falso Failure por Java11
  
## 2020-05-16 
- Agregado de tests de herramientas para PHP CI http://jenkins-php.org/
