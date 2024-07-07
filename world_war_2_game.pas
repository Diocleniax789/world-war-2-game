PROGRAM world_war_2_game;
USES crt;

TYPE
    tablero = array[1..10,1..10]of string;

VAR
   tab_1,tab_2: tablero;
   jugador_1,jugador_2: string;
   vida_acorazado_jugador_1,vida_crucero_jugador_1,vida_destructor_jugador_1,vida_acorazado_jugador_2,barcos_destruidos_por_el_jugador_1,barcos_destruidos_por_el_jugador_2,vida_crucero_jugador_2,
   vida_destructor_jugador_2,total_barcos_jugador_1,total_barcos_jugador_2: integer;

PROCEDURE inicializa_tablero_1;
VAR
 f,j: integer;
 BEGIN
 FOR f:= 1 TO 10 DO
  BEGIN
  FOR j:= 1 TO 10 DO
   BEGIN
   tab_1[f,j]:= '';
   END;
  END;
 END;

PROCEDURE inicializa_tablero_2;
VAR
 f,j: integer;
 BEGIN
 FOR f:= 1 TO 10 DO
  BEGIN
  FOR j:= 1 TO 10 DO
   BEGIN
   tab_2[f,j]:= '';
   END;
  END;
 END;

FUNCTION valida_fila(): integer;
VAR
 pos: integer;
 BEGIN
 REPEAT
 write('>>> Ingrese numero de fila: ');
 readln(pos);
 IF (pos < 1) OR (pos > 10) THEN
  BEGIN
  textcolor(lightred);
  writeln();
  writeln('=====================================================');
  writeln('X Numero de fila fuera de rango. Ingrese nuevamente X');
  writeln('=====================================================');
  writeln();
  END;
 UNTIL (pos >= 1) AND (pos <= 10);
 valida_fila:= pos;
 END;

FUNCTION valida_columna(): integer;
VAR
 pos: integer;
 BEGIN
 REPEAT
 write('>>> Ingrese numero de columna: ');
 readln(pos);
 IF (pos < 1) OR (pos > 10) THEN
  BEGIN
  textcolor(lightred);
  writeln();
  writeln('========================================================');
  writeln('X Numero de columna fuera de rango. Ingrese nuevamente X');
  writeln('========================================================');
  writeln();
  END;
 UNTIL (pos >= 1) AND (pos <= 10);
 valida_columna:= pos;
 END;

PROCEDURE mostrar_tabla(tab: tablero);
var
 f,j: integer;
 BEGIN
 FOR f:= 1 TO 10 DO
  BEGIN
  writeln();
  FOR j:= 1 TO 10 DO
   BEGIN
   textcolor(lightcyan);
   write('  ',tab[f,j]);
  END;
 END;
END;

PROCEDURE colocar_barcos(var tab: tablero);
VAR
 opcion: string;
 eje_x,eje_y,columna,fila,f,j,x:integer;
