
_main:

;MyProject.c,1 :: 		void main(void)
;MyProject.c,3 :: 		Trisb=0xff;
	MOVLW      255
	MOVWF      TRISB+0
;MyProject.c,4 :: 		Trisc=0x00;
	CLRF       TRISC+0
;MyProject.c,5 :: 		trisd=0x00;
	CLRF       TRISD+0
;MyProject.c,7 :: 		while(1)
L_main0:
;MyProject.c,9 :: 		if(RB2_bit==1 && RB1_bit==1)
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main4
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main4
L__main40:
;MyProject.c,11 :: 		portc=0x01;
	MOVLW      1
	MOVWF      PORTC+0
;MyProject.c,12 :: 		delay_ms(100);
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
;MyProject.c,13 :: 		portc=0x02;
	MOVLW      2
	MOVWF      PORTC+0
;MyProject.c,14 :: 		delay_ms(100);
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
;MyProject.c,15 :: 		portc=0x04;
	MOVLW      4
	MOVWF      PORTC+0
;MyProject.c,16 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;MyProject.c,17 :: 		portc=0x08;
	MOVLW      8
	MOVWF      PORTC+0
;MyProject.c,18 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;MyProject.c,19 :: 		portc=0x10;
	MOVLW      16
	MOVWF      PORTC+0
;MyProject.c,20 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;MyProject.c,21 :: 		portc=0x20;
	MOVLW      32
	MOVWF      PORTC+0
;MyProject.c,22 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
	NOP
;MyProject.c,23 :: 		portc=0x40;
	MOVLW      64
	MOVWF      PORTC+0
;MyProject.c,24 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
;MyProject.c,25 :: 		portc=0x80;
	MOVLW      128
	MOVWF      PORTC+0
;MyProject.c,26 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;MyProject.c,27 :: 		}
L_main4:
;MyProject.c,28 :: 		if(Rb2_bit==1 && Rb1_bit==0)
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main15
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main15
L__main39:
;MyProject.c,30 :: 		portc=0x80;
	MOVLW      128
	MOVWF      PORTC+0
;MyProject.c,31 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
	NOP
;MyProject.c,32 :: 		portc=0x40;
	MOVLW      64
	MOVWF      PORTC+0
;MyProject.c,33 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	NOP
	NOP
;MyProject.c,34 :: 		portc=0x20;
	MOVLW      32
	MOVWF      PORTC+0
;MyProject.c,35 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
	NOP
;MyProject.c,36 :: 		portc=0x10;
	MOVLW      16
	MOVWF      PORTC+0
;MyProject.c,37 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	NOP
	NOP
;MyProject.c,38 :: 		portc=0x04;
	MOVLW      4
	MOVWF      PORTC+0
;MyProject.c,39 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
	NOP
;MyProject.c,40 :: 		portc=0x02;
	MOVLW      2
	MOVWF      PORTC+0
;MyProject.c,41 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
	NOP
;MyProject.c,42 :: 		portc=0x01;
	MOVLW      1
	MOVWF      PORTC+0
;MyProject.c,43 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	NOP
	NOP
;MyProject.c,44 :: 		}
L_main15:
;MyProject.c,45 :: 		if(Rb2_bit==0 && Rb1_bit==1)
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main25
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main25
L__main38:
;MyProject.c,47 :: 		portC=0x88;
	MOVLW      136
	MOVWF      PORTC+0
;MyProject.c,48 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	NOP
	NOP
;MyProject.c,49 :: 		portC=0x41;
	MOVLW      65
	MOVWF      PORTC+0
;MyProject.c,50 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	NOP
	NOP
;MyProject.c,51 :: 		portC=0x22;
	MOVLW      34
	MOVWF      PORTC+0
;MyProject.c,52 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	NOP
	NOP
;MyProject.c,53 :: 		portC=0x14;
	MOVLW      20
	MOVWF      PORTC+0
;MyProject.c,54 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	NOP
	NOP
;MyProject.c,55 :: 		}
L_main25:
;MyProject.c,56 :: 		if(Rb2_bit==0 && Rb1_bit==0)
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main32
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main32
L__main37:
;MyProject.c,58 :: 		portC=0x81;
	MOVLW      129
	MOVWF      PORTC+0
;MyProject.c,59 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	NOP
	NOP
;MyProject.c,60 :: 		portC=0x06;
	MOVLW      6
	MOVWF      PORTC+0
;MyProject.c,61 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	NOP
	NOP
;MyProject.c,62 :: 		portC=0x18;
	MOVLW      24
	MOVWF      PORTC+0
;MyProject.c,63 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	NOP
	NOP
;MyProject.c,64 :: 		portC=0x60;
	MOVLW      96
	MOVWF      PORTC+0
;MyProject.c,65 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	NOP
	NOP
;MyProject.c,66 :: 		}
L_main32:
;MyProject.c,67 :: 		}
	GOTO       L_main0
;MyProject.c,68 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
