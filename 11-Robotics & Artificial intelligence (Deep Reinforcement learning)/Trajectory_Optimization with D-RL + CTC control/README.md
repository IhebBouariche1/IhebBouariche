## Trajectory Optimization of a 7-DOF robot IIWA 14 with Deep Determinitic Policy Gradient Algorithm and control with CTC (computed torque control): 
![Trajectory_plan](https://user-images.githubusercontent.com/103148161/229267384-8618a07e-53bb-411b-99a1-75de5e297f3f.gif)
This project used a deep reinforcement learning algorithm to solve trajectory optimization by choosing the optimal control with maximum energy conservation.

The following image represent the euclidian error between the robot end effector and the desired position in the 3D space:
![Error_signal](https://user-images.githubusercontent.com/103148161/229267488-330b0e79-f122-4dd8-ba1f-93e60c18cc4d.png)
I first trained this robot on gravity and speed limitations. Then, I trained it on trajectory optimization and energy conservation. Finally, I trained it on precision improvement. This method can improve performance more effectively than training the robot directly on the global objective.
The following image presents the training episode and the cumulative rewards for each episode:
![second_training](https://user-images.githubusercontent.com/103148161/229267493-da0814b6-e603-4ef7-a6be-c8882cec3bba.png)
The problem is that we cannot understand the trajectory and it has no physical meaning because our neural network doesn't have any idea about how to generate position, derivative, and second derivative (velocity and acceleration) to produce the trajectory. However, the remarkable thing is that the agent learns to generate a high-performance trajectory that works well with the controller. By generating a trajectory that can compensate for any error in the controller, we can solve the problem of controlling the system. We conclude that we can optimize our objective by generating a trajectory, even in the case of a low-performance controller.

###### This project is still a work in progress.
