PROGRAM world_war_2_game;
USES crt;

TYPE
    tablero_1 = array[1..10,1..10]of string;
    tablero_2 = array[1..10,1..10]of string;

VAR
   tab_1: tablero_1;
   tab_2: tablero_2;

PROCEDURE inicializa_tablero_1;
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
 BEGIN
 FOR f:= 1 TO 10 DO
  BEGIN
  FOR j:= 1 TO 10 DO
   BEGIN
   tab_2[f,j]:= '';
   END;
  END;
 END;




BEGIN
inicializa_tablero_1;
inicializa_tablero_2;

END.
