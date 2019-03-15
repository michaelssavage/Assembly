INPUT:
  IN 00
  MOV BL, 32          ;start comparing with 2
  CMP AL, BL          ;is input > 2?
  JZ INPUT            ;if not, get new input
START:
  CMP AL, BL          ;is AL = BL?
  JZ ISPRIME          ;If yes, jump to the end
  PUSH AL POP CL
  MOD AL, BL          ;If zero, its not a prime
  JZ ISNOTPRIME
  PUSH CL POP AL
  INC BL
  JMP START
ISNOTPRIME:
  MOV AL, FF
ISPRIME:
  END
    
