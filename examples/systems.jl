using StaticArrays

function double_negative(xy ; c1 = 2.7, c2 = 2.7)
    x, y = xy

    return SVector(
        c1/(1 + y^2) - x,
        c2/(1 + x^2) - y
    )
end