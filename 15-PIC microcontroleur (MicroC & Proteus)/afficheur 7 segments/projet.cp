#line 1 "D:/MicroC Projects/addicheur 7 segments/projet.c"
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
void main(void)
{ int i;
 trisb = 0;
 portb = 0;
 for(;;)
 { portb=DIGITS[i];
 i++;
 delay_ms(500);
 if(i==9)
 { for(;;)
 {portb=DIGITS[i];
 delay_ms(500);
 i--;

 if(i==0)
 {break;}
 }
 }
 }
}
