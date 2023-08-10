
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		trisb=0x0f;
	MOVLW      15
	MOVWF      TRISB+0
;MyProject.c,3 :: 		portb=0x00;
	CLRF       PORTB+0
;MyProject.c,4 :: 		while(1)
L_main0:
;MyProject.c,6 :: 		if(RB0_bit==1||RB1_bit==1||RB2_bit==1)
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L__main6
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__main6
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__main6
	GOTO       L_main4
L__main6:
;MyProject.c,7 :: 		{portb.f4=~portb.f4;
	MOVLW      16
	XORWF      PORTB+0, 1
;MyProject.c,8 :: 		delay_ms(500);
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
;MyProject.c,9 :: 		}}}
L_main4:
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
