out(0)
out(2)
out(1)
out(5)
out(6)

function cold()
    off()
    lo(0)
    hi(2)
end

function warm()
    off()
    hi(1)
    lo(5)
    lo(6)
end

function off()
    hi(0)
    lo(2)
    lo(1)
    hi(5)
    hi(6)
end

function all()
    lo(0)
    hi(2)
    hi(1)
    lo(5)
    lo(6)
end
