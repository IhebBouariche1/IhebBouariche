void main(void) 
{
TRISA=0xff;
TRISC=0xff;
TRISB=0x00;
PORTB=0x00;
while(1)
{
if(RC0_bit==1)
  {
   PORTB=0xff;
   delay_ms(1000);
   PORTB=0x00;
   delay_ms(1000);
  }
  if(RC0_bit==0)
  {
   PORTB=0xAA;
   delay_ms(500);
   PORTB=0x55;
   delay_ms(500);
  }

}
}