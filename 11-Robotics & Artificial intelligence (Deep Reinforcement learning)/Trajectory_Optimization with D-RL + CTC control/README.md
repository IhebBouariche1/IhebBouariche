## Trajectory Optimization of a 7-DOF robot IIWA 14 with Deep Determinitic Policy Gradient Algorithm and control with CTC (computed torque control): 
![Trajectory_plan](https://user-images.githubusercontent.com/103148161/229267384-8618a07e-53bb-411b-99a1-75de5e297f3f.gif)
This project used a deep reinforcement learning algorithm to solve trajectory optimization by choosing the optimal control with maximum energy conservation.

The following image represent the euclidian error between the robot end effector and the desired position in the 3D space:
![Error_signal](https://user-images.githubusercontent.com/103148161/229267488-330b0e79-f122-4dd8-ba1f-93e60c18cc4d.png)
I first trained this robot on gravity and speed limitations. Then, I trained it on trajectory optimization and energy conservation. Finally, I trained it on precision improvement. This method can improve performance more effectively than training the robot directly on the global objective.
The following image presents the training episode and the cumulative rewards for each episode:
![second_training](https://user-images.githubusercontent.com/103148161/229267493-da0814b6-e603-4ef7-a6be-c8882cec3bba.png)


###### This project is still a work in progress.
