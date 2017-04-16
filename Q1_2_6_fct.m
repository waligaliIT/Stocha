% fonction répondant à la question 1.2.6 (avec un jeu de paramètres)
function precision = Q1_2_6_fct(numberSeq, numberStates)
precision = zeros(2,1);
DonneesP1;
seqObs1 = genSeq(hmm1,15,numberSeq);
seqObs2 = genSeq(hmm2,15,numberSeq);
[~, hmm1b.pi, hmm1b.A, hmm1b.B] = dhmm_em(seqObs1, mk_stochastic(rand(numberStates,1)), mk_stochastic(rand(numberStates,numberStates)), mk_stochastic(rand(numberStates,size(hmm1.B,2))), 'verbose', 0);
[~, hmm2b.pi, hmm2b.A, hmm2b.B] = dhmm_em(seqObs2, mk_stochastic(rand(numberStates,1)), mk_stochastic(rand(numberStates,numberStates)), mk_stochastic(rand(numberStates,size(hmm2.B,2))), 'verbose', 0);

precision(1) = getPrecision(seqObs1, seqObs2, hmm1b, hmm2b);
precision(2) = getPrecision(seqObs1, seqObs2, hmm1, hmm2);
end
