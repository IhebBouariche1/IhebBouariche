#line 1 "D:/MicroC/TD/TD1/Exercice01/MyProject.c"
void main(void)
{
 Trisb=0xff;
 Trisc=0x00;
 trisd=0x00;

 while(1)
 {
 if(RB2_bit==1 && RB1_bit==1)
 {
 portc=0x01;
 delay_ms(100);
 portc=0x02;
 delay_ms(100);
 portc=0x04;
 delay_ms(100);
 portc=0x08;
 delay_ms(100);
 portc=0x10;
 delay_ms(100);
 portc=0x20;
 delay_ms(100);
 portc=0x40;
 delay_ms(100);
 portc=0x80;
 delay_ms(100);
 }
 if(Rb2_bit==1 && Rb1_bit==0)
 {
 portc=0x80;
 delay_ms(100);
 portc=0x40;
 delay_ms(100);
 portc=0x20;
 delay_ms(100);
 portc=0x10;
 delay_ms(100);
 portc=0x04;
 delay_ms(100);
 portc=0x02;
 delay_ms(100);
 portc=0x01;
 delay_ms(100);
 }
 if(Rb2_bit==0 && Rb1_bit==1)
 {
 portC=0x88;
 delay_ms(100);
 portC=0x41;
 delay_ms(100);
 portC=0x22;
 delay_ms(100);
 portC=0x14;
 delay_ms(100);
 }
 if(Rb2_bit==0 && Rb1_bit==0)
 {
 portC=0x81;
 delay_ms(100);
 portC=0x06;
 delay_ms(100);
 portC=0x18;
 delay_ms(100);
 portC=0x60;
 delay_ms(100);
 }
}
}
