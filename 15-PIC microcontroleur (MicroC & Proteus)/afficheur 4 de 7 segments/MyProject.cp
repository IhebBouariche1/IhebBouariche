#line 1 "D:/MicroC Projects/addicheur 4 de 7 segments/MyProject.c"
const unsigned short DIGITS[] =
{
0x3F,
0x06,
0x5B,
0x4F,
0x66,
0x6D,
0x7D,
0x07,
0x7F,
0x6F,
};
#line 24 "D:/MicroC Projects/addicheur 4 de 7 segments/MyProject.c"
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
 portb=0x02 ;
 portc=DIGITS[C];
 delay_ms(100) ;
 portb=0x04 ;
 portc=DIGITS[B] ;
 delay_ms(100) ;
 portb=0x08 ;
 portc=DIGITS[A] ;
 delay_ms(100) ;

 }



}
