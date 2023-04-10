#### Computer Vision (with Convolutional deep Neural Network) and Deep Deterministic Policy Gradient Algorithm for Robotic Grasping Task using Camera Observations.

The goal of this project is to address the challenge of robotic grasping of various geometric objects using the IIWA LBR robot and the Deep Deterministic Policy Gradient Algorithm. The Pybullet environment was utilized in this project, providing more flexibility and faster simulation. The Deep Neural Network actor was responsible for controlling the position and vertical rotation of the effector, which was used to grasp objects.

![Capture d’écran (123)](https://user-images.githubusercontent.com/103148161/230831073-aed205d1-997e-4ae9-9b2e-5f82d561d825.png)

After training the model for 10,000 episodes, the performance of the algorithm was only 50% on achieved tasks. However, efforts are ongoing to enhance the algorithm's performance, with the primary issues being the time required for training and the limited computational resources. It is anticipated that these obstacles can be resolved with a training period of more than one million episodes.

I have programmed and tested this algorithm, and all the required objects and environment configurations are included in this project. Users can modify the hyperparameters, test the training, and enhance the results by increasing the number of episodes. Despite achieving only 50% of the desired outcome, the project is still in progress, and I am working hard to achieve better results. Nonetheless, to achieve this, I require more powerful computing resources.

Please note that the program consists of over 300 lines of Python code and written by me, so I cannot guarantee that everything is perfect. 
Additionally, it is worth mentioning that this problem has been addressed previously by researchers at Google Brain and the University of California.
https://arxiv.org/pdf/1802.10264.pdf

The environement pybullet source code: https://github.com/bulletphysics/bullet3/blob/master/examples/pybullet/gym/pybullet_envs/bullet/kuka_diverse_object_gym_env.py

#### This project is still a work in progress.
