
_main:

;projet.c,14 :: 		void main(void)
;projet.c,16 :: 		trisb = 0;
	CLRF       TRISB+0
;projet.c,17 :: 		portb = 0;
	CLRF       PORTB+0
;projet.c,18 :: 		for(;;)
L_main0:
;projet.c,19 :: 		{  portb=DIGITS[i];
	MOVF       R2+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;projet.c,20 :: 		i++;
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;projet.c,21 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;projet.c,22 :: 		if(i==9)
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      9
	XORWF      R2+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;projet.c,23 :: 		{ for(;;)
L_main5:
;projet.c,24 :: 		{portb=DIGITS[i];
	MOVF       R2+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;projet.c,25 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;projet.c,26 :: 		i--;
	MOVLW      1
	SUBWF      R2+0, 1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
;projet.c,28 :: 		if(i==0)
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	XORWF      R2+0, 0
L__main12:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;projet.c,29 :: 		{break;}
	GOTO       L_main6
L_main9:
;projet.c,30 :: 		}
	GOTO       L_main5
L_main6:
;projet.c,31 :: 		}
L_main4:
;projet.c,32 :: 		}
	GOTO       L_main0
;projet.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
