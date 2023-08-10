#line 1 "D:/MicroC/asservissement mcc/MyProject.c"

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
int memC0;
float t,v;
char C[20];
lcd_init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
option_reg= 0x07 ;
intcon= 0x00 ;
TrisC=0x0f;
memC0=0;
t=0;

while (1){
 if(portC.b0==1 && memC0==0){
 t = tmr0*0.000115;
 v = 1/t;
 tmr0=0;
 memC0 = 1;
 floattostr(v,C);
 Lcd_out(1,1,C);
 }
 else if (portC.b0==0 && memC0==1){
 memC0 = 0;
 }
}
}
