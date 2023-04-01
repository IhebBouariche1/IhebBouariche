clear all 
clc 

load('DATA_3')

robot.Gravity = [0 0 -9.81]

% agentOptions.NoiseOptions.MeanAttractionConstant = 1e-6;
agentOptions.NoiseOptions.StandardDeviation = 2*sqrt(Ts);
agentOptions.NoiseOptions.StandardDeviationDecayRate = 1e-3; 
trainingOptions.MaxStepsPerEpisode = 500;
trainingOptions.SaveAgentValue = 100000;
trainingOptions.StopTrainingValue = 1000000;
trainingStats = train(agent,env,trainingOptions);
