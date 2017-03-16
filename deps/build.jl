if is_windows()
    flags = ["-m$(Sys.WORD_SIZE)", "-shared", "-O3"]
else
    flags = ["-m$(Sys.WORD_SIZE)", "-shared", "-O3", "-fPIC"]
end

run(`gfortran $flags small_routine.f90 -o small_routine.$(Libdl.dlext)`)

run(`gfortran $flags large_routine.f90 -o large_routine.$(Libdl.dlext)`)

run(`gfortran $flags array_routine.f90 -o array_routine.$(Libdl.dlext)`)

