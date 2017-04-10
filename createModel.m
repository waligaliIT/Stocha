% fonction construisant un modèle pour un chiffre
function model = createModel(chiffre)
if(chiffre < 0 || chiffre > 9)
    disp 'Ceci n''est pas un chiffre'
    return
end

givenDirectory = ['Examples/' int2str(chiffre) '/'];
givenFiles = arrayfun(@(e) fullfile(givenDirectory, e.name), dir([givenDirectory 'ex-' int2str(chiffre) '-*.wav']), 'UniformOutput', false);

files = givenFiles;

otherDirectories = {'Data/seb/', 'Data/nathan/', 'Data/francois/'}; % chacun rajoute ses données là où il faut
for i = 1:length(otherDirectories)
    tmpForMatlabLimitation = otherDirectories(i);
    otherDirectory = tmpForMatlabLimitation{1};
    otherFiles = arrayfun(@(e) fullfile(otherDirectory, e.name), dir([otherDirectory int2str(chiffre) '-*.wav']), 'UniformOutput', false);
    files = [files; otherFiles];
end

for i = 1:numel(files)
    %obs = loadWav(files(i));
    % TODO: implement rest of magic
end
end
