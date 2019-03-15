MOV BL, C0
INPUT:
  IN 00
  CMP AL, 61       ;is the input < a?
  JS INPUT         ;if yes, try new input
  CMP AL, 7B
  JNS INPUT        ;is the input > z?
  CALL 50          ;if yes, try new input
  JMP INPUT
ORG 50
  SUB AL,20         ;input - 20 gives Uppercase
  MOV[BL],AL
  JMP INPUT
  RET
END
