
_main:

;MyProject.c,16 :: 		void main() {
;MyProject.c,17 :: 		char SALAM[] ="SALAM ALIKOM";
	MOVLW      83
	MOVWF      main_SALAM_L0+0
	MOVLW      65
	MOVWF      main_SALAM_L0+1
	MOVLW      76
	MOVWF      main_SALAM_L0+2
	MOVLW      65
	MOVWF      main_SALAM_L0+3
	MOVLW      77
	MOVWF      main_SALAM_L0+4
	MOVLW      32
	MOVWF      main_SALAM_L0+5
	MOVLW      65
	MOVWF      main_SALAM_L0+6
	MOVLW      76
	MOVWF      main_SALAM_L0+7
	MOVLW      73
	MOVWF      main_SALAM_L0+8
	MOVLW      75
	MOVWF      main_SALAM_L0+9
	MOVLW      79
	MOVWF      main_SALAM_L0+10
	MOVLW      77
	MOVWF      main_SALAM_L0+11
	CLRF       main_SALAM_L0+12
	MOVLW      66
	MOVWF      main_BONJOUR_L0+0
	MOVLW      79
	MOVWF      main_BONJOUR_L0+1
	MOVLW      78
	MOVWF      main_BONJOUR_L0+2
	MOVLW      74
	MOVWF      main_BONJOUR_L0+3
	MOVLW      79
	MOVWF      main_BONJOUR_L0+4
	MOVLW      85
	MOVWF      main_BONJOUR_L0+5
	MOVLW      82
	MOVWF      main_BONJOUR_L0+6
	CLRF       main_BONJOUR_L0+7
	MOVLW      83
	MOVWF      main_SALUT_L0+0
	MOVLW      65
	MOVWF      main_SALUT_L0+1
	MOVLW      76
	MOVWF      main_SALUT_L0+2
	MOVLW      85
	MOVWF      main_SALUT_L0+3
	MOVLW      84
	MOVWF      main_SALUT_L0+4
	CLRF       main_SALUT_L0+5
;MyProject.c,20 :: 		LCD_init() ;
	CALL       _Lcd_Init+0
;MyProject.c,21 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,22 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,23 :: 		while(1){
L_main0:
;MyProject.c,25 :: 		if(RC0_bit==1 && RC1_bit==0 && RC2_bit==0)
	BTFSS      RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L_main4
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_main4
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main4
L__main16:
;MyProject.c,26 :: 		{LCD_OUT(1,1,SALAM);}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_SALAM_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main5
L_main4:
;MyProject.c,27 :: 		else if(RC1_bit==1 && RC0_bit==0 && RC2_bit==0)
	BTFSS      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_main8
	BTFSC      RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L_main8
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main8
L__main15:
;MyProject.c,28 :: 		{LCD_OUT(1,1,BONJOUR);}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_BONJOUR_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main9
L_main8:
;MyProject.c,29 :: 		else if(RC2_bit==1 && RC0_bit==0 && RC1_bit==0)
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main12
	BTFSC      RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L_main12
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_main12
L__main14:
;MyProject.c,30 :: 		{LCD_OUT(1,1,SALUT);}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_SALUT_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main13
L_main12:
;MyProject.c,31 :: 		else{LCD_CMD(_LCD_CLEAR);}
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_main13:
L_main9:
L_main5:
;MyProject.c,35 :: 		}
	GOTO       L_main0
;MyProject.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
