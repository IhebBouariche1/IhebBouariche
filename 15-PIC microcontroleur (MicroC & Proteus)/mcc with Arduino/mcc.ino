unsigned long timerOld;
bool Bold = 0;
bool Bnew = 0;
unsigned long t = 0;
unsigned long v = 0;
unsigned long timerValue;


void setup() {
  // put your setup code here, to run once:
  pinMode(12,INPUT);
  timerOld = micros();
Serial.begin(9600);
  timerValue = micros();
}

void loop() {
  Bnew = digitalRead(12);
  if(Bnew == true && Bold == false){
      Bold = Bnew;
      t = micros()-timerOld;
      v = 1000000*60/(t*24);
      timerOld = micros();
      
    }else if(Bnew == false && Bold == true){
      Bold = Bnew;
      }

    if(micros() - timerValue >= 10000){
        Serial.println(v);
        timerValue = micros();
      }  

}
