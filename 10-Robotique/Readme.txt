1- run IIWA14_Model_Robotics_Toolbox.
2- run the simulink file inverse_kinematics_calculator.slx
3- run trajectory_plan_script.
4- you can choose one of the 3 controle methods with trajectory plan iiwa14_commande_***_trajectory_plan.slx 
5- run trajectory_plan_script.m 



Note: we used three cntrole methods: 
- PID (proportional integral derivative) 
- CTC (calculated Torque)
- SMC_Tanh (Sliding Mode Control with using of tanh function)

in our case we have a 7-DOF redundant robot, we used one of the Quasi-Newton algorithms to solve the inverse kinematics problem, we used the BFGS algorithm (Broyden–Fletcher–Goldfarb–Shanno algorithm)
