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
void main() {
 int i=0;
 TRISB=0xff;
 TRISC=0x00;
 portc=0;

while(1)
{ i++     ;
/*for(RB1_Bit=1;i<=10;i++)*/
while(RB1_Bit=1)
{
 if(i<10)
 {PORTC=DIGITS[i];
  delay_ms(500);
 i=i+2;   }
 if(i==9 || i==11)
 {PORTC=DIGITS[i];
 delay_ms(500);
 i=1;}

 }
i++;
while(RB0_Bit=1)
{
  if(i>0)
  {PORTC=DIGITS[i];}
  delay_ms(500);
  i=i+2;
  if(i==10)
  {i=0;
  PORTC=DIGITS[i];
  }


}
}
}