%importation du model parameters (mass, geometry, inertia, gravity center)
robot = importrobot('iiwa14.urdf');
robot.DataFormat = 'row'

%robot parameters of i th link
i = 3; 
Mass = robot.Bodies{1,i}.Mass
CenterOfMAss = robot.Bodies{1,i}.CenterOfMass
Inertia = robot.Bodies{1,i}.Inertia 


%changement en Gravity 
robot.Gravity = [0 0 -9.81]

% show 3D model on plot3  
show(robot)

% details
showdetails(robot) 

%Mass Matrix calculé pour une position q (matrice D) 
q = [0 0 0 0 0 0 0]; 
D = massMatrix(robot,q)

%Matrice de gravity pour une position q (matrice G) 
G = gravityTorque(robot,q) 

%Matrice de coriolis pour une position q et vitesse dq (matrice C) 
dq = [0 0 0 0 0 0 0];
C = velocityProduct(robot,q,dq)

%forward dynamic, calcule de l'acceleration ddq pour une position q et vitesse dq et torque T 
Tau = [10 10 10 10 10 10 10];
ddq = forwardDynamics(robot,q,dq,Tau)

%inevrse dynamic, calcule du Torque 'Tau' a partir de l'acceleration ddq et la position q et vitesse dq et torque T 
ddq = [0 0 0 0 0 0 0];
Tau = inverseDynamics(robot,q,dq,ddq)







