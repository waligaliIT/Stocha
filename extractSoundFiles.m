function [ files ] = extractSoundFiles( directory, digit, prefixe, suffixe )
% extractSoundFiles - extract the '.wav' files in a directory 
%% constants 
extension='.wav';

%% check arguments
narginchk(2,4);
if nargin < 4
    suffixe='-*';
end
if nargin < 3
    prefixe='';
end

%% get file names
directory = [directory '/'];
files = arrayfun(@(e) fullfile(directory, e.name), dir([directory prefixe int2str(digit) suffixe extension]), 'UniformOutput', false);

end

