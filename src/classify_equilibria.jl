"""
    classify_equilibria(f::Callable, region)

Rigorously find all solutions of the system `f(x) == 0` in the region and
classsify them according to their stability.
""" 
function classify_equilibria(f, region)
    rts = roots(IntervalBox(region)) do X
        return f(X)
    end

    return map(rts) do root
        X = root.interval
        root.status === :unkown && return X, :unsolved
       
        J = ForwardDiff.jacobian(f, X.v)
        J = Matrix(J)

        λs, _, cert = verify_eigen(J)
        λs = real.(λs)

        all(cert) || return X, :unknown
        
        all(sup.(λs) .< 0) && return X, :stable
        any(inf.(λs) .> 0) && return X, :unstable
        return X, :unknown
    end
end