BEGIN
 textcolor(brown);
 writeln();
 writeln('-------------------------------');
 writeln('COLOQUE SUS BARCOS EN POSICION ');
 writeln('-------------------------------');
 writeln();
 textcolor(green);
 writeln('COLOQUE EL ACORAZADO: ');
 writeln();
 write('De que forma desea colocarlo[v/h]?: ');
 readln(opcion);
 IF opcion = 'h' THEN
 BEGIN
  writeln();
  writeln();
  eje_x:= valida_fila;
  writeln('Ingrese las columnas de forma consecutiva: ');
  eje_y:= 0;
  FOR f:= 1 TO 4 DO
  BEGIN
   columna:= valida_columna;
   eje_y:= columna;
   tab[eje_x,eje_y]:= 'A';
  END;
  textcolor(green);
  writeln();
  writeln();
  writeln('ACORAZADO LISTO!');
  writeln();
 END
 ELSE
 BEGIN
  eje_y:= valida_columna;
  writeln('Ingrese las filas de forma consecutiva: ');
  eje_x:= 0;
  FOR f:= 1 TO 4 DO
  BEGIN
   fila:= valida_fila;
   eje_x:= fila;
   tab[eje_x,eje_y]:= 'A';
  END;
  writeln();
  writeln('ACORAZADO LISTO!');
  writeln();
 END;
 writeln();
 writeln('-------------------------------------------------');
 writeln();
 writeln('COLOQUE LOS DOS CRUCEROS');
 writeln();
 FOR x:= 1 TO 2 DO
 BEGIN
  writeln();
  writeln('Crucero ',x);
  writeln();
  write('>>> De que forma desea colocarlo [v/h]?: ');
  readln(opcion);
  IF opcion = 'h' THEN
  BEGIN
   eje_x:= valida_fila;
   writeln();
   writeln();
   writeln('Ingrese las columnas de forma consecutiva: ');
   eje_y:= 0;
   FOR f:= 1 TO 3 DO
   BEGIN
    columna:= valida_columna;
    eje_y:= columna;
    tab[eje_x,eje_y]:= 'C';
   END;
   writeln();
   writeln('CRUCERO LISTO!');
   writeln();
  END
  ELSE
  BEGIN
   eje_y:= valida_columna;
   writeln('Ingrese las filas de forma consecutiva: ');
   eje_x:= 0;
   FOR f:= 1 TO 3 DO
   BEGIN
    fila:= valida_fila;
    eje_x:= fila;
    tab[eje_x,eje_y]:= 'C';
   END;
   writeln();
   writeln('CRUCERO LISTO!');
   writeln();
  END;
 END;
 writeln();
 writeln('--------------------------------------------');
 writeln();
 writeln('COLOQUE LOS TRES DESTRUCTORES');
 writeln();
 FOR j:= 1 TO 3 DO
 BEGIN
  writeln('Destructor ',j);
  write('>>> De que forma desea colocarlo [v/h]?: ');
  readln(opcion);
  IF opcion = 'h' THEN
  BEGIN
   eje_x:= valida_fila;
   writeln();
   writeln('Ingrese las columnas de forma consecutiva: ');
   eje_y:= 0;
   FOR f:= 1 TO 2 DO
   BEGIN
    columna:= valida_columna;
    eje_y:= columna;
    tab[eje_x,eje_y]:= 'D';
   END;
   writeln();
   writeln('DESTRUCTOR LISTO!');
   writeln();
  END
  ELSE
  BEGIN
   eje_y:= valida_columna;
   writeln('Ingrese las filas de forma consecutiva: ');
   eje_x:= 0;
   FOR f:= 1 TO 2 DO
   BEGIN
    fila:= valida_fila;
    eje_x:= fila;
    tab[eje_x,eje_y]:= 'D';
   END;
   writeln();
   writeln('DESTRUCTOR LISTO!');
   writeln();
  END;
 END;
 writeln();
 writeln('--------------------------------------------');
 writeln();
 writeln('COLOQUE LOS CUATRO SUBMARINOS');
 writeln();
 FOR j:= 1 TO 4 DO
 BEGIN
  writeln('Submarino ',j);
  writeln();
  eje_x:= valida_fila;
  eje_y:= valida_columna;
  tab[eje_x,eje_y]:= 'S';
  writeln();
  writeln('SUBMARINO LISTO!');
  writeln();
 END;
 writeln();
 writeln('*** TODOS LOS BARCOS EN POSICION ***');
END;

PROCEDURE carga;
VAR
 i: integer;
BEGIN
 FOR i:= 1 TO 2 DO
 BEGIN
  clrscr;
  writeln('Jugador ',i);
  writeln();
  IF i = 1 THEN
  BEGIN
   textcolor(cyan);
   write('>>> Ingrese su nombre jugador nro 1: ');
   readln(jugador_1);
   colocar_barcos(tab_1);
   writeln();
   mostrar_tabla(tab_1);
   writeln();
  END
  ELSE
  BEGIN
   textcolor(cyan);
   write('>>> Ingrese su nombre jugador nro 2: ');
   readln(jugador_2);
   colocar_barcos(tab_2);
   writeln();
   mostrar_tabla(tab_2);
   writeln();
  END;
  writeln();
  textcolor(white);
  writeln('Presione enter para continuar...');
  readln();
 END;
