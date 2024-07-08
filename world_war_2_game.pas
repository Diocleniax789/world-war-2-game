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
 write('De que forma desea colocarlo[vertical/horizontal]?: ');
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
  write('>>> De que forma desea colocarlo [vertical/horizontal]?: ');
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
   writeln();
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
  writeln();
  write('>>> De que forma desea colocarlo [vertical/horizontal]?: ');
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
  writeln('====================================================================');
  writeln('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
  writeln('====================================================================');
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
 writeln('           ;dKWNOc. �cdXNXWWKd;           ');
 writeln('          ;kNMXl. .oXWNk;.cONNk;          ');
 writeln('         ,dXXXNk;  ;ll;  . .c0Xd,         ');
 writeln('         ;xo.�dXNd.    .d0d� .ox;         ');
 writeln('          ,xOc. �c;  ..  ;kNXdoOx,        ');
 writeln('           lKN0c.  ;kKKo. .lXMWKl         ');
 writeln('          ,l0WNOdkNXdc� .cONW0l,          ');
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
 writeln('|| De 1939 a 1945 la suerte de la segunda guerra mundial dependio en buena medida del resultado final de la �batalla del Atlantico�, ||');
 writeln('|| un enfrentamiento que se saldo con la perdida de 648 submarinos alemanes, 3.500 buques mercantes aliados y de cerca de cien mil   ||');
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

PROCEDURE cartel_turno_jugador_1;
 BEGIN
 textcolor(lightcyan);
 gotoxy(whereX, whereY + 20);
 gotoxy(whereX + 55, whereY);
 writeln(' __ __|                                           ');
 gotoxy(whereX + 55, whereY);
 writeln('   |  |   |   __|  __ \    _ \                    ');
 gotoxy(whereX + 55, whereY);
 writeln('   |  |   |  |     |   |  (   |                   ');
 gotoxy(whereX + 55, whereY);
 writeln('  _|)\__,_| _|    _|  _| \___/                    ');
 gotoxy(whereX + 55, whereY);
 writeln('                                                  ');
 gotoxy(whereX + 55, whereY);
 writeln('      _)                           |            _|');
 gotoxy(whereX + 55, whereY);
 writeln('    |  |   |   _` |   _` |   _` |   _ \    __|   |');
 gotoxy(whereX + 55, whereY);
 writeln('    |  |   |  (   |  (   |  (   |  (   |  |      |');
 gotoxy(whereX + 55, whereY);
 writeln('    | \__,_| \__, | \__,_| \__,_| \___/  _|     _|');
 gotoxy(whereX + 55, whereY);
 writeln('___/         |___/                                ');
 delay(2000);
 clrscr;
 END;

PROCEDURE cartel_turno_jugador_2;
 BEGIN
 textcolor(lightred);
 gotoxy(whereX, whereY + 20);
 gotoxy(whereX + 55, whereY);
 writeln(' __ __|                                                  ');
 gotoxy(whereX + 55, whereY);
 writeln('   |  |   |   __|  __ \    _ \                           ');
 gotoxy(whereX + 55, whereY);
 writeln('   |  |   |  |     |   |  (   |                          ');
 gotoxy(whereX + 55, whereY);
 writeln('  _|)\__,_| _|    _|  _| \___/                           ');
 gotoxy(whereX + 55, whereY);
 writeln('                                                         ');
 gotoxy(whereX + 55, whereY);
 writeln('      _)                           |              ___ \  ');
 gotoxy(whereX + 55, whereY);
 writeln('    |  |   |   _` |   _` |   _` |   _ \    __|       ) | ');
 gotoxy(whereX + 55, whereY);
 writeln('    |  |   |  (   |  (   |  (   |  (   |  |         __/  ');
 gotoxy(whereX + 55, whereY);
 writeln('    | \__,_| \__, | \__,_| \__,_| \___/  _|      _____|  ');
 gotoxy(whereX + 55, whereY);
 writeln('___/         |___/                                       ');
 delay(2000);
 clrscr;
 END;

PROCEDURE game_over;
 BEGIN
  clrscr;
  textcolor(lightred);
  writeln('  |   |                ');
  writeln('  |   |   _` |   __|   ');
  writeln('  ___ |  (   | \__ \   ');
  writeln(' _|  _| \__,_| ____/  ');
  writeln('                                          ');
  writeln('                        | _)      |       ');
  writeln('  __ \    _ \   __|  _` |  |   _` |   _ \ ');
  writeln('  |   |   __/  |    (   |  |  (   |  (   |');
  writeln('  .__/  \___| _|   \__,_| _| \__,_| \___/ ');
  writeln('  _|                                      ');
  writeln();
  writeln();
  writeln('HAS PERDIDO LA BATALLA. TODOS TUS BUQUES FUERON HUNDIDOS');
  delay(3000);
  clrscr;
 END;

PROCEDURE you_win;
 BEGIN
  textcolor(lightgreen);
  writeln('  |   |                ');
  writeln('  |   |   _` |   __|   ');
  writeln('  ___ |  (   | \__ \   ');
  writeln(' _|  _| \__,_| ____/  ');
  writeln('                                   |       ');
  writeln('   _` |   _` |  __ \    _` |   _` |   _ \  ');
  writeln('  (   |  (   |  |   |  (   |  (   |  (   | ');
  writeln(' \__, | \__,_| _|  _| \__,_| \__,_| \___/  ');
  writeln(' |___/                                     ');
  writeln();
  writeln('HAS GANADO LA BATALLA. ');
  delay(3000);
  clrscr;
 END;

PROCEDURE cartel_acorazado_hundido;
 BEGIN
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
  writeln('     \      ___|   _ \    _ \      \    __  /     \     __ \    _\ ');
  writeln('    _ \    |      |   |  |   |    _ \      /     _ \    |   |  |  |');
  writeln('   ___ \   |      |   |  __ <    ___ \    /     ___ \   |   |  |  |');
  writeln(' _/    _\ \____| \___/  _| \_\ _/    _\ ____| _/    _\ ____/  \___/');
  writeln(' |   |  |   |   \  |  __ \ _ _|  __ \    _ \    |  |  |            ');
  writeln(' |   |  |   |    \ |  |   |  |   |   |  |   |   |  |  |            ');
  writeln(' ___ |  |   |  |\  |  |   |  |   |   |  |   |  _| _| _|            ');
  writeln('_|  _| \___/  _| \_| ____/ ___| ____/  \___/   _) _) _)            ');
  writeln('===================================================================');
  writeln('//////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
 END;

PROCEDURE cartel_acorazado_daniado;
 BEGIN
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
  writeln('     \      ___|   _ \    _ \      \    __  /     \     __ \    _\ ');
  writeln('    _ \    |      |   |  |   |    _ \      /     _ \    |   |  |  |');
  writeln('   ___ \   |      |   |  __ <    ___ \    /     ___ \   |   |  |  |');
  writeln(' _/    _\ \____| \___/  _| \_\ _/    _\ ____| _/    _\ ____/  \___/');
  writeln(' __ \     \      \  | _ _|     \     __ \  _ \   |  |  |           ');
  writeln('|   |   _ \      \ |   |     _ \    |   | |   |  |  |  |           ');
  writeln('|   |  ___ \   |\  |   |    ___ \   |   | |   | _| _| _|           ');
  writeln('____/ _/    _\ _| \_| ___| _/    _\ ____/ \___/ _) _) _)           ');
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
 END;

PROCEDURE cartel_crucero_daniado;
 BEGIN
  writeln('========================================================');
  writeln('|//////////////////////////////////////////////////////|');
  writeln('========================================================');
  writeln(' ___|   _ \   |   |   ___|  ____|   _ \     _ \         ');
  writeln('|      |   |  |   |  |      __|    |   |  |   |         ');
  writeln('|      __ <   |   |  |      |      __ <   |   |         ');
  writeln('\___\| _| \_\ \___/  \____| _____| _| \_\ \___/         ');
  writeln(' __ \     \      \  | _ _|     \     __ \  _ \   |  |  |');
  writeln('|   |   _ \      \ |   |     _ \    |   | |   |  |  |  |');
  writeln('|   |  ___ \   |\  |   |    ___ \   |   | |   | _| _| _|');
  writeln('____/ _/    _\ _| \_| ___| _/    _\ ____/ \___/ _) _) _)');
  writeln('========================================================');
  writeln('|//////////////////////////////////////////////////////|');
  writeln('========================================================');
 END;

PROCEDURE cartel_crucero_hundido;
 BEGIN
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
  writeln(' ___|   _ \   |   |   ___|  ____|   _ \     _ \                    ');
  writeln('|      |   |  |   |  |      __|    |   |  |   |                    ');
  writeln('|      __ <   |   |  |      |      __ <   |   |                    ');
  writeln('\___\| _| \_\ \___/  \____| _____| _| \_\ \___/                    ');
  writeln(' |   |  |   |   \  |  __ \ _ _|  __ \    _ \    |  |  |            ');
  writeln(' |   |  |   |    \ |  |   |  |   |   |  |   |   |  |  |            ');
  writeln(' ___ |  |   |  |\  |  |   |  |   |   |  |   |  _| _| _|            ');
  writeln('_|  _| \___/  _| \_| ____/ ___| ____/  \___/   _) _) _)            ');
  writeln('===================================================================');
  writeln('//////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
 END;

PROCEDURE cartel_destructor_hundido;
 BEGIN
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
  writeln('__ \   ____|   ___| __ __|   _ \   |   |   ___| __ __|  _ \    _ \ ');
  writeln('|   |  __|   \___ \    |    |   |  |   |  |       |   |   |  |   | ');
  writeln('|   |  |           |   |    __ <   |   |  |       |   |   |  __ <  ');
  writeln('____/| ___\_| ___\_/   _|   _| \_\ \___/  \____|  _|  \___/  _| \_\');
  writeln(' |   |  |   |   \  |  __ \ _ _|  __ \    _ \    |  |  |            ');
  writeln(' |   |  |   |    \ |  |   |  |   |   |  |   |   |  |  |            ');
  writeln(' ___ |  |   |  |\  |  |   |  |   |   |  |   |  _| _| _|            ');
  writeln('_|  _| \___/  _| \_| ____/ ___| ____/  \___/   _) _) _)            ');
  writeln('===================================================================');
  writeln('//////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
 END;

PROCEDURE cartel_destructor_daniado;
 BEGIN
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
  writeln('__ \   ____|   ___| __ __|   _ \   |   |   ___| __ __|  _ \    _ \ ');
  writeln('|   |  __|   \___ \    |    |   |  |   |  |       |   |   |  |   | ');
  writeln('|   |  |           |   |    __ <   |   |  |       |   |   |  __ <  ');
  writeln('____/| ___\_| ___\_/   _|   _| \_\ \___/  \____|  _|  \___/  _| \_\');                                                  
  writeln(' __ \     \      \  | _ _|     \     __ \  _ \   |  |  |           ');
  writeln('|   |   _ \      \ |   |     _ \    |   | |   |  |  |  |           ');
  writeln('|   |  ___ \   |\  |   |    ___ \   |   | |   | _| _| _|           ');
  writeln('____/ _/    _\ _| \_| ___| _/    _\ ____/ \___/ _) _) _)           ');
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
 END;

PROCEDURE cartel_submarino_hundido;
 BEGIN
  writeln('===================================================================');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
  writeln('               |                         _)                        ');
  writeln('   __|  |   |  __ \  __ `__ \    _` |  __|  |  __ \    _ \         ');
  writeln(' \__ \  |   |  |   | |   |   |  (   | |     |  |   |  (   |        ');
  writeln(' ____/ \__,_| _.__/ _|  _|  _| \__,_|_|    _| _|  _| \___/         ');
  writeln(' |   |  |   |   \  |  __ \ _ _|  __ \    _ \    |  |  |            ');
  writeln(' |   |  |   |    \ |  |   |  |   |   |  |   |   |  |  |            ');
  writeln(' ___ |  |   |  |\  |  |   |  |   |   |  |   |  _| _| _|            ');
  writeln('_|  _| \___/  _| \_| ____/ ___| ____/  \___/   _) _) _)            ');
  writeln('===================================================================');
  writeln('//////////////////////////////////////////////////////////////////|');
  writeln('===================================================================');
 END;

PROCEDURE cartel_agua;
 BEGIN
  writeln('===========================================');
  writeln('|/////////////////////////////////////////|');
  writeln('===========================================');
  writeln('     \      ___|  |   |    \     |  |  |  ');
  writeln('    _ \    |      |   |   _ \    |  |  |  ');
  writeln('   ___ \   |   |  |   |  ___ \  _| _| _|  ');
  writeln(' _/    _\ \____| \___/ _/    _\ _) _) _)  ');
  writeln('==========================================');
  writeln('|////////////////////////////////////////|');
  writeln('==========================================');
 END;

FUNCTION verifica_estado_tablero(): boolean;
VAR
 f: boolean;
 i,j: integer;
 BEGIN
 f:= false;
 FOR i:= 1 TO 10 DO
  BEGIN
  FOR j:= 1 TO 10 DO
   BEGIN
   IF tab_1[i,j] = '' THEN
    f:= true;
   END;
  END;
 IF f = true THEN
  verifica_estado_tablero:= true
 ELSE
  verifica_estado_tablero:= false;
 END;

PROCEDURE empezar_partida;
VAR
 objetivo: string;
 turno_jugador,fila,columna,opcion: integer;
 BEGIN
 IF verifica_estado_tablero() = true THEN
  BEGIN
  textcolor(lightred);
  writeln();
  writeln('========================================================');
  writeln('X AUN LOS TABLEROS NO ESTAN CARGADOS. PRIMERO CARGELOS X');
  writeln('========================================================');
  delay(2000);
  END
 ELSE
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
   cartel_turno_jugador_1;
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
   writeln('===============================================');
   writeln('|/////////////////////////////////////////////|');
   writeln('===============================================');
   writeln('TUS BARCOS EN POSICION DE ATAQUE');
   writeln('===============================================');
   writeln('|/////////////////////////////////////////////|');
   writeln('===============================================');
   writeln();
   mostrar_tabla(tab_1);
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
         textcolor(yellow);
         writeln();
         cartel_acorazado_daniado;
         END
        ELSE IF vida_acorazado_jugador_2 = 1 THEN
         BEGIN
          vida_acorazado_jugador_2:= vida_acorazado_jugador_2 - 1;
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          textcolor(lightred);
          writeln();
          cartel_acorazado_hundido;
         END;
        END;

      2:BEGIN
        IF vida_crucero_jugador_2 >= 2 THEN
         BEGIN
         vida_crucero_jugador_2:= vida_crucero_jugador_2 - 1;
         tab_2[fila,columna]:= '';
         textcolor(yellow);
         writeln();
         cartel_crucero_daniado;
         END
        ELSE IF vida_acorazado_jugador_2 = 1 THEN
         BEGIN
         tab_2[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
         total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
         textcolor(lightred);
         writeln();
         cartel_crucero_hundido;
         vida_crucero_jugador_2:= 3;
         END;
        END;

       3:BEGIN
         IF vida_destructor_jugador_2 >= 2 THEN
          BEGIN
          vida_destructor_jugador_2:= vida_destructor_jugador_2 - 1;
          tab_2[fila,columna]:= '';
          textcolor(yellow);
          writeln();
          cartel_destructor_daniado;
          END
         ELSE IF vida_destructor_jugador_2 = 1 THEN
          BEGIN
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          textcolor(lightred);
          writeln();
          cartel_destructor_hundido;
          vida_destructor_jugador_2:= 2;
          END;
         END;

       4:BEGIN
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          textcolor(lightred);
          writeln();
          cartel_submarino_hundido;
         END;

       5:BEGIN
         textcolor(lightcyan);
         writeln();
         cartel_agua;
         END;
  END;
  turno_jugador:= turno_jugador + 1;
  delay(2000);
  clrscr;
  cartel_turno_jugador_2;
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
  writeln('===============================================');
  writeln('|/////////////////////////////////////////////|');
  writeln('===============================================');
  writeln('TUS BARCOS EN POSICION DE ATAQUE');
  writeln('===============================================');
  writeln('|/////////////////////////////////////////////|');
  writeln('===============================================');
  writeln();
  mostrar_tabla(tab_2);
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
         textcolor(yellow);
         writeln();
         cartel_acorazado_daniado;
         END
        ELSE IF vida_acorazado_jugador_1 = 1 THEN
         BEGIN
         vida_acorazado_jugador_1:= vida_acorazado_jugador_1 - 1;
         tab_1[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
         total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
         textcolor(lightred);
         writeln();
         cartel_acorazado_hundido;
         END;
        END;

      2:BEGIN
        IF vida_crucero_jugador_1 >= 2 THEN
         BEGIN
         vida_crucero_jugador_1:= vida_crucero_jugador_1 - 1;
         tab_1[fila,columna]:= '';
         textcolor(yellow);
         writeln();
         cartel_crucero_daniado;
         END
        ELSE IF  vida_crucero_jugador_1 = 1 THEN
         BEGIN
         tab_1[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
         vida_crucero_jugador_1:= 3;
         total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
         textcolor(lightred);
         writeln();
         cartel_crucero_hundido;
         END;
        END;

       3:BEGIN
         IF vida_destructor_jugador_1 >= 2 THEN
          BEGIN
          vida_destructor_jugador_1:= vida_destructor_jugador_1 - 1;
          tab_1[fila,columna]:= '';
          textcolor(yellow);
          writeln();
          cartel_destructor_daniado;
          END
         ELSE IF vida_destructor_jugador_1 = 1 THEN
          BEGIN
          tab_1[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
          vida_destructor_jugador_1:= 2;
          total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
          textcolor(lightred);
          writeln();
          cartel_destructor_hundido;
          END;
         END;

       4:BEGIN
          tab_1[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
          total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
          textcolor(lightred);
          writeln();
          cartel_submarino_hundido;
         END;

       5:BEGIN
         textcolor(lightcyan);
         writeln();
         cartel_agua;
         END;
  END;
  turno_jugador:= 0;
  delay(2000);
  END;
 UNTIL (total_barcos_jugador_1 = 0) OR (total_barcos_jugador_2 = 0);
 IF  total_barcos_jugador_1 = 0 THEN
  BEGIN
  game_over;
  writeln();
  writeln('Nombre jugador 1: ',jugador_1);
  writeln('Barcos que has hundido: ',barcos_destruidos_por_el_jugador_1 );
  clrscr;
  you_win;
  writeln('Nombre jugador 1: ',jugador_2);
  writeln('Barcos que has hundido: ',barcos_destruidos_por_el_jugador_2);
  inicializa_tablero_1;
  END
 ELSE IF total_barcos_jugador_2 = 0 THEN
  BEGIN
  game_over;
  writeln();
  writeln('Nombre jugador 2: ',jugador_2);
  writeln('Barcos que has hundido: ',barcos_destruidos_por_el_jugador_2 );
  clrscr;
  you_win;
  writeln('Nombre jugador 1: ',jugador_1);
  writeln('Barcos que has hundido: ',barcos_destruidos_por_el_jugador_1);
  inicializa_tablero_2;
  END;
  clrscr;
  writeln('=====================================================================================');
  writeln('PARA PODER JUGAR NUEVAMENTE VUELVA A CARGAR LOS BARCOS EN LA PRIMERA OPCION DEL MENU!');
  writeln('=====================================================================================');
  delay(2000);
  END;


 END;

PROCEDURE cartel_menu;
 BEGIN
 textcolor(cyan);
 gotoxy(whereX, whereY + 20);
 gotoxy(whereX + 65, whereY);
 writeln('==========================');
 gotoxy(whereX + 65, whereY);
 writeln('  \  |  ____|   \  | |   |');
 gotoxy(whereX + 65, whereY);
 writeln(' |\/ |  __|      \ | |   |');
 gotoxy(whereX + 65, whereY);
 writeln(' |   |  |      |\  | |   |');
 gotoxy(whereX + 65, whereY);
 writeln('_|  _| _____| _| \_| \___/');
 gotoxy(whereX + 65, whereY);
 writeln('==========================');
 END;

PROCEDURE Comenzar_partida;
VAR
 opcion: integer;
 BEGIN
 REPEAT
 clrscr;
 cartel_menu;
 textcolor(white);
 gotoxy(whereX, whereY + 2);
 gotoxy(whereX + 50, whereY);
 writeln('-----------------------------------------------------------');
 gotoxy(whereX + 50, whereY);
 writeln('|1| - Cargue nombre de Jugadores y coloque sus barcos - |1|');
 gotoxy(whereX + 50, whereY);
 writeln('-----------------------------------------------------------');
 gotoxy(whereX + 50, whereY);
 writeln('|2| -               Empezar partida                   - |2|');
 gotoxy(whereX + 50, whereY);
 writeln('-----------------------------------------------------------');
 gotoxy(whereX + 50, whereY);
 writeln('|3| -          Regresar al menu principal             - |3|');
 gotoxy(whereX + 50, whereY);
 writeln('-----------------------------------------------------------');
 writeln();
 gotoxy(whereX + 50, whereY);
 writeln('===========================================');
 gotoxy(whereX + 50, whereY);
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
   writeln('|1| -   Comenzar partida    - |1|');
   gotoxy(whereX + 65 ,whereY);
   writeln('---------------------------------');
   gotoxy(whereX + 65 ,whereY);
   writeln('|2| -        Salir          - |2|');
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
          Comenzar_partida;
          END;
   END;
   UNTIL (opcion = 2)
   END;

PROCEDURE cartel_inicial_start;
 BEGIN
 textcolor(brown);
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
