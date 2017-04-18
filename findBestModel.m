% function finding the index of the most likely model and the probabilities associated with all of them
% models is a table containing all of the models, being computed with the same number of spectral coefficients
function [index, prob] = findBestModel(sound, models)


data = getCoef(sound, size(models(1).mu, 1));

prob = arrayfun(@(m) mhmm_logprob(data, m.pi, m.A, m.mu, m.sigma, m.B), models)';

[~, index] = max(prob);

end
