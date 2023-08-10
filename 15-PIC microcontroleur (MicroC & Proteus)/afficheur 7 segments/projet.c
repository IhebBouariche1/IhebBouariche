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
void main(void)
{   int i;
    trisb = 0;
    portb = 0;
    for(;;)
    {  portb=DIGITS[i];
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
