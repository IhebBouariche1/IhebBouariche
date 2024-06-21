    %Question II.23 :
    function OA=mesure_sensibilite(distance,K) 
    rep_1={'..\donnees\un', '..\donnees\deux\','..\donnees\trois\'} ; 
    rep_simulation='..\simulation\' ; 
    rep_requete='..\simulation\requete\';
    rep_apprend_l={'..\simulation\un\','..\simulation\deux\','..\simulation\trois\ '} ;
    genere_pb=genere_validation_croisee(rep_1,rep_simulation,rep_requete,rep_appre nd_l,K);
    N=0; D=0; 
    for k=1:K
    disp(["K=",N2str(K),"k=",N2str(k)]) 
    y=genere_pb(k) ;
    if rand(1)<0.05 
        v_genere_pb(rep_1,rep_simulation,rep_requete,rep_apprend_l,y) ; 
    end
    Mr=length(y) ; 
    D=D+Mr ; 
    yp=zeros(size(y)) ; 
    for mr=1 :Mr
    yp(mr)=s_predit(rep_requete,mr,rep_apprend_l,distance) ; 
    end
    N=N+sum(yp==y) ; 
    end
    OA=N/D ; 
    end
