% function finding the most likely digit and the probabilities associated with all of them
% models is a table containing the models for the digits from 0 to 9 in order,
% being computed with the same number of spectral coefficients
function [index, prob] = findBestModel(sound, models)


data = getCoef(sound, size(models(1).mu, 1));

prob = arrayfun(@(m) mhmm_logprob(data, m.pi, m.A, m.mu, m.sigma, m.B), models)';

[~, index] = max(prob);
index = index - 1;

end
