% fonction important un échantillon de voix
function obs = loadWav(path)
[sound,fs]= audioread(path);
band = [700, 1400]/(fs/2);
[B, A] = butter(2,band);
sound = filter(B, A, sound);

% mixgauss_init...

% melfcc
obs = melfcc(sound,fs,'numcep',17);
end