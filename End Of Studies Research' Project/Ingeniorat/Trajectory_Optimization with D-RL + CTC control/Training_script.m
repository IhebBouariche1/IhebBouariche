clear all 
clc 
robot = importrobot('iiwa14.urdf');
robot.Gravity = [0 0 -9.81]
% Simulink environement
numObs = 20;
obsInfo = rlNumericSpec([numObs 1]);
obsInfo.Name = 'observations';
numAct = 7;
actInfo = rlNumericSpec([numAct 1],'LowerLimit',-3.14,'UpperLimit',3.14);
actInfo.Name = 'torque';
mdl = 'Trajectory_plan_7out';
open_system(mdl)
blk = [mdl, '/RL Agent'];
env = rlSimulinkEnv(mdl,blk,obsInfo,actInfo);

Tf = 5;
Ts = 0.01;
% rng(0)

% Create the critic network layers
statePath = [
    featureInputLayer(numObs,'Normalization','none','Name', 'observation')
    fullyConnectedLayer(200, 'Name', 'CriticStateFC1')
    reluLayer('Name','CriticStateRelu1')
    fullyConnectedLayer(200, 'Name', 'CriticStateFC2')
    ];
actionPath = [
    featureInputLayer(numAct,'Normalization','none', 'Name', 'action')
    fullyConnectedLayer(200, 'Name', 'CriticActionFC1')
    ];
commonPath = [
    additionLayer(2,'Name','add')
    reluLayer('Name','CriticCommonRelu1')
    fullyConnectedLayer(1, 'Name', 'CriticOutput')
    ];
% Connect the layer graph
criticNetwork = layerGraph(statePath);
criticNetwork = addLayers(criticNetwork, actionPath);
criticNetwork = addLayers(criticNetwork, commonPath);
criticNetwork = connectLayers(criticNetwork,'CriticStateFC2','add/in1');
criticNetwork = connectLayers(criticNetwork,'CriticActionFC1','add/in2');

% Create critic representation
criticOptions = rlRepresentationOptions('Optimizer','adam','LearnRate',1e-3, ... 
                                        'GradientThreshold',1);

critic = rlRepresentation(criticNetwork,env.getObservationInfo,env.getActionInfo, ...
                          'Observation',{'observation'},'Action',{'action'}, ...
                          criticOptions);


% Create the actor network layers
actorNetwork = [
    featureInputLayer(numObs,'Normalization','none','Name','observation')
    fullyConnectedLayer(200,'Name','ActorFC1')
    reluLayer('Name','ActorRelu1')
    fullyConnectedLayer(200,'Name','ActorFC2')
    reluLayer('Name','ActorRelu2')
    fullyConnectedLayer(numAct,'Name','ActorFC3')
    tanhLayer('Name','ActorTanh12')
    scalingLayer('Name','ActorS','Scale',max(actInfo.UpperLimit))];


% Create actor representation
actorOptions = rlRepresentationOptions('Optimizer','adam','LearnRate',1e-4, ...
                                       'GradientThreshold',1);
                                   
actor = rlRepresentation(actorNetwork,env.getObservationInfo,env.getActionInfo, ... 
                         'Observation',{'observation'}, ...
                         'Action',{'ActorS'},actorOptions);
                     
% DDPG agent options
agentOptions = rlDDPGAgentOptions;
agentOptions.SampleTime = Ts;
agentOptions.DiscountFactor = 0.99;
agentOptions.MiniBatchSize = 64;
agentOptions.ExperienceBufferLength = 1e6;
agentOptions.TargetSmoothFactor = 1e-3;
agentOptions.NoiseOptions.StandardDeviation = 2*sqrt(Ts);
agentOptions.NoiseOptions.StandardDeviationDecayRate = 1e-3;



%Create the agent 
agent = rlDDPGAgent(actor,critic,agentOptions);

%Training Options
maxepisodes = 10000;
maxsteps = ceil(Tf/Ts);
trainingOptions = rlTrainingOptions(...
    'MaxEpisodes',maxepisodes,...
    'MaxStepsPerEpisode',maxsteps,...
    'ScoreAveragingWindowLength',100,...
    'Verbose',0,...
    'Plots','training-progress',...
    'StopTrainingCriteria','AverageReward',...
    'StopTrainingValue',1000000,...
    'SaveAgentCriteria','EpisodeReward',...
    'SaveAgentValue',1000000);

%START TRAINING
trainingStats = train(agent,env,trainingOptions);
