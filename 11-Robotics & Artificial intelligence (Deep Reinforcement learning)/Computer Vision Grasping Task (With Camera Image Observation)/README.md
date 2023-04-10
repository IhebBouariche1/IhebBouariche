#### Computer Vision (with Convolutional deep Neural Network) and Deep Deterministic Policy Gradient Algorithm for Robotic Grasping Task using Camera Observations.

The goal of this project is to address the challenge of robotic grasping of various geometric objects using the IIWA LBR robot and the Deep Deterministic Policy Gradient Algorithm. the model is designed to utilize images as inputs for the neural network and position actions as outputs for taking decisions and solving the problem. The Pybullet environment was utilized in this project, providing more flexibility and faster simulation. The Deep Neural Network actor was responsible for controlling the position and vertical rotation of the effector, which was used to grasp objects.

![Capture d’écran (123)](https://user-images.githubusercontent.com/103148161/230831073-aed205d1-997e-4ae9-9b2e-5f82d561d825.png)

After training the model for 10,000 episodes, the performance of the algorithm was only 50% on achieved tasks. However, efforts are ongoing to enhance the algorithm's performance, with the primary issues being the time required for training and the limited computational resources. It is anticipated that these obstacles can be resolved with a training period of more than one million episodes.

I have personally developed and thoroughly tested this algorithm from scratch, incorporating various essential components such as the Deep Deterministic Policy Gradient (DDPG) algorithm, Buffer Memory, preprocessing of images, and environment configuration. The project also includes all the necessary objects and environment configurations, allowing users to modify the hyperparameters, test the training, and improve the results by increasing the number of episodes. Although the algorithm currently only achieves 50% of the desired outcome, the project is still ongoing, and I am dedicated to improving the results. However, to achieve this, I require access to more powerful computing resources.

Please note that the program consists of over 300 lines of Python code and written by me, so I cannot guarantee that everything is perfect. 
Additionally, it is worth mentioning that this problem has been addressed previously by researchers at Google Brain and the University of California.
https://arxiv.org/pdf/1802.10264.pdf

The environement pybullet source code: https://github.com/bulletphysics/bullet3/blob/master/examples/pybullet/gym/pybullet_envs/bullet/kuka_diverse_object_gym_env.py

#### This project is still a work in progress....


The following research papers and books were used in this project:

- Continuous Control with Deep Reinforcement Learning (https://arxiv.org/pdf/1509.02971.pdf)

- Deep Reinforcement Learning for Robotic Manipulation with Asynchronous Off-Policy Updates (https://arxiv.org/pdf/1610.00633.pdf)

- Deep Reinforcement Learning (https://arxiv.org/pdf/1701.07274.pdf)

- Playing Atari with Deep Reinforcement Learning (https://arxiv.org/pdf/1312.5602.pdf)

- Deep Reinforcement Learning Hands-On (Book)

- Deep Reinforcement Learning for Vision-Based Robotic Grasping: A Simulated Comparative Evaluation of Off-Policy Methods (https://arxiv.org/pdf/1802.10264.pdf)
