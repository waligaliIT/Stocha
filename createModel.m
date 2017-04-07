% fonction construisant un modéle pour un chiffre
function model = createModel(chiffre)
if(chiffre<0 || chiffre >9)
    disp 'ce n''est pas un chiffre'
end
directory = ['Examples/' int2str(chiffre) '/'];
list = dir(directory);
for i = 1:numel(list)
    [num_meteo, txt_meteo, raw_meteo] = xlsread(fullfile(rep,list(i).name),ext(3:end));
end
end