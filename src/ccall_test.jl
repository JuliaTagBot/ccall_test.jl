module ccall_test


export test_small_routine, test_large_routine, test_array_routine, test_julia


const small_routine  = joinpath(dirname(@__FILE__), "..", "deps", "small_routine")

const large_routine  = joinpath(dirname(@__FILE__), "..", "deps", "large_routine")

const array_routine  = joinpath(dirname(@__FILE__), "..", "deps", "array_routine")


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


function test_array_routine(n)

    invar = randn(Float64, n)
    outvar = zeros(Float64, n)

    ccall((:array_routine_, array_routine), Void, (Ptr{Float64},Ptr{Float64},Ptr{Int64}), invar, outvar, &n)
    
end


function test_julia(n)

    invar = randn(Float64, 1)
    outvar = zeros(Float64, 1)

    for i = 1:n
        outvar[1] = 2.0 * invar[1]
    end

end


end
