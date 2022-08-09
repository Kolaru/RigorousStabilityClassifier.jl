export eigendiscs

"""
Eigen values regions according to
M. Hladík. Bounds on eigenvalues of real and complex interval matrices.
Appl. Math. Comput., 219(10):5584–5591, 2013.

This is a naive non rigorous implementation.
"""
function eigendiscs(A, p=2)
    Ac = mid.(A)
    AΔ = radius.(A)

    λs, V = eigen(Ac)
    r = cond(V, p) * norm(AΔ, p)

    return map(λs) do λ
        (λ, r)
    end
end
