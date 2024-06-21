rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
rep_simulation='..\simulation\';
rep_requete='..\simulation\requete\';
rep_apprend_l={'..\simulation\un\','..\simulation\deux\','..\simulation\trois\'}; 
K=5;
genere_pb=genere_validation_croisee(rep_l,rep_simulation,rep_requete,rep_apprend_l,K);
D = 0; 
N = 0;
for k=1:K
 y=genere_pb(k);
 Mr=length(y);
 D=D+Mr; 
 yp=zeros(size(y)); 
 for mr=1:Mr
   yp(mr)=s_predit(rep_requete,mr,rep_apprend_l,@s_distance1);
 end
 N=N+sum(yp==y);
end
OA=N/D;
disp(['OA=',num2str(OA)])

