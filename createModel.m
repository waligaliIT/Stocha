% fonction construisant un modèle pour un chiffre
function model = createModel(chiffre, numberStates, numberObs, numberCep)
if(chiffre < 0 || chiffre > 9)
    disp 'Ceci n''est pas un chiffre'
    return
end

givenDirectory = ['Examples/' int2str(chiffre) '/'];
givenFiles = arrayfun(@(e) fullfile(givenDirectory, e.name), dir([givenDirectory 'ex-' int2str(chiffre) '-*.wav']), 'UniformOutput', false);

files = givenFiles;

otherDirectories = {'Data/seb/', 'Data/nathan/', 'Data/francois/'}; % chacun rajoute ses données là où il faut
for i = 1:length(otherDirectories)
    tmpForMatlabLimitation = otherDirectories(i);
    otherDirectory = tmpForMatlabLimitation{1};
    otherFiles = arrayfun(@(e) fullfile(otherDirectory, e.name), dir([otherDirectory int2str(chiffre) '-*.wav']), 'UniformOutput', false);
    files = [files; otherFiles];
end

trainingData = cell(1,numel(files));
for i = 1:numel(files)
    trainingData{i} = loadData(files{i}, numberCep);
end

prior0 = normalise(rand(numberStates,1));
transmat0 = mk_stochastic(rand(numberStates,numberStates));

[mu0, Sigma0] = mixgauss_init(numberStates*numberObs, cell2mat(trainingData), 'diag');
mu0 = reshape(mu0, [numberCep numberStates numberObs]);
Sigma0 = reshape(Sigma0, [numberCep numberCep numberStates numberObs]);
mixmat0 = mk_stochastic(rand(numberStates,numberObs));

[LL, model.pi, model.A, model.mu, model.sigma, model.B] = mhmm_em(trainingData, prior0, transmat0, mu0, Sigma0, mixmat0, 'verbose', 0);


end
