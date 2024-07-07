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
  FOR j:= 1 TO 10 DO
   BEGIN
   textcolor(lightcyan);
   write('   ',tab[f,j]);
  END;
 END;
END;

PROCEDURE colocar_barcos(var tab: tablero);
VAR
 opcion: string;
 eje_x,eje_y,columna,fila,f,j,x:integer;
BEGIN
 writeln();
 writeln('COLOQUE SUS BARCOS EN POSICION ');
 writeln('-------------------------------');
 writeln();
 writeln('COLOQUE EL ACORAZADO: ');
 writeln();
 write('De que forma desea colocarlo[v/h]?: ');
 readln(opcion);
 IF opcion = 'h' THEN
 BEGIN
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
   write('>>> Ingrese su nombre jugador nro 1: ');
   readln(jugador_1);
   colocar_barcos(tab_1);
   writeln();
   mostrar_tabla(tab_1);
   writeln();
  END
  ELSE
  BEGIN
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

 END;

PROCEDURE bandera_inglesa;
 BEGIN
 textcolor(lightcyan);
 writeln('MMMMWN0xl:;,,,,,,,:OWOllllllkN0c,,,,,,,;:ldOXWMMMM');
 writeln('MMWKd;............ kNk::::::xNO,............;dKWMM');
 writeln('MW0:.............. kNk:::;::xNO,..............:OWM');
 writeln('MWN0d: ........... kNk::::::xNO,............;oxxON');
 writeln('KKNWMN0d: ........ kNk::::::xNO,........ :odxdlcdK');
 writeln('xcok0NWMN0xc ..... kWk::::::xNO,..... :oxxoccokKNW');
 writeln('Oxdlcox0NWMWKxc,.. kNk::::::xNO,.. :oxxoccdkKWMWNX');
 writeln('c;ldxdlclx0XWMWKxc:ONk::::::xNO::oxxocldOKWWWXOo;c');
 writeln('o::cok00xodx0NMMMWXNNk::::::xNNK0kdodOXWMMMNOdc::o');
 writeln('NXXXXNNWNNNNNNWWWWWWNx::::::xXWNNNNNNWWWWWWNXXXXXN');
 writeln('koododooodooooooooodoc::::::codooooooododoodoooook');
 writeln('o::::::::::::::::::::::::::::::::::::::::::::::::o');
 writeln('o::::::::::::::::::::::::::::::::::::::::::::::::o');
 writeln('o::::::::::::::::::::::::::::::::::::::::::::::::o');
 writeln('K0000000000000000000Oo::::::oO0000000000000000000K');
 writeln('0kkkkOXWMMMWNK0O0KNWNx::::::xNMMMMMWNKOO0XWN0kkkk0');
 writeln(':. :d0NMWNKkocldxxxKNk::::::xNKxOXWMWKkocldxxdc,.:');
 writeln('dd0NMWN0xocldxxo:  kNk::::::xNO,.;oOXWMWKkdlcoxxdx');
 writeln('WWWN0xlcldxxo;.... kNx::::::xNO,....;okXWMWKOdlcoO');
 writeln('N0xlclxxxl;....... kNx::::::xNO,.......,lkXWMWXOxk');
 writeln('Kdoxxdl;.......... kNk::::::xNO,..........,lkKWMWW');
 writeln('WXOl,............. kNk::::::xNO,.............,l0WM');
 writeln('MWKo,............. kNk::::::xNO,.............,dKWM');
 writeln('MMMWKxc; ......... kNk::::::xNO,..........;lxKWMMM');
 writeln('MMMMMMNKkoc:::::::c0WOooooooOWKl:::::::cokKWMMMMMM');
 END;


