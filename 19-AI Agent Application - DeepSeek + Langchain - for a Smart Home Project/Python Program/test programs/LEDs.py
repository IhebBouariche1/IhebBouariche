import RPi.GPIO as GPIO
import time

# Configuration de la bibliotheque GPIO
GPIO.setmode(GPIO.BCM)  # Utilisation de la numerotation BCM
GPIO.setwarnings(False)  # Desactiver les avertissements

# Liste des broches e alimenter
pins = [21, 20, 16]

# Configuration des broches en sortie
for pin in pins:
    GPIO.setup(pin, GPIO.OUT)
    GPIO.output(pin, GPIO.HIGH)  # Alimenter la broche

print("Les GPIO 21, 20 et 16 sont maintenant alimentes.")

try:
    while True:
        time.sleep(1)  # Maintenir l'alimentation indefiniment
except KeyboardInterrupt:
    print("Arret du programme.")
    GPIO.cleanup()  # Reinitialisation des GPIO
