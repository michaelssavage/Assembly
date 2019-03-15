////////////////CLEAR THE VDU //////////////////
MOV AL, 00
OUT 02
INC AL
OUT 02
CLO
/////////////////INTIALIZE REGISTERS ////////////
MOV AL, 00
MOV BL, 99
MOV CL, 89

LOOP:
  MOV AL, [BL]
  OUT 02
  INNERLOOP:
    MOV AL, [CL]
    OUT 02
    CMP CL, 80
    JZ REPEAT
    DEC CL
    JMP INNERLOOP
/////////////////COUNTING DOWN ///////////////////////////
REPEAT:
  MOV CL, 89
  DEC BL
  CMP BL, 90
  JZ LAST
  JMP LOOP
////////////////CLEAR THE LEFT SIDE COMPLETELY ///////////  
LAST:
  MOV AL, 00
  OUT 02
  MOV CL, 89
///////////////// THE LAST 9 DIGITS///////////////////////
TENS:
  MOV AL, [CL]
  OUT 02
  CMP CL, 80
  JZ FINISH
  DEC CL
  JMP TENS

///////////////RIGHT SIDE OF 7-SEGMENT ////////////////////
ORG 80  
DB FB DB B DB B7 DB 9F DB 4F DB DD DB FD DB 8B DB FF DB DF

/////////////LEFT SIDE OF 7-SEGMENT ////////////////////////
ORG 90
DB FA DB A DB B6 DB 9E DB 4E DB DC DB FC DB 8A DB FE DB DE

FINISH:
  END
