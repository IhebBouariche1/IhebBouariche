
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		trisb=0xff;
	MOVLW      255
	MOVWF      TRISB+0
;MyProject.c,3 :: 		trisc=0x00;
	CLRF       TRISC+0
;MyProject.c,4 :: 		portc=0x00;
	CLRF       PORTC+0
;MyProject.c,5 :: 		while(1)
L_main0:
;MyProject.c,7 :: 		if((RB0_bit)||(RB1_bit)||!(RB2_bit&&RB3_bit))
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L__main19
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__main19
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main5
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_main4
L_main5:
	CLRF       R0+0
L_main4:
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main19
	GOTO       L_main6
L__main19:
;MyProject.c,9 :: 		portc=0x01;
	MOVLW      1
	MOVWF      PORTC+0
;MyProject.c,10 :: 		}
	GOTO       L_main7
L_main6:
;MyProject.c,13 :: 		portc.f0=0;}
	BCF        PORTC+0, 0
L_main7:
;MyProject.c,14 :: 		if(((RB0_bit)&&!(RB1_bit))||(!(RB2_bit)&&(RB1_bit))||(RB2_bit))
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L__main18
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__main18
	GOTO       L__main16
L__main18:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__main17
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__main17
	GOTO       L__main16
L__main17:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__main16
	GOTO       L_main14
L__main16:
;MyProject.c,15 :: 		{ portc=0x02;
	MOVLW      2
	MOVWF      PORTC+0
;MyProject.c,16 :: 		}
	GOTO       L_main15
L_main14:
;MyProject.c,18 :: 		{portc.f1=0;}
	BCF        PORTC+0, 1
L_main15:
;MyProject.c,19 :: 		}
	GOTO       L_main0
;MyProject.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
