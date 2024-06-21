function m4a2mat(rep)
%transforme les fichiers .m4a en des fichiers .mat contenant la variable y et fe
  S=dir(rep);
  est_ok=@(nom)(length(nom)>4)&&(strcmp('.m4a',nom(end-3:end)));
  nouveau_nom=@(nom)[nom(1:end-4) '.mat'];
  for k=1:length(S)
    if ~est_ok(S(k).name) continue, end
    [y,fe]=audioread([rep S(k).name]);
    save(nouveau_nom([rep S(k).name]),'y','fe');
  end
