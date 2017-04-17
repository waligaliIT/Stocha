% fonction construisant un modèle pour un chiffre
function model = createModel(files, numberStates, numberObs, numberCep)

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
