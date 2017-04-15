% fonction important un échantillon de voix
function obs = loadData(path)
[sound,fs]= audioread(path);
band = [700, 1400]/(fs/2);
[B, A] = butter(2,band);
sound = filter(B, A, sound);
obs = melfcc(sound,fs,'numcep',17);
end