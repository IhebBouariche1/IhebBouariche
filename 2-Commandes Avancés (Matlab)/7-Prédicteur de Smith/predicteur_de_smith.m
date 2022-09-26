%Le systeme avec retard: 
G=tf([1],[1 5],'InputDelay',1)
Gz=c2d(G,0.1,'zoh')

%avec l'architecture de smith la Fonction de transfert sera considéré:  
Gs=tf([1],[1 5]); 
Gzs=c2d(Gs,0.1,'zoh'); 

%Le correcteur s'applique sur le systeme (sans retard) en utilisant RLTOOL 
                %%% a cause de predicteur de smith %%%%
 %%Le prédicteur de smith nous permettre de couriger un systeme sans rentrer l'effet du retard%%
 

