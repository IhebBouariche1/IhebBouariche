#line 1 "D:/MicroC/TD/TD1/Exercice04/MyProject.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

void main() {
char SALAM[] ="SALAM ALIKOM";
char BONJOUR[] ="BONJOUR" ;
char SALUT[] ="SALUT" ;
LCD_init() ;
LCD_CMD(_LCD_CLEAR);
LCD_CMD(_LCD_CURSOR_OFF);
 while(1){

if(RC0_bit==1 && RC1_bit==0 && RC2_bit==0)
 {LCD_OUT(1,1,SALAM);}
else if(RC1_bit==1 && RC0_bit==0 && RC2_bit==0)
 {LCD_OUT(1,1,BONJOUR);}
else if(RC2_bit==1 && RC0_bit==0 && RC1_bit==0)
 {LCD_OUT(1,1,SALUT);}
else{LCD_CMD(_LCD_CLEAR);}



 }
}