END;

PROCEDURE bandera_alemania;
 BEGIN
 textcolor(lightred);
 writeln('               ,;cllllllc;,               ');
 writeln('             :dOKXOc''lKNKOo:             ');
 writeln('           ;dKWNOc. ´cdXNXWWKd;           ');
 writeln('          ;kNMXl. .oXWNk;.cONNk;          ');
 writeln('         ,dXXXNk;  ;ll;  . .c0Xd,         ');
 writeln('         ;xo.´dXNd.    .d0d´ .ox;         ');
 writeln('          ,xOc. ´c;  ..  ;kNXdoOx,        ');
 writeln('           lKN0c.  ;kKKo. .lXMWKl         ');
 writeln('          ,l0WNOdkNXdc´ .cONW0l,          ');
 writeln('            :d0NWMK:  .cONN0d:            ');
 writeln('              ;ldkkoc:oOkdl;              ');
 writeln('               ,;cllllllc;                ');
 END;

PROCEDURE bandera_inglesa;
 BEGIN
 textcolor(lightcyan);
 writeln(' MMMNOdc;,,    ;OXdccccdXO:     ,,;cdONWMM ');
 writeln(' MNk:.......... kKo:::;oKk,..........:xNM  ');
 writeln(' nMNkc .........kKo:::;lKk,.........:ooON  ');
 writeln(' KXWNKxc,...... kKo:::;oKk,...... :lodod0  ');
 writeln(' xodOKNWKxl,... kKo:::;oKk,...,:oddoox0NW  ');
 writeln(' dodoodkKNWKkl,,kKo:::;oKk,,cooooox0NWXOk  ');
 writeln(' c;cdkkdox0NWWXOKKo::::oKKkkxodk0NWWKxl;c  ');
 writeln(' K000KXXK0KXNNNNNKo:::;l0NXK0KXNNNNNK000K  ');
 writeln(' xoooooooooooooool::::::looooooooooooooox  ');
 writeln(' l::::::::::::::::::::::::::::::::::::::l  ');
 writeln(' l::::::::::::::::::::::::::::::::::::::l  ');
 writeln(' 0OOOOOOOOOOOOOOOxl::::cxOOOOOOOOOOOOOOO0  ');
 writeln(' kddxKWMWWXOkk0XNKo:::;oKWWWMWN0kk0XKkddk  ');
 writeln(' c:d0NWXOdooddllOKo:::;oK0ld0NWXOxooddo:c  ');
 writeln(' XNNXOdooddl: . kKo:::;oKk,. :oOXWN0xoodk  ');
 writeln(' XOdooddl: .... kKo:::;oKk,.....;oOXWN0xk  ');
 writeln(' Kxddl; ....... kKo::::oKk,........;oOXWW  ');
 writeln(' MXo .......... kKo::::oKk,...........dNM  ');
 writeln(' MMXxc,........ kKo::::oKk,........,ckXMM  ');
 writeln(' MMMMN0dc;;;;;;:OXxllllxX0c;;;;;:cd0NMMMM  ');
 END;

PROCEDURE mostrar_introduccion_instrucciones_de_juego;
 BEGIN
 textcolor(lightcyan);
 writeln('||===================================================================================================================================||');
 textcolor(lightgreen);
 writeln('||                                                                                                                                   ||');
 writeln('||                                          BIENVENIDO AL JUEGO DE LA BATALLA DEL ATALANTICO                                         ||');
 writeln('||                                                                                                                                   ||');
 writeln('|| De 1939 a 1945 la suerte de la segunda guerra mundial dependió en buena medida del resultado final de la «batalla del Atlántico», ||');
 writeln('|| un enfrentamiento que se saldó con la pérdida de 648 submarinos alemanes, 3.500 buques mercantes aliados y de cerca de cien mil   ||');
 writeln('|| hombres de uno y otro bando. En este juego tendras la oportunidad de poner aprueba tu ingenio y colocar tus buques de guerra de   ||');
 writeln('|| forma estrategica para lograr vencer a tu adversario.                                                                             ||');
 writeln('||                                                                                                                                   ||');
 writeln('|| Para poder ganar la partida tienes que destruir todos los barcos del enemigo. El primero que lo haga sera el ganador.             ||');
 writeln('||                                                                                                                                   ||');
 writeln('|| Buena suerte! Un punto crucial de la Segunda Guerra Mundial se decidira en esta batalla!                                          ||');
 writeln('||                                                                                                                                   ||');
 textcolor(lightcyan);
 writeln('||===================================================================================================================================||');
 writeln();
 writeln();
 writeln('PULSE ENTER PARA CONTINUAR...');
 readln();
 clrscr;
 END;