PROCEDURE empezar_partida;
VAR
 objetivo: string;
 turno_jugador,fila,columna,opcion: integer;
 BEGIN
{ mostrar_instrucciones_de_juego;   }
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
  mostrar_tabla(tab_1);
  writeln();
  writeln();
  textcolor(white);
  writeln();
  writeln('INGRESE LAS COORDENADAS ESPECIFICAS');
  writeln('-----------------------------------');
  writeln();
  fila:= valida_fila;
  writeln();
  columna:= valida_columna;
  writeln();
  writeln('COORDENADAS PREPARADAS PARA EL ATAQUE!');
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
          writeln('ACORAZADO DANIADO!!!');
         END
        ELSE IF vida_acorazado_jugador_2 = 1 THEN
         BEGIN
          vida_acorazado_jugador_2:= vida_acorazado_jugador_2 - 1;
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          writeln('ACORAZADO HUNDIDO!!!');
         END;
        END;

      2:BEGIN
        IF vida_crucero_jugador_2 >= 2 THEN
         BEGIN
         vida_crucero_jugador_2:= vida_crucero_jugador_2 - 1;
         tab_2[fila,columna]:= '';
         writeln('CRUCERO DANIADO!!');
         END
        ELSE IF vida_acorazado_jugador_2 = 1 THEN
         BEGIN
         barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
         tab_2[fila,columna]:= '';
         vida_crucero_jugador_2:= 3;
         total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
         writeln('CRUCERO HUNDIDO!!!');
         END;
        END;

       3:BEGIN
         IF vida_destructor_jugador_2 >= 2 THEN
          BEGIN
          vida_destructor_jugador_2:= vida_destructor_jugador_2 - 1;
          tab_2[fila,columna]:= '';
          writeln('DESTRUCTOR DANIADO!!');
          END
         ELSE IF vida_destructor_jugador_2 = 1 THEN
          BEGIN
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          vida_destructor_jugador_2:= 2;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          writeln('DESTRUCTOR HUNDIDO!!!');
          END;
         END;

       4:BEGIN
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          writeln('SUBMARINO HUNDIDO!!!');
         END;

       5:BEGIN
         writeln('AGUA!!');
         END;
  END;
  turno_jugador:= turno_jugador + 1;
  delay(2000);
  END
 ELSE
  BEGIN
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
  {cartel_jugador_2; }
  mostrar_tabla(tab_2);
  writeln();
  writeln();
  writeln('INGRESE LAS COORDENADAS ESPECIFICAS');
  writeln();
  fila:= valida_fila;
  writeln();
  columna:= valida_columna;
  writeln();
  writeln('COORDENADAS PREPARADAS PARA EL ATAQUE');
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
         writeln('ACORAZADO DANIADO!!!');
         END
        ELSE IF vida_acorazado_jugador_1 = 1 THEN
         BEGIN
         vida_acorazado_jugador_1:= vida_acorazado_jugador_1 - 1;
         tab_1[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
         total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
         writeln('ACORAZADO HUNDIDO!!!');
         END;
        END;

      2:BEGIN
        IF vida_crucero_jugador_1 >= 2 THEN
         BEGIN
         vida_crucero_jugador_1:= vida_crucero_jugador_1 - 1;
         tab_1[fila,columna]:= '';
         writeln('CRUCERO DANIADO!!!');
         END
        ELSE
         BEGIN
         tab_1[fila,columna]:= '';
         barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
         vida_crucero_jugador_1:= 3;
         total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
         writeln('CRUCERO HUNDIDO');
         END;
        END;

       3:BEGIN
         IF vida_destructor_jugador_1 >= 2 THEN
          BEGIN
          vida_destructor_jugador_1:= vida_destructor_jugador_1 - 1;
          tab_1[fila,columna]:= '';
          writeln('DESTRUCTOR DANIADO!!');
          END
         ELSE
          BEGIN
          tab_1[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
          vida_destructor_jugador_1:= 2;
          total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
          writeln('DESTRUCTOR HUNDIDO!!!');
          END;
         END;

       4:BEGIN
          tab_1[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_2:= barcos_destruidos_por_el_jugador_2 + 1;
          total_barcos_jugador_1:= total_barcos_jugador_1 - 1;
          writeln('SUBMARINO HUNDIDO!!!');
         END;

       5:BEGIN
         writeln('AGUA!!');
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
 writeln('||==============================================================');
 writeln('||        __ )     \  __ __| __ __|  |      ____|             ||');
 writeln('||        __ \    _ \    |      |    |      __|               ||');
 writeln('||        |   |  ___ \   |      |    |      |                 ||');
 writeln('||       ____/ _/    _\ _|     _|   _____| _____|             ||');
 writeln('||                       _ \   ____|                          ||');
 writeln('||                      |   |  |                              ||');
 writeln('||                      |   |  __|                            ||');
 writeln('||                     \___/  _|                       ___|   ||');
 writeln('||     \  __ __|  |         \      \  | __ __| _ _|    |      ||');
 writeln('||    _ \    |    |        _ \      \ |    |     |     |      ||');
 writeln('||   ___ \   |    |       ___ \   |\  |    |     |     |      ||');
 writeln('|| _/___|_\ _|   _____| _/    _\ _| \_|   _|   ___|   \____|  ||');
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
   writeln('---------------------------------');
   writeln('          MENU PRINCIPAL         ');
   writeln('---------------------------------');
   writeln('---------------------------------');
   writeln('|1| -   Partida estandar    - |1|');
   writeln('---------------------------------');
   writeln('|2| - Partida personalizada - |2|');
   writeln('---------------------------------');
   writeln('|3| -        Salir          - |3|');
   writeln('---------------------------------');
   writeln();
   writeln('===================================');
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

BEGIN
inicializa_tablero_1;
inicializa_tablero_2;
menu_principal;
END.
