# ccall_test

I have written a "small" fortran subroutine ([small_subroutine](https://github.com/jmgnve/ccall_test.jl/blob/master/deps/small_routine.f90)) that multiplies a number by 2.

I have written a "large" fortan subroutine ([large_subroutine](https://github.com/jmgnve/ccall_test.jl/blob/master/deps/large_routine.f90)) that also multiplies a number by 2, but also defines a bunch of constants.

I have written a julia function that does the same thing as the small fortran subroutine (called test_julia).

I have written two functions that call the fortran subroutines (called test_small_routine and test_large_routine) using ccall.

The three test function are stored [here](https://github.com/jmgnve/ccall_test.jl/blob/master/src/ccall_test.jl).

I have performed the following tests:

```julia

using ccall_test

test_small_routine(1)

test_large_routine(1)

test_julia(1)

n = 1000000

@time test_small_routine(n)

@time test_large_routine(n)

@time test_julia(n)

```

This is the output I get:

```julia
julia> @time test_small_routine(n)
  0.008211 seconds (6 allocations: 352 bytes)

julia> @time test_large_routine(n)
  0.008081 seconds (6 allocations: 352 bytes)

julia> @time test_julia(n)
  0.003387 seconds (6 allocations: 352 bytes)
```

Both the "small" and "large" fortran subroutines take the same time, whereas the julia function is twice as fast.

