#line 1 "D:/MicroC/TD/TD1/Exercice03/MyProject.c"
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
void main() {
 int i=0;
 TRISB=0xff;
 TRISC=0x00;
 portc=0;

while(1)
{ i++ ;

while(RB1_Bit=1)
{
 if(i<10)
 {PORTC=DIGITS[i];
 delay_ms(500);
 i=i+2; }
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
