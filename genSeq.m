% function generating numberSeq sequences of lengthSeq observations coming from the given model
function seq = genSeq(model, lengthSeq, numberSeq)
x = zeros(numberSeq, lengthSeq);

x(:,1) = arrayfun(@(tmp) randState(model.pi), x(:,1));
for i = 2:lengthSeq
    x(:,i) = arrayfun(@(prec) randState(model.A(prec, :)), x(:, i-1));
end
seq = arrayfun(@(state) randState(model.B(state, :)), x);
end