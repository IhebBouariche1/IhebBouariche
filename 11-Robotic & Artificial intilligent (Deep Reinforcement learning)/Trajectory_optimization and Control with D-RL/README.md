## Trajectory Optimization and Control with Deep Deterministic Policy Gradient (DDPG)
![13-03-2023-1-point_no_gravity](https://user-images.githubusercontent.com/103148161/228417897-89bc366b-1774-4037-b284-5175c9c6e4c1.png)

#### This project is focused on using deep reinforcement learning to optimize trajectory and control for a 7-DOF IIWA14 manipulator robot. I used MATLAB and Simulink, including the Simscape toolkit for 3D simulation. In particular, I utilized the Deep Learning and Reinforcement Learning toolbox to develop the DDPG algorithm.
#### The current state of this project has achieved a precision of less then 3mm, with robustness for an additional lifted mass of 5KG.
#### The primary goal of this project was to train the robot to control and optimize a trajectory from an initial state to a specified state in 3D space, without gravity force acting on the robot. After that, I further trained the robot to handle gravity force, and eventually, I trained it to achieve high precision.
In this project, the agent learns to control the robot in three phases. First, it learns to control the robot without the influence of gravity. Second, it learns to create a trajectory from the initial state to a specified state in 3D space. Finally, it learns to optimize for high precision.
By breaking down the training into three phases, the agent can learn to control the robot more efficiently and with less time. This approach can significantly reduce the time-consuming and resource-intensive nature of training reinforcement learning algorithms. With just a few hours of training, the agent can achieve a high level of control precision, making this approach ideal for real-time applications where quick and efficient training is essential.

#### If you're interested in replicating or building upon my work, you can download the trained data from this link: https://drive.google.com/file/d/1GsjTDUdq8LaTg_jCLSSBk84HPSnXR739/view?usp=share_link

#### The following research papers and books were used in this project:

Continuous Control with Deep Reinforcement Learning (https://arxiv.org/pdf/1509.02971.pdf)

Deep Reinforcement Learning for Robotic Manipulation with Asynchronous Off-Policy Updates (https://arxiv.org/pdf/1610.00633.pdf)

Deep Reinforcement Learning (https://arxiv.org/pdf/1701.07274.pdf)

Playing Atari with Deep Reinforcement Learning (https://arxiv.org/pdf/1312.5602.pdf)

Deep Reinforcement Learning Hands-On (Book)

Reinforcement Learning with MATLAB (Book)

### This project is steel on working, Thank you!


