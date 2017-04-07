function state = randState(dist)
r = rand();
cumul = 0;

for state = 1:length(dist)
    cumul = cumul + dist(state);
    if r <= cumul
        return;
    end
end
disp('Error: Cannot get any state');
end