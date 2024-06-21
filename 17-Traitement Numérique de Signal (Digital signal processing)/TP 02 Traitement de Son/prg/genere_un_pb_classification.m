function i_ref=genere_un_pb_classification(rep_l,rep_simulation,rep_requete,rep_apprend_l)
%rep est un ensemble contenant les répertoires associés à un deux et trois
%rep_requete est le nom d'un repertoire dans lequel ce programme met un son pris au hasard
%rep_apprend est un ensemble contenant les trois répertoires dans lesquel ce programme met les autres sons rangés 
%exemple d'utilisation 
%rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
%rep_simulation='..\simulation\';
%rep_requete='..\simulation\requete\';
%rep_apprend_l={'..\simulation\un\','..\simulation\deux\','..\simulation\trois\'}; 
%y=genere_un_pb_classification(rep_l,rep_simulation,rep_requete,rep_apprend_l);
%v_genere_pb(rep_l,rep_simulation,rep_requete,rep_apprend_l,y); %si on veut vérifier. 
%ou y=i_ref indique ce qu'est vraiment le son requete. 

  %nettoyage de simulation
  if rep_existe(rep_simulation)
    if ~rmdir(rep_simulation,'s')    error('simulation'), end
  end
  if ~mkdir(rep_simulation)    error('simulation'), end
  %test sur les entrees
  if ~(length(rep_l)==3) error('rep_l'), end
  for i=1:3 
    if ~rep_existe(rep_l{i}) error('rep_l'), end, 
    if rep_est_vide(rep_l{i}) error('rep_l'), end
  end
  if rep_existe(rep_requete) error('rep_requete'), end
  if ~(length(rep_apprend_l)==3) error('rep_apprend_l'), end  
  for i=1:3 if rep_existe(rep_apprend_l{i}) error('rep_l'), end, end
  %creation des repertoires nouveaux
  if ~mkdir(rep_requete)  error('rep_requete'), end
  for i=1:3
    if ~mkdir(rep_apprend_l{i}) error('rep_apprend_l'), end
  end
  %choix d'une requete
  i_ref=ceil(rand(1)*3); 
  rep_ref=rep_l{i_ref};
  M=lireSon(rep_ref,-1);
  m=ceil(rand(1)*M); m_ref=m;
  %copie vers la requete
  [~,~,nom_ref]=lireSon(rep_ref,m); nom_ref=[rep_ref,nom_ref];
  if ~copyfile(nom_ref,rep_requete) error('rep_requete'), end
  %copie des autres fichiers
  for i=1:3
    M=lireSon(rep_l{i},-1);
    for m=1:M
      if (m==m_ref)&&(i==i_ref) continue, end
      [~,~,nom]=lireSon(rep_l{i},m); nom=[rep_l{i},nom];
      if ~copyfile(nom,rep_apprend_l{i}) error('rep_apprend_l'), end
    end
  end
end
  
function test=rep_existe(rep)
  %cette fonction teste si le répertoire existe bien. 
  test=exist(rep,'dir');
end

function test=rep_est_vide(rep)
  %cette fonction teste si le répertoire est vide
  test=(2==length(dir(rep)));
end