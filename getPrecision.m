function precision = getPrecision(seqObs1, seqObs2, hmm1, hmm2)
logprob11 = zeros(size(seqObs1,1),1);
logprob12 = zeros(size(seqObs1,1),1);
logprob21 = zeros(size(seqObs1,1),1);
logprob22 = zeros(size(seqObs1,1),1);
for i=1:size(seqObs1,1)
    logprob11(i) = dhmm_logprob(seqObs1(i,:), hmm1.pi, hmm1.A, hmm1.B);
    logprob12(i) = dhmm_logprob(seqObs1(i,:), hmm2.pi, hmm2.A, hmm2.B);
    logprob21(i) = dhmm_logprob(seqObs2(i,:), hmm1.pi, hmm1.A, hmm1.B);
    logprob22(i) = dhmm_logprob(seqObs2(i,:), hmm2.pi, hmm2.A, hmm2.B);
end
precision = (sum(logprob11 > logprob12) + sum(logprob22 > logprob21))/2/size(seqObs1,1);
end