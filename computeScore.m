% results = [digit nbreTimesFound nbreTimesCorrectFound nbreTestedSample]
function results = computeScore(directory, models)

files = arrayfun(@(e) fullfile(directory, e.name), dir([directory '*-*.wav']), 'UniformOutput', false);

results = zeros(10,4);
results(:,1) = 0:9;

for i = 1:numel(files)
	[sound, fs] = audioread(files{i});
	if fs ~= 44100
		disp(['bad frequency' int2str(fs)])
	end
	foundDigit = findBestModel(sound, models) + 1;
	
	[~,name] = fileparts(files{i});

	realDigit = str2num([name(1)]) + 1;
	
	results(foundDigit, 2) = results(foundDigit, 2) + 1;
	results(realDigit, 3) = results(realDigit, 3) + (realDigit == foundDigit);
	results(realDigit, 4) = results(realDigit, 4) + 1;
end

tmp = sum(results,1);
score = tmp(3) / tmp(4);
disp(score)

end