
_main:

;MyProject.c,15 :: 		void main ( )
;MyProject.c,17 :: 		Lcd_Init ( );
	CALL       _Lcd_Init+0
;MyProject.c,18 :: 		Lcd_Cmd (_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,19 :: 		Keypad_Init ( );
	CALL       _Keypad_Init+0
;MyProject.c,20 :: 		Lcd_Out (1,1,"Tapez une touche");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,21 :: 		delay_ms (1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;MyProject.c,22 :: 		Lcd_Cmd (_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,23 :: 		do {
L_main1:
;MyProject.c,24 :: 		kp = 0;
	CLRF       _kp+0
	CLRF       _kp+1
;MyProject.c,25 :: 		do {
L_main4:
;MyProject.c,26 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
	CLRF       _kp+1
;MyProject.c,27 :: 		}  while (!kp);
	MOVF       _kp+0, 0
	IORWF      _kp+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;MyProject.c,29 :: 		switch (kp) {
	GOTO       L_main7
;MyProject.c,30 :: 		case  1: kp = 49; break; // 1
L_main9:
	MOVLW      49
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,31 :: 		case  2: kp = 50; break; // 2
L_main10:
	MOVLW      50
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,32 :: 		case  3: kp = 51; break; // 3
L_main11:
	MOVLW      51
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,33 :: 		case  4: kp = 151; break; // -
L_main12:
	MOVLW      151
	MOVWF      _kp+0
	CLRF       _kp+1
	GOTO       L_main8
;MyProject.c,34 :: 		case  5: kp = 52; break; // 4
L_main13:
	MOVLW      52
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,35 :: 		case  6: kp = 53; break; // 5
L_main14:
	MOVLW      53
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,36 :: 		case  7: kp = 54; break; // 6
L_main15:
	MOVLW      54
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,37 :: 		case  8: kp = 120; break; // x
L_main16:
	MOVLW      120
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,38 :: 		case  9: kp = 55; break; // 7
L_main17:
	MOVLW      55
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,39 :: 		case 10: kp = 56; break; // 8
L_main18:
	MOVLW      56
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,40 :: 		case 11: kp = 57; break; // 9
L_main19:
	MOVLW      57
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,41 :: 		case 12: kp = 47; break; // /
L_main20:
	MOVLW      47
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,42 :: 		case 13: kp = 143; break; // ON
L_main21:
	MOVLW      143
	MOVWF      _kp+0
	CLRF       _kp+1
	GOTO       L_main8
;MyProject.c,43 :: 		case 14: kp = 48; break; // 0
L_main22:
	MOVLW      48
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,44 :: 		case 15: kp = 61; break; // =
L_main23:
	MOVLW      61
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,45 :: 		case 16: kp = 43; break; // +
L_main24:
	MOVLW      43
	MOVWF      _kp+0
	MOVLW      0
	MOVWF      _kp+1
	GOTO       L_main8
;MyProject.c,47 :: 		}
L_main7:
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      1
	XORWF      _kp+0, 0
L__main26:
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      2
	XORWF      _kp+0, 0
L__main27:
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      3
	XORWF      _kp+0, 0
L__main28:
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      4
	XORWF      _kp+0, 0
L__main29:
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      5
	XORWF      _kp+0, 0
L__main30:
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      6
	XORWF      _kp+0, 0
L__main31:
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      7
	XORWF      _kp+0, 0
L__main32:
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      8
	XORWF      _kp+0, 0
L__main33:
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      9
	XORWF      _kp+0, 0
L__main34:
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      10
	XORWF      _kp+0, 0
L__main35:
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      11
	XORWF      _kp+0, 0
L__main36:
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      12
	XORWF      _kp+0, 0
L__main37:
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      13
	XORWF      _kp+0, 0
L__main38:
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVLW      14
	XORWF      _kp+0, 0
L__main39:
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      15
	XORWF      _kp+0, 0
L__main40:
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      16
	XORWF      _kp+0, 0
L__main41:
	BTFSC      STATUS+0, 2
	GOTO       L_main24
L_main8:
;MyProject.c,49 :: 		LCD_Chr(1,2,kp);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,50 :: 		} while (1);
	GOTO       L_main1
;MyProject.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
