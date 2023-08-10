
_main:

;MyProject.c,20 :: 		void main(){
;MyProject.c,22 :: 		char txt4[] = "IHEB";
;MyProject.c,25 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,29 :: 		Lcd_Out(1,1,"IHEB");   // on peut faire LCD_out(1,1,txt4);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,32 :: 		for(;;)
L_main0:
;MyProject.c,33 :: 		{}
	GOTO       L_main0
;MyProject.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
