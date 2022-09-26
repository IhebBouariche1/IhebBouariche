open_system('system')

obsInfo = rlNumericSpec([5 1]);
obsInfo.Name = 'observations';

actInfo = rlNumericSpec([1 1],'UpperLimit',5,'LowerLimit',-5);
actInfo.Name = 'Torque';
numActions = actInfo.Dimension(1);

env = rlSimulinkEnv('system','system/RL Agent',...
    obsInfo,actInfo); 

Ts = 0.02;
rng(0)

statePath = [
    imageInputLayer([5 1 1],'Normalization','none','Name','State')
    fullyConnectedLayer(128,'Name','CriticStateFC1')
    reluLayer('Name','CriticRelu1')
    fullyConnectedLayer(200,'Name','CriticStateFC2')];
actionPath = [
    imageInputLayer([numActions 1 1],'Normalization','none','Name','Action')
    fullyConnectedLayer(200,'Name','CriticActionFC1','BiasLearnRateFactor',0)];
commonPath = [
    additionLayer(2,'Name','add')
    reluLayer('Name','CriticCommonRelu')
    fullyConnectedLayer(1,'Name','CriticOutput')];

criticNetwork = layerGraph();
criticNetwork = addLayers(criticNetwork,statePath);
criticNetwork = addLayers(criticNetwork,actionPath);
criticNetwork = addLayers(criticNetwork,commonPath);
criticNetwork = connectLayers(criticNetwork,'CriticStateFC2','add/in1');
criticNetwork = connectLayers(criticNetwork,'CriticActionFC1','add/in2');

figure
plot(criticNetwork)

criticOpts = rlRepresentationOptions('LearnRate',1e-03,'GradientThreshold',1);

critic = rlRepresentation(criticNetwork,obsInfo,actInfo,'Observation',{'State'},'Action',{'Action'},criticOpts);

actorNetwork = [
    imageInputLayer([5 1 1],'Normalization','none','Name','State')
    fullyConnectedLayer(128,'Name','ActorFC1')
    reluLayer('Name','ActorRelu1')
    fullyConnectedLayer(200,'Name','ActorFC2')
    reluLayer('Name','ActorRelu2')
    fullyConnectedLayer(1,'Name','ActorFC3')
    tanhLayer('Name','ActorTanh1')
    scalingLayer('Name','Action','Scale',max(actInfo.UpperLimit))];

actorOptions = rlRepresentationOptions('LearnRate',5e-04,'GradientThreshold',1);

actor = rlRepresentation(actorNetwork,obsInfo,actInfo,...
    'Observation',{'State'},'Action',{'Action'},actorOptions);

agentOpts = rlDDPGAgentOptions(...
    'SampleTime',Ts,...
    'TargetSmoothFactor',1e-3,...
    'DiscountFactor',1, ...
    'MiniBatchSize',128, ...
    'ExperienceBufferLength',1e6); 
agentOpts.NoiseOptions.Variance = 0.4;
agentOpts.NoiseOptions.VarianceDecayRate = 1e-5;

agent = rlDDPGAgent(actor,critic,agentOpts);

trainOpts = rlTrainingOptions(...
    'MaxEpisodes',5000,...
    'MaxStepsPerEpisode',1250,...
    'ScoreAveragingWindowLength',10,...
    'Verbose',false,...
    'Plots','training-progress',...
    'StopTrainingCriteria','AverageReward',...
    'StopTrainingValue',1000,...
    'SaveAgentCriteria','EpisodeReward',...
    'SaveAgentValue',0);

trainingStats = train(agent,env,trainOpts);

simOpts = rlSimulationOptions('MaxSteps',1000,'StopOnError','on');
experiences = sim(env,agent,simOpts);