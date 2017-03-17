# ccall_test

This is a small test of the overhead by ccall.

I have written a "small" fortran subroutine ([small_subroutine](https://github.com/jmgnve/ccall_test.jl/blob/master/deps/small_routine.f90)) that multiplies **one** number by 2.

I have written a "large" fortan subroutine ([large_subroutine](https://github.com/jmgnve/ccall_test.jl/blob/master/deps/large_routine.f90)) that also multiplies **one** number by 2, but also defines a bunch of constants.

I have written an "array" fortan subroutine ([array_subroutine](https://github.com/jmgnve/ccall_test.jl/blob/master/deps/array_routine.f90)) that multiplies **a vector** by 2. This requires much fewer ccalls than the two first subroutines if doubling a vector.

I have written a julia function that does the same thing as the small fortran subroutine (called test_julia).

I have written three functions that call the fortran subroutines (called test_small_routine, test_large_routine, test_array_routine) using ccall.

The four test function are stored [here](https://github.com/jmgnve/ccall_test.jl/blob/master/src/ccall_test.jl).

I have performed the following tests:

```julia

using ccall_test

using BenchmarkTools

n = 1000000;

invar = randn(Float64, 1);
outvar = zeros(Float64, 1);

@benchmark test_small_routine(invar, outvar, n)

@benchmark test_large_routine(invar, outvar, n)

@benchmark test_julia(invar, outvar, n)

invar = randn(Float64, n);
outvar = zeros(Float64, n);

@benchmark test_array_routine(invar, outvar, n)

```

All fortran subroutines take approximately the same time, whereas the julia function is twice as fast.

