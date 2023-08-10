#line 1 "D:/MicroC/TD/TD3/exercice01/MyProject.c"
char keypadPort at PORTD;
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;
int kp;
void main ( )
{
 Lcd_Init ( );
 Lcd_Cmd (_LCD_CLEAR);
 Keypad_Init ( );
 Lcd_Out (1,1,"Tapez une touche");
 delay_ms (1000);
 Lcd_Cmd (_LCD_CLEAR);
 do {
 kp = 0;
 do {
 kp = Keypad_Key_Click();
 } while (!kp);

 switch (kp) {
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 151; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 120; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 47; break;
 case 13: kp = 143; break;
 case 14: kp = 48; break;
 case 15: kp = 61; break;
 case 16: kp = 43; break;

 }

 LCD_Chr(1,2,kp);
 } while (1);
}
