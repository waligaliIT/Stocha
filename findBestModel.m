% fonction trouvant l'indice du modèle ayant le plus probablement généré les data du fichier (et les probabilité d'être généré par chacun des modèles)
function [index, prob] = findBestModel(file, models)
% `models` est un tableau avec tous les modèles assumés avec tous le même nombre de coefficient cepstraux

data = loadData(file, size(models(1).mu, 1));

prob = arrayfun(@(m) mhmm_logprob(data, m.pi, m.A, m.mu, m.sigma, m.B), models)';

[value, index] = max(prob);

end
