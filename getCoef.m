% function exporting the mel coefficients out of a given sound
function obs = getCoef(sound, numberCep)
fs = 44100;
band = [700, 1400]/(fs/2);
[B, A] = butter(2,band);
sound = filter(B, A, sound);
obs = melfcc(sound(:,1),fs,'numcep', numberCep);
obs = standardize(obs);
end
