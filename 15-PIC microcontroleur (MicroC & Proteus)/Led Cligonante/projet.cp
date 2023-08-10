#line 1 "D:/MicroC/Led Cligonante/projet.c"
void main( void )
{
TRISB=0xF0;
TRISA=0xff;
PORTB=0;
while(1)
{
if(RB7_bit)
PORTB.F0=1;
else
PORTB.F0=0;
}
}
