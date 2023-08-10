
_main:

;MyProject.c,1 :: 		void main(void)
;MyProject.c,3 :: 		TRISA=0xff;
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,4 :: 		TRISC=0xff;
	MOVLW      255
	MOVWF      TRISC+0
;MyProject.c,5 :: 		TRISB=0x00;
	CLRF       TRISB+0
;MyProject.c,6 :: 		PORTB=0x00;
	CLRF       PORTB+0
;MyProject.c,7 :: 		while(1)
L_main0:
;MyProject.c,9 :: 		if(RC0_bit==1)
	BTFSS      RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L_main2
;MyProject.c,11 :: 		PORTB=0xff;
	MOVLW      255
	MOVWF      PORTB+0
;MyProject.c,12 :: 		delay_ms(1000);
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
;MyProject.c,13 :: 		PORTB=0x00;
	CLRF       PORTB+0
;MyProject.c,14 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;MyProject.c,15 :: 		}
L_main2:
;MyProject.c,16 :: 		if(RC0_bit==0)
	BTFSC      RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L_main5
;MyProject.c,18 :: 		PORTB=0xAA;
	MOVLW      170
	MOVWF      PORTB+0
;MyProject.c,19 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;MyProject.c,20 :: 		PORTB=0x55;
	MOVLW      85
	MOVWF      PORTB+0
;MyProject.c,21 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;MyProject.c,22 :: 		}
L_main5:
;MyProject.c,24 :: 		}
	GOTO       L_main0
;MyProject.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
