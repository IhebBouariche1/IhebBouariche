import RPi.GPIO as GPIO
import time

# Configuration des GPIO
GPIO.setmode(GPIO.BCM)  # Utilisation des numros de broches BCM
GPIO.setup(2, GPIO.OUT)   # Orange
GPIO.setup(3, GPIO.OUT)   # Rose
GPIO.setup(4, GPIO.OUT)   # Jaune
GPIO.setup(5, GPIO.OUT)   # Bleu

# Fonction pour dfinir une tape
def set_step(w1, w2, w3, w4):
    GPIO.output(2, w1)  # Orange
    GPIO.output(3, w2)  # Rose
    GPIO.output(4, w3)  # Jaune
    GPIO.output(5, w4)  # Bleu

# Squence pour faire tourner le moteur dans le sens horaire
step_sequence = [
    (GPIO.LOW, GPIO.HIGH, GPIO.HIGH, GPIO.HIGH),  # tape 1
    #(GPIO.LOW, GPIO.LOW, GPIO.HIGH, GPIO.HIGH), # tape 2
     # tape 3
    #(GPIO.HIGH, GPIO.LOW, GPIO.LOW, GPIO.HIGH), # tape 4
    (GPIO.HIGH, GPIO.HIGH, GPIO.LOW, GPIO.HIGH), 
    (GPIO.HIGH, GPIO.LOW, GPIO.HIGH, GPIO.HIGH), 	 # tape 5
    #(GPIO.HIGH, GPIO.HIGH, GPIO.LOW, GPIO.LOW), # tape 6
    (GPIO.HIGH, GPIO.HIGH, GPIO.HIGH, GPIO.LOW),  # tape 7
    #(GPIO.LOW, GPIO.HIGH, GPIO.HIGH, GPIO.LOW)  # tape 8
]

# Nombre de cycles necessaires pour un tour complet
# Chaque cycle fait avancer le moteur d'un pas
steps_per_revolution = 60  # Depend de la reduction du moteur

try:
    while True:
        print("Moteur effectue un tour complet...")
        for _ in range(steps_per_revolution):
            for step in step_sequence:
                set_step(*step)  # Active la sequence
                time.sleep(0.005)  # Temps entre chaque etape (ajuste selon la vitesse desiree)

except KeyboardInterrupt:
    print("Programme arrete par l'utilisateur.")
    
finally:
    GPIO.cleanup()  # Reinitialisation des GPIO
