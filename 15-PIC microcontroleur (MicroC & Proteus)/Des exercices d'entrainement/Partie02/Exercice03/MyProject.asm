
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,3 :: 		trisb=0x0f;
	MOVLW      15
	MOVWF      TRISB+0
;MyProject.c,4 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,5 :: 		while(1){
L_main0:
;MyProject.c,6 :: 		if(RB0_bit==1)
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main2
;MyProject.c,8 :: 		if(RB1_bit==1&&RB2_bit==0&&RB3_bit==0)
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main5
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main5
L__main19:
;MyProject.c,9 :: 		{portb.f4=1;
	BSF        PORTB+0, 4
;MyProject.c,10 :: 		delay_ms(100);
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
;MyProject.c,11 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;MyProject.c,12 :: 		}
	GOTO       L_main7
L_main5:
;MyProject.c,13 :: 		else if(RB1_bit==0&&RB2_bit==1&&RB3_bit==0)
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main10
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main10
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main10
L__main18:
;MyProject.c,14 :: 		{portb.f4=1;
	BSF        PORTB+0, 4
;MyProject.c,15 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;MyProject.c,16 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;MyProject.c,17 :: 		}
	GOTO       L_main12
L_main10:
;MyProject.c,18 :: 		else if(RB1_bit==0&&RB2_bit==0&&RB3_bit==1)
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main15
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main15
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main15
L__main17:
;MyProject.c,19 :: 		{portb.f4=1;
	BSF        PORTB+0, 4
;MyProject.c,20 :: 		delay_ms(5000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
;MyProject.c,21 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;MyProject.c,22 :: 		}
L_main15:
L_main12:
L_main7:
;MyProject.c,23 :: 		portb=0  ;
	CLRF       PORTB+0
;MyProject.c,24 :: 		}
L_main2:
;MyProject.c,25 :: 		}
	GOTO       L_main0
;MyProject.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
