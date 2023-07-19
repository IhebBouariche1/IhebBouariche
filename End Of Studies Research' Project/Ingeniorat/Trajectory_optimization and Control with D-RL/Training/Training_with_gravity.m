clear all 
clc 

load('DATA')

mdl = 'iiwa14_simulink_reaching1';
blk = [mdl, '/RL Agent'];
env = rlSimulinkEnv(mdl,blk,obsInfo,actInfo);

% agentOptions.NoiseOptions.MeanAttractionConstant = 1e-6;
agentOptions.NoiseOptions.StandardDeviation = sqrt(Ts);
agentOptions.NoiseOptions.StandardDeviationDecayRate = 1e-4;

trainingOptions.MaxEpisodes = 10000;
trainingOptions.SaveAgentValue = 1800;
trainingOptions.MaxStepsPerEpisode = 199;
trainingOptions.ScoreAveragingWindowLength = 100;
trainingOptions.StopTrainingValue  = 1800;  
trainingStats = train(agent,env,trainingOptions);
