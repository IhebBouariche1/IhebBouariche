% close all 
% clear all 
% clc 
% robot.DataFormat = 'row'
% x = [-0.5 -0.5 -0.5 -0.5];
% y = [0 0 0.5 0.5];
% z = [0.1 0.6 0.6 0.1];
Q =[zeros(7,1) out.Q__.Data(:,:,1) out.Q__.Data(:,:,2) out.Q__.Data(:,:,3) out.Q__.Data(:,:,4)]
% On utilise le simulink car on etait besoin d'augmenter le nombre de steps
% de solver pour résoudre le modele geometrique inverse et avoire plus de
% précision!!
% on va remarquer qu'on a seulement quatre point a atteindre par le robot
% et pas un trajectoire carré
% les problemes: 
% % comment suivre une courbe de points par example cercle sans les variation
% de vitesse , d'une autre façon comment on peut suivre une courbe comme un trajectoire