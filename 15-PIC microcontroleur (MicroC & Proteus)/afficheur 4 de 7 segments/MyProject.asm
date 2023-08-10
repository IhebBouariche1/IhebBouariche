
_main:

;MyProject.c,24 :: 		void main(void)
;MyProject.c,26 :: 		int T=10;
;MyProject.c,27 :: 		int nombre=1505 ;
	MOVLW      225
	MOVWF      main_nombre_L0+0
	MOVLW      5
	MOVWF      main_nombre_L0+1
;MyProject.c,29 :: 		A=(nombre/1000);
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       main_nombre_L0+0, 0
	MOVWF      R0+0
	MOVF       main_nombre_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_A_L0+0
	MOVF       R0+1, 0
	MOVWF      main_A_L0+1
;MyProject.c,30 :: 		B=(nombre-(A*1000))/100;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      main_nombre_L0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_nombre_L0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_B_L0+0
	MOVF       R0+1, 0
	MOVWF      main_B_L0+1
;MyProject.c,31 :: 		C=(nombre-(A*1000)-(B*100))/10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 1
	BTFSS      STATUS+0, 0
	DECF       FLOC__main+1, 1
	MOVF       R0+1, 0
	SUBWF      FLOC__main+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_C_L0+0
	MOVF       R0+1, 0
	MOVWF      main_C_L0+1
;MyProject.c,32 :: 		D=(nombre-(A*1000)-(B*100)-(C*10));
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 0
	MOVWF      main_D_L0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__main+1, 0
	MOVWF      main_D_L0+1
;MyProject.c,34 :: 		trisb=0;
	CLRF       TRISB+0
;MyProject.c,35 :: 		trisc=0;
	CLRF       TRISC+0
;MyProject.c,36 :: 		for(;;)
L_main0:
;MyProject.c,38 :: 		portb=0x01 ;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,39 :: 		portc=DIGITS[D];
	MOVF       main_D_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_D_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;MyProject.c,40 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProject.c,41 :: 		portb=0x02  ;
	MOVLW      2
	MOVWF      PORTB+0
;MyProject.c,42 :: 		portc=DIGITS[C];
	MOVF       main_C_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_C_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;MyProject.c,43 :: 		delay_ms(100)    ;
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;MyProject.c,44 :: 		portb=0x04      ;
	MOVLW      4
	MOVWF      PORTB+0
;MyProject.c,45 :: 		portc=DIGITS[B]  ;
	MOVF       main_B_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_B_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;MyProject.c,46 :: 		delay_ms(100)       ;
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;MyProject.c,47 :: 		portb=0x08         ;
	MOVLW      8
	MOVWF      PORTB+0
;MyProject.c,48 :: 		portc=DIGITS[A]     ;
	MOVF       main_A_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_A_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;MyProject.c,49 :: 		delay_ms(100)          ;
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;MyProject.c,51 :: 		}
	GOTO       L_main0
;MyProject.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
