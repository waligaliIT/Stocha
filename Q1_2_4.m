% script for question 1.2.4
clear all;
DonneesP1;

nbreSeq = 1;
A = hmm3.A;
B = hmm3.B;
initA = mk_stochastic(rand(2,2));
initB = mk_stochastic(rand(2,3));
% initA = A;
% initB = B;


% 100
length = 100;
seqObs = genSeq(hmm3,length,nbreSeq);
[estVitA1, estVitB1] = hmmtrain(seqObs, initA, initB, 'ALGORITHM', 'Viterbi', 'PSEUDOTRANSITIONS', ones(size(A))/10^7);
[estBaumA1, estBaumB1] = hmmtrain(seqObs, initA, initB);

% 250
length = 250;
seqObs = genSeq(hmm3,length,nbreSeq);
[estVitA2, estVitB2] = hmmtrain(seqObs, initA, initB, 'ALGORITHM', 'Viterbi', 'PSEUDOTRANSITIONS', ones(size(A))/10^7);
[estBaumA2, estBaumB2] = hmmtrain(seqObs, initA, initB);

% 500
length = 500;
seqObs = genSeq(hmm3,length,nbreSeq);
[estVitA3, estVitB3] = hmmtrain(seqObs, initA, initB, 'ALGORITHM', 'Viterbi', 'PSEUDOTRANSITIONS', ones(size(A))/10^7);
[estBaumA3, estBaumB3] = hmmtrain(seqObs, initA, initB);

% 1000
length = 1000;
seqObs = genSeq(hmm3,length,nbreSeq);
[estVitA4, estVitB4] = hmmtrain(seqObs, initA, initB, 'ALGORITHM', 'Viterbi', 'PSEUDOTRANSITIONS', ones(size(A))/10^7);
[estBaumA4, estBaumB4] = hmmtrain(seqObs, initA, initB);
