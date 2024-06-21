function t=TP5_modifier_delta_t(t,delta_t)
%fonction actionnée par l'utilisateur dans le cadre de TP5.m
  t_=t.userData;
  if delta_t>t_.duree 
    disp(['delta_t=',num2str(delta_t),' est trop grand, est remplace par ',num2str(t_.duree)]),
    t_.delta_t=t_.duree;
  end
  t_.delta_t=delta_t;
  t.userData=t_;
end