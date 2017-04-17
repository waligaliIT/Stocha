% récupère tous les fichiers correspondant à un chiffre sous la forme d'un cell array
function files = fichiersPourChiffre(digit)

if(digit < 0 || digit > 9)
    disp ['Ceci n''est pas un chiffre: ' int2str(digit)]
    return
end

givenDirectory = ['Examples/' int2str(digit) '/'];
givenFiles = arrayfun(@(e) fullfile(givenDirectory, e.name), dir([givenDirectory 'ex-' int2str(digit) '-*.wav']), 'UniformOutput', false);

files = givenFiles;

otherDirectories = {'Data/seb/', 'Data/nathan/', 'Data/francois/'}; % chacun rajoute ses données là où il faut
for i = 1:length(otherDirectories)
    tmpForMatlabLimitation = otherDirectories(i);
    otherDirectory = tmpForMatlabLimitation{1};
    otherFiles = arrayfun(@(e) fullfile(otherDirectory, e.name), dir([otherDirectory int2str(digit) '-*.wav']), 'UniformOutput', false);
    files = [files; otherFiles];
end

end