function fun=genere_validation_croisee(rep_l,rep_simulation,rep_requete,rep_apprend_l,K)
%rep_l est un ensemble contenant les répertoires associés à un deux et trois
%rep_requete est le nom d'un repertoire dans lequel ce programme met des sons pris au hasard
%rep_apprend est un ensemble contenant les trois répertoires dans lesquel ce programme met les autres sons rangés 
%rep_simulation est un repertoire qui contient toute la simulation
%fun est la fonction prend en argument un entier entre 1 et K et génère la kème version requete/apprentissage et retourne 
% y qui est un vecteur colonne de la même taille que le nombre de fichiers sons disponibles dans rep_requete 
% et dont les valeurs indiquent le son associé
%exemple d'utilisation 
%rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
%rep_simulation='..\simulation\';
%rep_requete='..\simulation\requete\';
%rep_apprend_l={'..\simulation\un\','..\simulation\deux\','..\simulation\trois\'}; 
%K=5;
%genere_pb=genere_validation_croisee(rep_l,rep_simulation,rep_requete,rep_apprend_l,K);
%for k=1:K
%  y=genere_pb(k);
%  %si on veut vérifier :
%    v_genere_pb(rep_l,rep_simulation,rep_requete,rep_apprend_l,y);
%  pause(1),
%end

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
  ordre=cell(3,1);
  for i=1:3
    M=lireSon(rep_l{i},-1);
    ordre{i}=randperm(M);
  end
  v_partition();
  fun=@genere_pb;
  function y=genere_pb(k)
    %nettoyage de simulation
    if rep_existe(rep_simulation)
      if ~rmdir(rep_simulation,'s')    error('simulation'), end
    end
    if ~mkdir(rep_simulation)    error('simulation'), end
    %creation des repertoires nouveaux
    if ~mkdir(rep_requete)  error('rep_requete'), end
    for i=1:3
      if ~mkdir(rep_apprend_l{i}) error('rep_apprend_l'), end
    end
    %copie vers requete
    dict=struct();
    for i=1:3
      ui=partition(ordre{i},k,K);
      for j=1:length(ui)
        [~,~,nom]=lireSon(rep_l{i},ui(j)); nom_rep=[rep_l{i},nom];
        if ~copyfile(nom_rep,rep_requete) error('rep_requete'), end
        nom((nom==' ')|(nom=='.'))='_';
        dict.(nom)=i;
      end
    end
    %ecrire y
    Mr=lireSon(rep_requete,-1);
    y=zeros(1,Mr);
    for mr=1:Mr
      [~,~,nom]=lireSon(rep_requete,mr);
      nom((nom==' ')|(nom=='.'))='_';
      y(mr)=dict.(nom);
    end
    %copie vers l'apprentissage
    for i=1:3
      ui=partition(ordre{i},-k,K);
      for j=1:length(ui)
        [~,~,nom]=lireSon(rep_l{i},ui(j)); nom=[rep_l{i},nom];
        if ~copyfile(nom,rep_apprend_l{i}) error('rep_apprend_l'), end
      end
    end
  end
end
  
function uk=partition(u,k,K)
%si k est positif alors uk est la kème partition de u 
%si k est negatif alors uk est le complémentaire de la kème partition. 
  M=length(u);
  if k<0 uk=setdiff(1:M,partition(u,-k,K)); return; end
  m0=1+floor(M/K*(k-1)+0.5); m1=floor(M/K*k+0.5);
  uk=u(m0:m1);
end

function v_partition(u,k)
  M=ceil(rand(1)*30)+5;
  K=ceil(rand(1)*M/3);
  while(1)
    u=rand(1,M);
    if length(unique(u))==M break; end
  end
  for k=1:K
    uk=partition(u,k,K);
    for l=1:K
      ul=partition(u,l,K);
      if (l==k)&&(~est_id(uk,ul)) error('partition'), end
      if (l~=k)&&(~est_distinct(uk,ul)) error('partition'), end
    end
  end
  u_nv=[];
  for k=1:K
    u_nv=[u_nv partition(u,k,K)];
  end
  if ~est_id(u,u_nv) error('partition'), end
  for k=1:K
    if ~est_distinct(partition(u,k,K),partition(u,-k,K)) error('partition'), end
  end
  lx=0; ln=Inf;
  for k=1:K
    l=length(partition(u,k,K));
    lx=max(lx,l); ln=min(ln,l);
  end
  if ~(lx-ln<=1) error('partition'), end
  if ~(lx<=ceil(M/K)) error('partition'), end
end

function test=est_id(u,v)
%cette fonction détermine si les vecteurs u et v sont bien identiques
  test=0;
  if length(u)~=length(v) return; end
  if ~all(ismember(u,v)) return; end
  if ~all(ismember(v,u)) return; end
  test=1;
end

function test=est_distinct(u,v)
%cette fonction détermine s'il n'y aucun élément en commun entre u et v_partition
  test=0;
  if any(ismember(u,v)) return; end
  if any(ismember(v,u)) return; end
  test=1;
end

function test=rep_existe(rep)
  %cette fonction teste si le répertoire existe bien. 
  test=exist(rep,'dir');
end

function test=rep_est_vide(rep)
  %cette fonction teste si le répertoire est vide
  test=(2==length(dir(rep)));
end