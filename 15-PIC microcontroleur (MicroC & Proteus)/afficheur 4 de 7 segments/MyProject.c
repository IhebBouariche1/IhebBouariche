const unsigned short DIGITS[] =
{
0x3F, //Code du digit 0
0x06, //Code du digit 1
0x5B, //Code du digit 2
0x4F, //Code du digit 3
0x66, //Code du digit 4
0x6D, //Code du digit 5
0x7D, //Code du digit 6
0x07, //Code du digit 7
0x7F, //Code du digit 8
0x6F, //Code du digit 9
};

/*void Affciher(short nombre)
{
unsigned short A,B,C,D;
A=(nombre/1000);
B=(nombre-(A*1000))/100;
C=(nombre-(A*1000)-(B*100))/10;
D=((nombre-(A*1000)-(B*100)-(C*10));
}*/

void main(void)
{
 int T=10;
 int nombre=1505 ;
 int A,B,C,D;
 A=(nombre/1000);
 B=(nombre-(A*1000))/100;
 C=(nombre-(A*1000)-(B*100))/10;
 D=(nombre-(A*1000)-(B*100)-(C*10));

 trisb=0;
 trisc=0;
 for(;;)
 {
 portb=0x01 ;
 portc=DIGITS[D];
 delay_ms(100);
 portb=0x02  ;
 portc=DIGITS[C];
 delay_ms(100)    ;
 portb=0x04      ;
 portc=DIGITS[B]  ;
 delay_ms(100)       ;
 portb=0x08         ;
 portc=DIGITS[A]     ;
 delay_ms(100)          ;
 
 }



}