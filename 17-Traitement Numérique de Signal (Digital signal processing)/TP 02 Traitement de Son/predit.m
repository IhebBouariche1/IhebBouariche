function mini=predit(rep_requete,rep_apprend_l)

fichiers_audio = dir(fullfile(rep_requete, '*.mat'))
chemin_fichier_requete = fullfile(rep_requete, fichiers_audio(1).name)
x1 = load(chemin_fichier_requete);
for k = 1:3
    fichiers_audio = dir(fullfile(rep_apprend_l{k}, '*.mat'))
for i=1:length(fichiers_audio)
    chemin_fichier = fullfile(rep_apprend_l{k}, fichiers_audio(i).name)
    x2 = load(chemin_fichier);
    duree_trame = 0.3; 
    chevauchement = 0.25;
    fe = load(chemin_fichier).fe;
    [xk1,ech_trames1,centres_trames1]=preparation(x1.y,fe,duree_trame,chevauchement);
    [xk2,ech_trames2,centres_trames2]=preparation(x2.y,fe,duree_trame,chevauchement);
    PMCT1 = s_c_PMCT(xk1);
    PMCT2 = s_c_PMCT(xk2);

    d = sqrt((mean(PMCT1)-mean(PMCT2))^(2)+(std(PMCT1)-std(PMCT2))^(2));
 
    y(i,k) = d
    
    [mini, colIndex] = min(y + (y == 0) * max(y(:)))
end
end
end

