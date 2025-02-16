import subprocess
import cv2
from ultralytics import YOLO

# Importation du modele YOLO
model = YOLO('yolo11m.pt')  # Remplacez 'yolo11m.pt' par votre fichier modele si necessaire

def Object_detection(input=""):
    # Capture une image a l'aide de libcamera
    command = "sudo libcamera-still -o image.jpg"
    subprocess.run(command, shell=True)

    # Effectuer la detection d'objets
    results = model("image.jpg")
    detections = results[0].boxes  # Extraire les detections

    # Verification si aucune detection n'est faite
    if detections is None or len(detections.cls) == 0:
        return "No objects detected in the image."

    class_names = results[0].names  # Acceder aux noms des classes pour le modele
    labels = detections.cls  # ID des classes detectees
    confidences = detections.conf  # Scores de confiance pour chaque detection

    # Preparer les labels detectes
    ll = []
    for label in labels:
        ll.append(f"{class_names[int(label)]}")

    # Creer un dictionnaire pour compter les occurrences de chaque element
    counts = {item: ll.count(item) for item in set(ll)}

    # Generer la description des objets detectes
    description = []
    for item, count in counts.items():
        if count > 1:
            description.append(f"{count} of {item}s")
        else:
            description.append(item)

    # Joindre les descriptions et retourner le resultat
    r = " and ".join(description)
    return "There are in the image " + r

# Tester la fonction
print(Object_detection(""))
