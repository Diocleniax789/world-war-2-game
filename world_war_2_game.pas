PROGRAM world_war_2_game;
USES crt;

TYPE
    tablero = array[1..10,1..10]of string;

VAR
   tab_1,tab_2: tablero;
   jugador_1,jugador_2: string;
   vida_acorazado_jugador_1,vida_acorazado_jugador_2,barcos_destruidos_por_el_jugador_1,barcos_destruidos_por_el_jugador_2,vida_crucero_jugador_2,
   vida_destructor_jugador_2,total_barcos_jugador_1,total_barcos_jugador_2: integer;

PROCEDURE inicializa_tablero_1;
VAR
 f,j: integer;
 BEGIN
 FOR f:= 1 TO 10 DO
  BEGIN
  FOR j:= 1 TO 10 DO
   BEGIN
   tab_1[f,j]:= ' ';
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
   tab_2[f,j]:= ' ';
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
 writeln();
 writeln('COLOQUE SUS BARCOS EN POSICION ');
 writeln('-------------------------------');
 writeln();
 writeln('COLOQUE EL ACORAZADO: ');
 writeln();
 write('De que forma desea colocarlo[vertical/horizontal]?: ');
 readln(opcion);
 IF opcion = 'horizontal' THEN
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
  IF opcion = 'horizontal' THEN
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
  write('>>> De que forma desea colocarlo [vertical/horizontal]?: ');
  readln(opcion);
  IF opcion = 'horizontal' THEN
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

FUNCTION localiza_objetivo(fila,columna: integer): string;
VAR
 objetivo: string;
 opcion: integer;
 BEGIN
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
        vida_acorazado_jugador_2:= 4;
        vida_acorazado_jugador_2:= vida_acorazado_jugador_2 - 1;
        tab_2[fila,columna]:= '';
        localiza_objetivo:= 'ACORAZADO DANIADO!!!';
        IF vida_acorazado_jugador_2 = 0 THEN
         BEGIN
         barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
         total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
         localiza_objetivo:= 'ACORAZADO HUNDIDO!!!';
         END;
        END;

      2:BEGIN
        vida_crucero_jugador_2:= 3;
        vida_crucero_jugador_2:= vida_crucero_jugador_2 - 1;
        tab_2[fila,columna]:= '';
        localiza_objetivo:= 'CRUCERO DANIADO!!!';
        IF vida_crucero_jugador_2 = 0 THEN
         BEGIN
         barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
         vida_crucero_jugador_2:= 0;
         total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
         localiza_objetivo:= 'CRUCERO HUNDIDO' ;
         END;
        END;

       3:BEGIN
         vida_destructor_jugador_2:= 2;
         vida_destructor_jugador_2:= vida_destructor_jugador_2 -1;
         tab_2[fila,columna]:= '';
         localiza_objetivo:= 'DESTRUCTOR DANIADO';
         IF vida_destructor_jugador_2 = 0 THEN
          BEGIN
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          vida_destructor_jugador_2:= 0;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          localiza_objetivo:= 'DESTRUCTOR HUNDIDO';
          END;
         END;

       4:BEGIN
          tab_2[fila,columna]:= '';
          barcos_destruidos_por_el_jugador_1:= barcos_destruidos_por_el_jugador_1 + 1;
          total_barcos_jugador_2:= total_barcos_jugador_2 - 1;
          localiza_objetivo:= 'SUBMARINO HUNDIDO' ;
         END;

       5:BEGIN
         localiza_objetivo:= 'AGUA!!';
         END;
  END;
 END;

PROCEDURE empezar_partida;
VAR
 letrero_aviso:  string;
 turno_jugador,fila,columna: integer;
 BEGIN
{ mostrar_instrucciones_de_juego;   }
 turno_jugador:= 0;
 total_barcos_jugador_1:= 10;
 total_barcos_jugador_2:= 10;
 barcos_destruidos_por_el_jugador_1:= 0;
 barcos_destruidos_por_el_jugador_2:= 0;
 REPEAT
 clrscr;
 turno_jugador:= turno_jugador + 1;
 IF turno_jugador = 1 THEN
  BEGIN
  writeln('===============================================');
  writeln('JUGADOR 1: ',jugador_1);
  writeln('===============================================');
  writeln('TU CANTIDAD DE BARCOS: ',total_barcos_jugador_1);
  writeln('===============================================');
  writeln('CANTIDAD DE BARCOS QUE HUNDISTE: ',barcos_destruidos_por_el_jugador_1);
  writeln('===============================================');
  writeln();
 { cartel_jugador_1;          }
  mostrar_tabla(tab_1);
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
  letrero_aviso:= localiza_objetivo(fila,columna);
  turno_jugador:= turno_jugador + 1;
  writeln(letrero_aviso);
  delay(2000);
  END
 ELSE
  BEGIN
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
  letrero_aviso:= localiza_objetivo(fila,columna);
  writeln(letrero_aviso);
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

PROCEDURE menu_principal;
VAR
   opcion: integer;
   BEGIN
   REPEAT
   clrscr;
   writeln('WORLD WAR 2 GAME V1.0');
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
