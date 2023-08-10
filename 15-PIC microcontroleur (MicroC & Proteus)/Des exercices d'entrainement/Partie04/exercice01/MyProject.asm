
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		trisc=0x00;
	CLRF       TRISC+0
;MyProject.c,3 :: 		trisB=0xff;
	MOVLW      255
	MOVWF      TRISB+0
;MyProject.c,4 :: 		portc=0x00;
	CLRF       PORTC+0
;MyProject.c,5 :: 		delay_ms(2000)  ;
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;MyProject.c,6 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,7 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;MyProject.c,8 :: 		while(1)
L_main1:
;MyProject.c,11 :: 		PWM1_Set_Duty(portb);
	MOVF       PORTB+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,13 :: 		}
	GOTO       L_main1
;MyProject.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
