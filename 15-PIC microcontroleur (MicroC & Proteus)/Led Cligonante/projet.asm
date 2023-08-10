
_main:

;projet.c,1 :: 		void main( void )
;projet.c,3 :: 		TRISB=0xF0; //Configuration des ports.
	MOVLW      240
	MOVWF      TRISB+0
;projet.c,4 :: 		TRISA=0xff;
	MOVLW      255
	MOVWF      TRISA+0
;projet.c,5 :: 		PORTB=0;
	CLRF       PORTB+0
;projet.c,6 :: 		while(1) //Boucle infinie
L_main0:
;projet.c,8 :: 		if(RB7_bit) //Test de d’état du bouton sur RB7, activé à l’état bas
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main2
;projet.c,9 :: 		PORTB.F0=1; // Allumer le voyant si le bouton est actif.
	BSF        PORTB+0, 0
	GOTO       L_main3
L_main2:
;projet.c,11 :: 		PORTB.F0=0; //Eteindre la LED s’il est relâché.
	BCF        PORTB+0, 0
L_main3:
;projet.c,12 :: 		}
	GOTO       L_main0
;projet.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
