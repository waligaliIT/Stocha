%Script répondant à la question 1.1
clear all;
DonneesP1;

%Q1.1.1
seq1 = genSeq(hmm1,15,5);
seq2 = genSeq(hmm2,15,5);

%Q1.1.4
seqObs1 = genSeq(hmm1,15,500);
seqObs2 = genSeq(hmm2,15,500);
precision = getPrecision(seqObs1, seqObs2, hmm1, hmm2);