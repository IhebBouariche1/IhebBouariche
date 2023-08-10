void main() {
trisc=0x00;
trisB=0xff;
portc=0x00;
delay_ms(2000)  ;
PWM1_Init(5000);
PWM1_Start();
while(1)
{

PWM1_Set_Duty(portb);

 }
}