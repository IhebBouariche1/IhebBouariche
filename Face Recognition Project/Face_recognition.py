from deepface import DeepFace
import matplotlib.pyplot as plt
import time
import pandas as pd
import datetime
import pytz
import numpy as np




inputimage = "D:/Mes Traveaux/Face Recognition Project/ClasseData/0222.png"
print('fastmtcnn')
start_time = time.time()
img = DeepFace.extract_faces(inputimage, detector_backend='fastmtcnn',enforce_detection = False)
end_time = time.time()
execution_time = end_time - start_time
print("Temps de detection", execution_time, "seconds")
for j, face_data in enumerate(img):
  face_array = face_data['face']
  plt.subplot(1, len(img), j + 1)
  plt.imshow(face_array)
  plt.axis("off")
  plt.title(f"F{j+1}")


Dict1 = {1:"DATA/Amine/06.jpeg", 2:"DATA/Anes/3.jpeg", 3:"DATA/Arselane/06.jpeg", 4:"DATA/Brahim/Reference.jpeg", 5:"DATA/Iheb/08.jpg", 6:"DATA/Rimy/Reference.jpeg"}
Dict2 = {1:"DATA/Amine/02.jpeg", 2:"DATA/Anes/2.jpeg", 3:"DATA/Arselane/02.jpeg", 4:"DATA/Brahim/02.jpeg", 5:"DATA/Iheb/02.jpeg", 6:"DATA/Rimy/02.jpeg"}
Dict = {1:"Amine", 2:"Anes", 3:"Arselan", 4:"Brahim", 5:"Iheb", 6:"Rimy"}
print("Facenet")
ListDePresence = []
ListeDeDistance = []
Repitition = []
ii = 0
start_time = time.time()
for j, face_data in enumerate(img):
    face_array = face_data['face']
    for i in range (6):
      image_array_scaled = (face_array * 255).astype(np.uint8)
      result = DeepFace.verify(Dict1[i+1],image_array_scaled, model_name = "VGG-Face", detector_backend = "fastmtcnn",enforce_detection = False)
      if result["verified"] == True:
         ii = ii+1
         if ii < 2:
          ListDePresence.append(Dict[i+1])
          ListeDeDistance.append(result["distance"])
         if ii == 2:
          ListDePresence.pop(-1)
          ListDePresence.append("Inconnu")
          ListeDeDistance.pop(-1)
          ListeDeDistance.append("Inconnu")
    ii = 0

end_time = time.time()
execution_time = end_time - start_time
print("Temps de detection", execution_time, "seconds")
print(ListDePresence)
print(ListeDeDistance)
print(ii)


for i in range(len(Dict)):
    if Dict[i+1] in ListDePresence:
      print(Dict[i+1] , " ---------------> present")
    else :
      print(Dict[i+1] , " ---------------> absent")


# Avoir le temps de la région de Paris
paris_timezone = pytz.timezone('Europe/Paris')
df = pd.DataFrame.from_dict(Dict, orient='index', columns=['Name'])

# Ajouter une colonne pour indiquer la présence
df[datetime.datetime.now(pytz.timezone('Europe/Paris')).replace(tzinfo=None)] = df['Name'].apply(lambda x: 'Present' if x in ListDePresence else 'Absent')

#df['Date'] = datetime.datetime.now(pytz.timezone('Europe/Paris')).replace(tzinfo=None)


# Afficher le DataFrame
print(df)

# Sauvegarder le DataFrame dans un fichier Excel
df.to_excel(f"presence_{datetime.datetime.now(pytz.timezone('Europe/Paris')).date()}.xlsx", index=False)



