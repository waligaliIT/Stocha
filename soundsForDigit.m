% récupère tous les fichiers correspondant à un chiffre sous la forme d'un cell array
function sounds = soundsForDigit(digit)

if(digit < 0 || digit > 9)
    disp ['Ceci n''est pas un chiffre: ' int2str(digit)]
    return
end

givenDirectory = ['Examples/' int2str(digit) '/'];
givenFiles = arrayfun(@(e) fullfile(givenDirectory, e.name), dir([givenDirectory 'ex-' int2str(digit) '-2.wav']), 'UniformOutput', false);

files = givenFiles;

otherDirectories = {'Data/seb/', 'Data/nathan/', 'Data/francois/'}; % chacun rajoute ses données là où il faut
for i = 1:length(otherDirectories)
    tmpForMatlabLimitation = otherDirectories(i);
    otherDirectory = tmpForMatlabLimitation{1};
    otherFiles = arrayfun(@(e) fullfile(otherDirectory, e.name), dir([otherDirectory int2str(digit) '-*.wav']), 'UniformOutput', false);
    files = [files; otherFiles];
end

sounds = cell(numel(files), 1);

for i = 1:numel(files)
	[sounds{i}, fs] = audioread(files{i});
	if fs ~= 44100
		disp([files{i} 'is not sampled at 44100 Hz']);
	end
end

end