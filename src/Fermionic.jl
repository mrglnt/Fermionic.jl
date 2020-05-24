module Fermionic
using SparseArrays
using LinearAlgebra

include("base_functions.jl")
include("operators.jl")
include("states.jl")
include("correlations.jl")
include("logic_gates.jl")
include("operators_fixed.jl")
include("states_fixed.jl")

export  Op, dim, basis, cm, cdm, cdcm, cmcd, cmcm, cdcd, vacuum
export State, State_sparse, State_complex, State_sparse_complex, st, ope, rhosp, rhoqsp
export eigensp, ssp, eigenqsp, sqsp, majorization_sp, majorization_qsp
export sigma_x, sigma_y, sigma_z, phase, hadamard, ucnot, swap
export fixed, basis_m
end # module
