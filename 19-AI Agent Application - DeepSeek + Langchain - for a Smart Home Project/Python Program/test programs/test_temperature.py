import adafruit_dht
import board
import time

# Configurez le capteur sur la broche GPIO souhaie
dht_device = adafruit_dht.DHT11(board.D14)  # DHT11 ou DHT22 selon votre capteur
while (True):
    try:
        temperature = dht_device.temperature
        humidity = dht_device.humidity
        print(f"Temperature: {temperature}eC")
        print(f"Humidite: {humidity}%")
    except RuntimeError as error:
        print(f"Erreur de lecture : {error}")
    time.sleep(5)
