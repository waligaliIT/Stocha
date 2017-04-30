% extract the audio form all the files corresponding to a digit
function sounds = soundsForDigit(digit)
%% check arguments
if(digit < 0 || digit > 9)
    disp ['Ceci n''est pas un chiffre: ' int2str(digit)]
    return
end

%% extract sound file from the directory
givenDirectory = ['Examples/' int2str(digit) '/'];
givenFiles = arrayfun(@(e) fullfile(givenDirectory, e.name), dir([givenDirectory 'ex-' int2str(digit) '-*.wav']), 'UniformOutput', false);

files = givenFiles;

otherDirectories = {'Data/seb/', 'Data/nathan/', 'Data/francois/'}; % directories holding everybody's data
for i = 1:length(otherDirectories)
    tmpForMatlabLimitation = otherDirectories(i);
    otherDirectory = tmpForMatlabLimitation{1};
    otherFiles = arrayfun(@(e) fullfile(otherDirectory, e.name), dir([otherDirectory int2str(digit) '-*.wav']), 'UniformOutput', false);
    files = [files; otherFiles];
end

sounds = cell(numel(files), 1);

%% read the sounds from the files
for i = 1:numel(files)
	[sounds{i}, fs] = audioread(files{i});
	if fs ~= 44100
		disp([files{i} 'is not sampled at 44100 Hz']);
	end
end

end