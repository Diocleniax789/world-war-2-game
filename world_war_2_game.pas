PROGRAM world_war_2_game;
USES crt;

TYPE
    tablero_1 = array[1..10,1..10]of string;
    tablero_2 = array[1..10,1..10]of string;

VAR
   tab_1: tablero_1;
   tab_2: tablero_2;

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

PROCEDURE partida_estandar;
VAR
 BEGIN









 END;


PROCEDURE menu_principal;
VAR
   opcion: integer;
   BEGIN
   REPEAT
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
   write('Seleccione una opcion');
   readln(opcion);
   CASE opcion OF
        1:BEGIN
          clrscr;
          partida_estandar;
          END;
        2:BEGIN
          clrscr;
          partida_personalizada;
          END;
   END;
   UNTIL (opcion = 3)
   END;

BEGIN
inicializa_tablero_1;
inicializa_tablero_2;
menu_principal;
END.
