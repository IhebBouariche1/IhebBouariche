%%%%%%%%%%%%Environement Creation%%%%%%%%%%%%%
mdl = 'system';
open_system(mdl)
obsInfo = rlNumericSpec([5 1]) % vector of 3 observations: e de/dt integralof(e)
actInfo = rlFiniteSetSpec([-1 0 1]) % all possible values for actions 
obsInfo.Name = 'observations';
actInfo.Name = 'Action';
agentBlk = [mdl '/RL Agent'];
env = rlSimulinkEnv(mdl,agentBlk,obsInfo,actInfo)
Ts = 0.05;
Tf = 20;
rng(0)

%%%%%%%%%Neural Network%%%%%%%%%%%
statePath = [
    imageInputLayer([5 1 1],'Normalization','none','Name','state')
    fullyConnectedLayer(64,'Name','CriticStateFC1')
    reluLayer('Name','CriticRelu1')
    fullyConnectedLayer(64,'Name','CriticStateFC2')];
actionPath = [
    imageInputLayer([1 1 1],'Normalization','none','Name','action')
    fullyConnectedLayer(64,'Name','CriticActionFC1','BiasLearnRateFactor',0)];
commonPath = [
    additionLayer(2,'Name','add')
    reluLayer('Name','CriticCommonRelu')
    fullyConnectedLayer(1,'Name','output')];
criticNetwork = layerGraph();
criticNetwork = addLayers(criticNetwork,statePath);
criticNetwork = addLayers(criticNetwork,actionPath);
criticNetwork = addLayers(criticNetwork,commonPath);
criticNetwork = connectLayers(criticNetwork,'CriticStateFC2','add/in1');
criticNetwork = connectLayers(criticNetwork,'CriticActionFC1','add/in2');
figure;
plot(criticNetwork);

%%%%%%%%%%%%Options%%%%%%%%%%%%%%%%%
criticOptions = rlRepresentationOptions('LearnRate',0.001,'GradientThreshold',1);

critic = rlRepresentation(criticNetwork,obsInfo,actInfo,...
    'observation',{'state'},'Action',{'action'},criticOptions);

%%%%%%%%%%%%DQN Configuration%%%%%%%%%%%%%
agentOptions = rlDQNAgentOptions(...
    'SampleTime',Ts,...
    'TargetSmoothFactor',1e-3,...    %terget network updates methode
    'ExperienceBufferLength',1e6,...   %replay memory length
    'UseDoubleDQN',false,...
    'DiscountFactor',0.99,...    %facteur d'oublie de reward 
    'MiniBatchSize',64);        %mini batch for replay memory


agent = rlDQNAgent(critic,agentOptions);


trainingOptions = rlTrainingOptions(...
    'MaxEpisodes',1000,...
    'MaxStepsPerEpisode',1000,...
    'ScoreAveragingWindowLength',10,...
    'Verbose',false,...
    'Plots','training-progress',...
    'StopTrainingCriteria','AverageReward',...
    'StopTrainingValue',1000,...
    'SaveAgentCriteria','EpisodeReward',...
    'SaveAgentValue',1000);

%%%%%%%%%%%%%%%Training%%%%%%%%%%%%%%%
trainingStats = train(agent,env,trainingOptions);

%%%%%%%%%%%%%%%Simulation%%%%%%%%%%%%%
simOptions = rlSimulationOptions('MaxSteps',1000);
experience = sim(env,agent,simOptions);