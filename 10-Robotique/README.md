# Guide

## Check "Projet robot IIWA 14.docx" file.

1- run IIWA14_Model_Robotics_Toolbox.

2- run the simulink file inverse_kinematics_calculator.slx

3- run trajectory_plan_script.

4- you can choose one of the 3 controle methods with trajectory plan iiwa14_commande_***_trajectory_plan.slx 

5- run trajectory_plan_script.m 


![ezgif-3-370a715f86](https://user-images.githubusercontent.com/103148161/219943195-65d38d4c-14e1-4284-a29a-b7edec11fde3.gif)

Trajecory plan of the end effector in the 3D space:  

![Capture d’écran (132)](https://user-images.githubusercontent.com/103148161/231029206-467512f9-734a-4fa4-8750-3dd448b0cadd.png)

Note: we used three controle methods: 

- PID (proportional integral derivative) 

- CTC (calculated Torque)

- SMC_Tanh (Sliding Mode Control with using of tanh function)


in our case we have a 7-DOF redundant robot, we used one of the Quasi-Newton algorithms to solve the inverse kinematics problem, we used the BFGS algorithm (Broyden–Fletcher–Goldfarb–Shanno algorithm)



