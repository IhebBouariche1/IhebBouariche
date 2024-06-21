function [rp1,rp2,nom_fichier]=lireSon(rep,m)
%cette fonction permet dans le repertoire indiqué par rep de:
%  dénombrer le nombre de fichiers .mat disponibles pour lire le son
%  tirer au hasard un fichier .mat disponible et lire y et fe
%  lire y et fe du fichier .mat numéro m. 
  switch(m)
    case -1
      rp1=nbFichiers(rep);
      rp2=' ';
      nom_fichier='';
    case 0
      M=nbFichiers(rep);
      m=1+floor(rand(1)*M);
      nom_fichier=c_nom(rep,m);
      load([rep,nom_fichier],'y','fe');
      rp1=y; rp2=fe; 
    otherwise
      nom_fichier=c_nom(rep,m);
      load([rep,nom_fichier],'y','fe');
      rp1=y; rp2=fe;
  end
end

function M=nbFichiers(rep)
  est_ok=@(nom)(length(nom)>4)&&(strcmp('.mat',nom(end-3:end)));
  S=dir(rep);
  M=0;
  for m=1:length(S)
    if ~est_ok(S(m).name) continue; end
    M=M+1;
  end
end

function nom=c_nom(rep,m)
  %détermine le nom dans S du fichier m
  est_ok=@(nom)(length(nom)>4)&&(strcmp('.mat',nom(end-3:end)));
  S=dir(rep);
  if m<=0 error('m n''est pas conforme'), end
  for k=1:length(S)
    if ~est_ok(S(k).name) continue; end
    m=m-1;
    if 0==m nom=S(k).name; return; end
  end
end