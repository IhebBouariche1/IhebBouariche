%Declaration de la Fonction de Transfert:  
Num = [1 1];
Den = [1 1 1];  
G = tf(Num , Den)
step(G)

%Determination les poles et les zeros:  
zeros = roots(Num) ;  poles = roots(Den)    %on constate que les zeros et les poles sont stables

%Utilisant L'application rltool on peut trouver le Correcteur selon notre
%placement des poles et des zeros sur le Lieu d'Evans (Lieu de Racines)
%"pour executer l'app rltool on ecrit "rltool" dans la partie commande."
%apres on ouvre le fichier "RLTOOL_APP" dans l'application 
%1/La premiere étape on ajoute un integrateur pour éliminer l'erreur
%statique 
%2/La deuxieme étape c'est la compensation des zeros et des poles stables


%On peut verifier la reponse de systeme avec le correcteur sur Simulink 

