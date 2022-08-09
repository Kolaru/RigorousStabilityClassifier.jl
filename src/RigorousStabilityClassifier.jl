module RigorousStabilityClassifier

using ForwardDiff
using IntervalArithmetic
using IntervalRootFinding
using IntervalLinearAlgebra

export classify_equilibria

include("eigen.jl")
include("classify_equilibria.jl")

end
