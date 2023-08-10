void main() {
trisb = 0;
 for(;;)
 {
  portb.f0=0;        //port b bit 0 etteint
  delay_ms(1000);
  portb.f0=1;        //port b bit 0 allumé
  delay_ms(1000);
 }
}
{
TRISB=0xF0; //Configuration des ports.
Microcontrôleurs                                                                                                             Iset de Nabeul
Mr Nizar TOUJENI 61
PORTB=0;
while(1) //Boucle infinie
{
if(Button(&PORTB, 7, 100, 0)) //Test de d’état du bouton sur RB7, activé à l’état bas
PORTB.F0=1; // Allumer le voyant si le bouton est actif.
else
PORTB.F0=0; //Eteindre la LED s’il est relâché.
}
}