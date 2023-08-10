#line 1 "D:/MicroC/TD/TD2/Exercice02/MyProject.c"
void main() {
 trisb=0x0f;
 portb=0x00;
 while(1)
 {
 if(RB0_bit==1||RB1_bit==1||RB2_bit==1)
{portb.f4=~portb.f4;
 delay_ms(500);
 }}}