PROCEDURE empezar_partida;
VAR
 objetivo: string;
 turno_jugador,fila,columna,opcion: integer;
 BEGIN
 mostrar_introduccion_instrucciones_de_juego;
 turno_jugador:= 0;
 total_barcos_jugador_1:= 10;
 total_barcos_jugador_2:= 10;
 barcos_destruidos_por_el_jugador_1:= 0;
 barcos_destruidos_por_el_jugador_2:= 0;
 vida_acorazado_jugador_1:= 4;
 vida_acorazado_jugador_2:= 4;
 vida_crucero_jugador_1:= 3;
 vida_crucero_jugador_2:= 3;
 vida_destructor_jugador_2:= 2;
 vida_destructor_jugador_1:= 2;
 REPEAT
 clrscr;
 turno_jugador:= turno_jugador + 1;
 IF turno_jugador = 1 THEN
  BEGIN
  textcolor(white);
  writeln('GRAN BRETANIA');
  writeln();
  bandera_inglesa;
  writeln();
  textcolor(lightgreen);
  writeln('===============================================');
  writeln('JUGADOR 1: ',jugador_1);
  writeln('===============================================');
  writeln('TU CANTIDAD DE BARCOS: ',total_barcos_jugador_1);
  writeln('===============================================');
  writeln('CANTIDAD DE BARCOS QUE HUNDISTE: ',barcos_destruidos_por_el_jugador_1);
  writeln('===============================================');
  writeln();
  writeln('=================================================');
  writeln('TUS BARCOS EN POSICION DE ATAQUE');
  writeln('=================================================');
  mostrar_tabla(tab_1);
  writeln('=================================================');
  writeln();
  writeln();
  textcolor(white);
  writeln();
  writeln('-------------------------------------------------');
  writeln('INGRESE LAS COORDENADAS ESPECIFICAS');
  writeln();
  fila:= valida_fila;
  writeln();
  columna:= valida_columna;
  textcolor(lightcyan);
  writeln();
  writeln('========================================');
  writeln('COORDENADAS PREPARADAS PARA EL ATAQUE!!!');
  writeln('========================================');
  writeln();
  objetivo:= tab_2[fila,columna];
  IF objetivo = 'A' THEN
   opcion:= 1
  ELSE IF objetivo = 'C' THEN
   opcion:= 2
  ELSE IF objetivo = 'D' THEN
   opcion:= 3
  ELSE IF objetivo = 'S' THEN
   opcion:= 4
  ELSE IF objetivo = '' THEN
   opcion:= 5;
 CASE opcion OF

      1:BEGIN
        IF vida_acorazado_jugador_2 >= 2 THEN
         BEGIN
         vida_acorazado_jugador_2:= vida_acorazado_jugador_2 - 1;
         tab_2[fila,columna]:= '';
         textcolor(lightred);
         writeln();
         writeln('====================');
         writeln('ACORAZADO DANIADO!!!');
         writeln('====================');
         END
        ELSE IF vida_acorazado_jugador_2 = 1 THEN
         BEGIN
          vida_acorazado_jugador_2:= vida_acorazado_jugador_2 - 1;
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          textcolor(lightgreen);
          writeln();
          writeln('====================');
          writeln('ACORAZADO HUNDIDO!!!');
          writeln('====================');
         END;
        END;

      2:BEGIN
        IF vida_crucero_jugador_2 >= 2 THEN
         BEGIN
         vida_crucero_jugador_2:= vida_crucero_jugador_2 - 1;
         tab_2[fila,columna]:= '';
         textcolor(lightred);
         writeln();
         writeln('=================');
         writeln('CRUCERO DANIADO!!');
         writeln('=================');
         END
        ELSE IF vida_acorazado_jugador_2 = 1 THEN
         BEGIN
         tab_2[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
         total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
         textcolor(lightgreen);
         writeln();
         writeln('==================');
         writeln('CRUCERO HUNDIDO!!!');
         writeln('==================');
         vida_crucero_jugador_2:= 3;
         END;
        END;

       3:BEGIN
         IF vida_destructor_jugador_2 >= 2 THEN
          BEGIN
          vida_destructor_jugador_2:= vida_destructor_jugador_2 - 1;
          tab_2[fila,columna]:= '';
          textcolor(lightred);
          writeln();
          writeln('====================');
          writeln('DESTRUCTOR DANIADO!!');
          writeln('====================');
          END
         ELSE IF vida_destructor_jugador_2 = 1 THEN
          BEGIN
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          textcolor(lightgreen);
          writeln();
          writeln('=====================');
          writeln('DESTRUCTOR HUNDIDO!!!');
          writeln('=====================');
          vida_destructor_jugador_2:= 2;
          END;
         END;

       4:BEGIN
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          textcolor(lightgreen);
          writeln();
          writeln('====================');
          writeln('SUBMARINO HUNDIDO!!!');
          writeln('===================');
         END;

       5:BEGIN
         textcolor(lightcyan);
         writeln();
         writeln();
         writeln('======');
         writeln('AGUA!!');
         writeln('======');
         END;
  END;
  turno_jugador:= turno_jugador + 1;
  delay(2000);
  END
 ELSE
  BEGIN
  textcolor(white);
  writeln('ALEMANIA NAZI');
  writeln();
  bandera_alemania;
  writeln();
  textcolor(lightgreen);
  writeln('===============================================');
  writeln('JUGADOR 2: ',jugador_2);
  writeln('===============================================');
  writeln('TU CANTIDAD DE BARCOS: ',total_barcos_jugador_2);
  writeln('===============================================');
  writeln('CANTIDAD DE BARCOS QUE HUNDISTE: ',barcos_destruidos_por_el_jugador_2);
  writeln('===============================================');
  writeln();
  writeln('=================================================');
  writeln('TUS BARCOS EN POSICION DE ATAQUE');
  writeln('=================================================');
  mostrar_tabla(tab_2);
  writeln('=================================================');
  textcolor(white);
  writeln();
  writeln();
  writeln('-------------------------------------------------');
  writeln('INGRESE LAS COORDENADAS ESPECIFICAS');
  writeln();
  fila:= valida_fila;
  writeln();
  columna:= valida_columna;
  textcolor(lightcyan);
  writeln();
  writeln('========================================');
  writeln('COORDENADAS PREPARADAS PARA EL ATAQUE!!!');
  writeln('========================================');
  writeln();
  objetivo:= tab_1[fila,columna];
  IF objetivo = 'A' THEN
   opcion:= 1
  ELSE IF objetivo = 'C' THEN
   opcion:= 2
  ELSE IF objetivo = 'D' THEN
   opcion:= 3
  ELSE IF objetivo = 'S' THEN
   opcion:= 4
  ELSE IF objetivo = '' THEN
   opcion:= 5;
  CASE opcion OF

      1:BEGIN
        IF vida_acorazado_jugador_1 >= 2 THEN
         BEGIN
         vida_acorazado_jugador_1:= vida_acorazado_jugador_1 - 1;
         tab_1[fila,columna]:= '';
         textcolor(lightred);
         writeln();
         writeln('====================');
         writeln('ACORAZADO DANIADO!!!');
         writeln('====================');
         END
        ELSE IF vida_acorazado_jugador_1 = 1 THEN
         BEGIN
         vida_acorazado_jugador_1:= vida_acorazado_jugador_1 - 1;
         tab_1[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
         total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
         textcolor(lightgreen);
         writeln();
         writeln('====================');
         writeln('ACORAZADO HUNDIDO!!!');
         writeln('====================');
         END;
        END;

      2:BEGIN
        IF vida_crucero_jugador_1 >= 2 THEN
         BEGIN
         vida_crucero_jugador_1:= vida_crucero_jugador_1 - 1;
         tab_1[fila,columna]:= '';
         textcolor(lightred);
         writeln();
         writeln('=================');
         writeln('CRUCERO DANIADO!!');
         writeln('=================');
         END
        ELSE IF  vida_crucero_jugador_1 = 1 THEN
         BEGIN
         tab_1[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
         vida_crucero_jugador_1:= 3;
         total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
         textcolor(lightgreen);
         writeln();
         writeln('==================');
         writeln('CRUCERO HUNDIDO!!!');
         writeln('==================');
         END;
        END;

       3:BEGIN
         IF vida_destructor_jugador_1 >= 2 THEN
          BEGIN
          vida_destructor_jugador_1:= vida_destructor_jugador_1 - 1;
          tab_1[fila,columna]:= '';
          textcolor(lightred);
          writeln();
          writeln('====================');
          writeln('DESTRUCTOR DANIADO!!');
          writeln('====================');
          END
         ELSE IF vida_destructor_jugador_1 = 1 THEN
          BEGIN
          tab_1[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
          vida_destructor_jugador_1:= 2;
          total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
          textcolor(lightgreen);
          writeln();
          writeln('=====================');
          writeln('DESTRUCTOR HUNDIDO!!!');
          writeln('=====================');
          END;
         END;

       4:BEGIN
          tab_1[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
          total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
          textcolor(lightgreen);
          writeln();
          writeln('====================');
          writeln('SUBMARINO HUNDIDO!!!');
          writeln('===================');
         END;

       5:BEGIN
         textcolor(lightcyan);
         writeln();
         writeln('======');
         writeln('AGUA!!');
         writeln('======');
         END;
  END;
  turno_jugador:= 0;
  delay(2000);
  END;
 UNTIL (total_barcos_jugador_1 = 0) OR (total_barcos_jugador_2 = 0);
 END;

PROCEDURE partida_estandar;
VAR
 opcion: integer;
 BEGIN
 REPEAT
 clrscr;
 writeln('-----------------------------------------------------------');
 writeln('|1| - Cargue nombre de Jugadores y coloque sus barcos - |1|');
 writeln('-----------------------------------------------------------');
 writeln('|2| -               Empezar partida                   - |2|');
 writeln('-----------------------------------------------------------');
 writeln('|3| -          Regresar al menu principal             - |3|');
 writeln('-----------------------------------------------------------');
 writeln();
 writeln('===========================================');
 write('Seleccione opcion: ');
 readln(opcion);
 CASE opcion OF
      1:BEGIN
        clrscr;
        carga;
       END;
      2:BEGIN
        clrscr;
        empezar_partida;
        END;
 END;
 UNTIL(opcion = 3);
 END;

PROCEDURE cartel_inicial;
 BEGIN
 textcolor(lightcyan);
 gotoxy(whereX, whereY + 10);
 gotoxy(whereX + 50, whereY);
 writeln('||============================================================||');
 gotoxy(whereX + 50, whereY);
 writeln('||        __ )     \  __ __| __ __|  |      ____|             ||');
 gotoxy(whereX + 50, whereY);
 writeln('||        __ \    _ \    |      |    |      __|               ||');
 gotoxy(whereX + 50, whereY);
 writeln('||        |   |  ___ \   |      |    |      |                 ||');
 gotoxy(whereX + 50, whereY);
 writeln('||       ____/ _/    _\ _|     _|   _____| _____|             ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                       _ \   ____|                          ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                      |   |  |                              ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                      |   |  __|                            ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                     \___/  _|                       ___|   ||');
 gotoxy(whereX + 50, whereY);
 writeln('||     \  __ __|  |         \      \  | __ __| _ _|    |      ||');
 gotoxy(whereX + 50, whereY);
 writeln('||    _ \    |    |        _ \      \ |    |     |     |      ||');
 gotoxy(whereX + 50, whereY);
 writeln('||   ___ \   |    |       ___ \   |\  |    |     |     |      ||');
 gotoxy(whereX + 50, whereY);
 writeln('|| _/___|_\ _|   _____| _/    _\ _| \_|   _|   ___|   \____|  ||');
 gotoxy(whereX + 50, whereY);
 writeln('||==============================================================');
 END;

PROCEDURE menu_principal;
VAR
   opcion: integer;
   BEGIN
   REPEAT
   clrscr;
   cartel_inicial;
   textcolor(white);
   writeln();
   gotoxy(whereX + 65 ,whereY);
   writeln('---------------------------------');
   gotoxy(whereX + 65 ,whereY);
   writeln('          MENU PRINCIPAL         ');
   gotoxy(whereX + 65 ,whereY);
   writeln('---------------------------------');
   gotoxy(whereX + 65 ,whereY);
   writeln('---------------------------------');
   gotoxy(whereX + 65 ,whereY);
   writeln('|1| -   Partida estandar    - |1|');
   gotoxy(whereX + 65 ,whereY);
   writeln('---------------------------------');
   gotoxy(whereX + 65 ,whereY);
   writeln('|2| - Partida personalizada - |2|');
   gotoxy(whereX + 65 ,whereY);
   writeln('---------------------------------');
   gotoxy(whereX + 65 ,whereY);
   writeln('|3| -        Salir          - |3|');
   gotoxy(whereX + 65 ,whereY);
   writeln('---------------------------------');
   writeln();
   gotoxy(whereX + 65 ,whereY);
   writeln('===================================');
   gotoxy(whereX + 65 ,whereY);
   write('Seleccione una opcion: ');
   readln(opcion);
   CASE opcion OF
        1:BEGIN
          clrscr;
          partida_estandar;
          END;
      {  2:BEGIN
          clrscr;
          partida_personalizada;
          END;     }
   END;
   UNTIL (opcion = 3)
   END;

PROCEDURE cartel_inicial_start;
 BEGIN
 textcolor(blue);
 gotoxy(whereX, whereY + 5);
 gotoxy(whereX + 50, whereY);
 writeln('||============================================================||');
 gotoxy(whereX + 50, whereY);
 writeln('||        __ )     \  __ __| __ __|  |      ____|             ||');
 gotoxy(whereX + 50, whereY);
 writeln('||        __ \    _ \    |      |    |      __|               ||');
 gotoxy(whereX + 50, whereY);
 writeln('||        |   |  ___ \   |      |    |      |                 ||');
 gotoxy(whereX + 50, whereY);
 writeln('||       ____/ _/    _\ _|     _|   _____| _____|             ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                       _ \   ____|                          ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                      |   |  |                              ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                      |   |  __|                            ||');
 gotoxy(whereX + 50, whereY);
 writeln('||                     \___/  _|                       ___|   ||');
 gotoxy(whereX + 50, whereY);
 writeln('||     \  __ __|  |         \      \  | __ __| _ _|    |      ||');
 gotoxy(whereX + 50, whereY);
 writeln('||    _ \    |    |        _ \      \ |    |     |     |      ||');
 gotoxy(whereX + 50, whereY);
 writeln('||   ___ \   |    |       ___ \   |\  |    |     |     |      ||');
 gotoxy(whereX + 50, whereY);
 writeln('|| _/___|_\ _|   _____| _/    _\ _| \_|   _|   ___|   \____|  ||');
 gotoxy(whereX + 50, whereY);
 writeln('||==============================================================');
 writeln();
 writeln();
 writeln();
 writeln();
 writeln();
 writeln();
 textcolor(white);
 gotoxy(whereX + 75,whereY + 20);
 writeln('PRESIONE ENTER');
 readln();
 END;

BEGIN
cartel_inicial_start;
inicializa_tablero_1;
inicializa_tablero_2;
menu_principal;
END.
