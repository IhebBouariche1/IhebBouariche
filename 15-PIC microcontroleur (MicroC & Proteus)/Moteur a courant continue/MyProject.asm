
_main:

;MyProject.c,16 :: 		void main() {
;MyProject.c,20 :: 		lcd_init();
	CALL       _Lcd_Init+0
;MyProject.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,23 :: 		option_reg= 0x07  ;
	MOVLW      7
	MOVWF      OPTION_REG+0
;MyProject.c,24 :: 		intcon= 0x00  ;
	CLRF       INTCON+0
;MyProject.c,25 :: 		TrisC=0x0f;
	MOVLW      15
	MOVWF      TRISC+0
;MyProject.c,26 :: 		memC0=0;
	CLRF       main_memC0_L0+0
	CLRF       main_memC0_L0+1
;MyProject.c,29 :: 		while (1){
L_main0:
;MyProject.c,30 :: 		if(portC.b0==1 && memC0==0){
	BTFSS      PORTC+0, 0
	GOTO       L_main4
	MOVLW      0
	XORWF      main_memC0_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	XORWF      main_memC0_L0+0, 0
L__main12:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main10:
;MyProject.c,31 :: 		t = tmr0*0.000115;
	MOVF       TMR0+0, 0
	MOVWF      R0+0
	CALL       _byte2double+0
	MOVLW      40
	MOVWF      R4+0
	MOVLW      44
	MOVWF      R4+1
	MOVLW      113
	MOVWF      R4+2
	MOVLW      113
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
;MyProject.c,32 :: 		v = 1/t;
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
;MyProject.c,33 :: 		tmr0=0;
	CLRF       TMR0+0
;MyProject.c,34 :: 		memC0 = 1;
	MOVLW      1
	MOVWF      main_memC0_L0+0
	MOVLW      0
	MOVWF      main_memC0_L0+1
;MyProject.c,35 :: 		floattostr(v,C);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      main_C_L0+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;MyProject.c,36 :: 		Lcd_out(1,1,C);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_C_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,37 :: 		}
	GOTO       L_main5
L_main4:
;MyProject.c,38 :: 		else if (portC.b0==0 && memC0==1){
	BTFSC      PORTC+0, 0
	GOTO       L_main8
	MOVLW      0
	XORWF      main_memC0_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      1
	XORWF      main_memC0_L0+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
L__main9:
;MyProject.c,39 :: 		memC0 = 0;
	CLRF       main_memC0_L0+0
	CLRF       main_memC0_L0+1
;MyProject.c,40 :: 		}
L_main8:
L_main5:
;MyProject.c,41 :: 		}
	GOTO       L_main0
;MyProject.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
