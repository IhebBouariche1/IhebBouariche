#line 1 "D:/MicroC/TD/TD2/Exercice01/MyProject.c"
void main() {
trisb=0xff;
trisc=0x00;
portc=0x00;
 while(1)
 {
 if((RB0_bit)||(RB1_bit)||!(RB2_bit&&RB3_bit))
 {
 portc=0x01;
 }
 else
 {
 portc.f0=0;}
 if(((RB0_bit)&&!(RB1_bit))||(!(RB2_bit)&&(RB1_bit))||(RB2_bit))
 { portc=0x02;
 }
 else
 {portc.f1=0;}
 }
}
