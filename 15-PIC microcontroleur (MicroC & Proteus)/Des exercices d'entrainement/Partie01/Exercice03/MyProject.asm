
_main:

;MyProject.c,14 :: 		void main() {
;MyProject.c,15 :: 		int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;MyProject.c,16 :: 		TRISB=0xff;
	MOVLW      255
	MOVWF      TRISB+0
;MyProject.c,17 :: 		TRISC=0x00;
	CLRF       TRISC+0
;MyProject.c,18 :: 		portc=0;
	CLRF       PORTC+0
;MyProject.c,20 :: 		while(1)
L_main0:
;MyProject.c,21 :: 		{ i++     ;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;MyProject.c,23 :: 		while(RB1_Bit=1)
L_main2:
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main3
;MyProject.c,25 :: 		if(i<10)
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;MyProject.c,26 :: 		{PORTC=DIGITS[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;MyProject.c,27 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;MyProject.c,28 :: 		i=i+2;   }
	MOVLW      2
	ADDWF      main_i_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_i_L0+1, 1
L_main4:
;MyProject.c,29 :: 		if(i==9 || i==11)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      9
	XORWF      main_i_L0+0, 0
L__main18:
	BTFSC      STATUS+0, 2
	GOTO       L__main15
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      11
	XORWF      main_i_L0+0, 0
L__main19:
	BTFSC      STATUS+0, 2
	GOTO       L__main15
	GOTO       L_main8
L__main15:
;MyProject.c,30 :: 		{PORTC=DIGITS[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;MyProject.c,31 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;MyProject.c,32 :: 		i=1;}
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main8:
;MyProject.c,34 :: 		}
	GOTO       L_main2
L_main3:
;MyProject.c,35 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;MyProject.c,36 :: 		while(RB0_Bit=1)
L_main10:
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main11
;MyProject.c,38 :: 		if(i>0)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;MyProject.c,39 :: 		{PORTC=DIGITS[i];}
	MOVF       main_i_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
L_main12:
;MyProject.c,40 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;MyProject.c,41 :: 		i=i+2;
	MOVLW      2
	ADDWF      main_i_L0+0, 0
	MOVWF      R1+0
	MOVF       main_i_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      main_i_L0+0
	MOVF       R1+1, 0
	MOVWF      main_i_L0+1
;MyProject.c,42 :: 		if(i==10)
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      10
	XORWF      R1+0, 0
L__main21:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;MyProject.c,43 :: 		{i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;MyProject.c,44 :: 		PORTC=DIGITS[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _DIGITS+0
	MOVWF      R0+0
	MOVLW      hi_addr(_DIGITS+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;MyProject.c,45 :: 		}
L_main14:
;MyProject.c,48 :: 		}
	GOTO       L_main10
L_main11:
;MyProject.c,49 :: 		}
	GOTO       L_main0
;MyProject.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
