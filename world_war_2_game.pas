PROGRAM world_war_2_game;
USES crt;

TYPE
    tablero_1 = array[1..10,1..10]of string;
    tablero_2 = array[1..10,1..10]of string;

VAR
   tab_1: tablero_1;
   tab_2: tablero_2;
   jugador_1,jugador_2: string;

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

PROCEDURE mostrar_tabla_1;
var
 f,j: integer;
 BEGIN
 FOR f:= 1 TO 10 DO
  BEGIN
  writeln();
   writeln('------------------------------------------------------');
  FOR j:= 1 TO 10 DO
   BEGIN
   textcolor(yellow);
   write('  |  ',tab_1[f,j]);
  END;
 END;
END;

PROCEDURE colocar_barcos;
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
   tab_1[eje_x,eje_y]:= 'A';
  END;
  mostrar_tabla_1;
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
   tab_1[eje_x,eje_y]:= 'A';
  END;
  writeln();
  mostrar_tabla_1;
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
    tab_1[eje_x,eje_y]:= 'x';
   END;
   writeln();
   mostrar_tabla_1;
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
    tab_1[eje_x,eje_y]:= 'x';
   END;
   writeln();
   mostrar_tabla_1;
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
    tab_1[eje_x,eje_y]:= 'x';
   END;
   writeln();
   mostrar_tabla_1;
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
    tab_1[eje_x,eje_y]:= 'x';
   END;
   writeln();
   mostrar_tabla_1;
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
  tab_1[eje_x,eje_y]:= 'x';
  writeln();
  mostrar_tabla_1;
  writeln('SUBMARINO LISTO!');
  writeln();
 END;
 writeln();
 writeln('*** TODOS LOS BARCOS EN POSICION ***');
 mostrar_tabla_1;
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
   colocar_barcos;
   writeln();
   writeln('Barcos colocados!');
   writeln();
  END
  ELSE
  BEGIN
   write('>>> Ingrese su nombre jugador nro 2: ');
   readln(jugador_2);
   colocar_barcos;
   writeln();
   writeln('Barcos colocados!');
   writeln();
  END;
  textcolor(white);
  writeln('Presione enter para continuar...');
  readln();
 END;
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
    {  2:BEGIN
        clrscr;
        empezar_partida;
        END;    }
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
