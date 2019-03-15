;==========CLEAR THE DISPLAY========;
MOV AL, 00
OUT 02
INC AL
OUT 02
CLO
;==========Enter The Numbers========;
START:
  IN 00
  CMP AL, 71
  JZ FINISH
;==========Between 0 and 9?=========;  
  CMP AL, 30
  JNS CONTINUE
  JMP START
CONTINUE:
   CMP AL, 3A
   JS MAIN
   JMP START
;==========Check Right Side========;   
 MAIN:
  PUSH AL
  AND AL, 0F
  PUSH AL
  POP BL PUSH BL
  ADD BL, 80
  MOV AL, [80]
  OUT 02
;==========Check Left Side=========; 
  POP AL
  AND AL, F0
  POP DL
  DIV DL, 10
  ADD DL, 90
  MOV AL, [90]
  OUT 02
;==========Branch to end==========;
FINISH:
  JMP FIN
  
;======RIGHT SIDE OF 7-SEGMENT====;
ORG 80  
DB FB DB B DB B7 DB 9F DB 4F DB DD DB FD DB 8B DB FF DB DF

;=====LEFT SIDE OF 7-SEGMENT=======;
ORG 90
DB FA DB A DB B6 DB 9E DB 4E DB DC DB FC DB 8A DB FE DB DE

FIN:
  END
