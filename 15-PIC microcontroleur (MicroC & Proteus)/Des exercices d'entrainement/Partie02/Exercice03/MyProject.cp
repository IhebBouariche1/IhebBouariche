#line 1 "D:/MicroC/TD/TD2/Exercice03/MyProject.c"
void main()
{
 trisb=0x0f;
 portb=0;
 while(1){
 if(RB0_bit==1)
 {
 if(RB1_bit==1&&RB2_bit==0&&RB3_bit==0)
 {portb.f4=1;
 delay_ms(100);
 portb.f4=0;
 }
 else if(RB1_bit==0&&RB2_bit==1&&RB3_bit==0)
 {portb.f4=1;
 delay_ms(2000);
 portb.f4=0;
 }
 else if(RB1_bit==0&&RB2_bit==0&&RB3_bit==1)
 {portb.f4=1;
 delay_ms(5000);
 portb.f4=0;
 }
 portb=0 ;
 }
}
}
