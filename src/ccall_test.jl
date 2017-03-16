module ccall_test


const small_routine  = joinpath(dirname(@__FILE__), "..", "deps", "small_routine")

const large_routine  = joinpath(dirname(@__FILE__), "..", "deps", "large_routine")


function test_small_routine(n)

    invar = randn(Float64, 1)
    outvar = zeros(Float64, 1)

    for i = 1:n
        ccall((:small_routine_, small_routine), Void, (Ptr{Float64},Ptr{Float64}), invar, outvar)
    end

end


function test_large_routine(n)

    invar = randn(Float64, 1)
    outvar = zeros(Float64, 1)

    for i = 1:n
        ccall((:large_routine_, large_routine), Void, (Ptr{Float64},Ptr{Float64}), invar, outvar)
    end

end


function test_julia(n)

    invar = randn(Float64, 1)
    outvar = zeros(Float64, 1)

    for i = 1:n
        outvar[1] = 2.0 * invar[1]
    end

end


end
