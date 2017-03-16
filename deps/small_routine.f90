subroutine small_routine(invar, outvar)

! Code common to small_routine and large_routine
  
real*8, intent(in) :: invar
real*8, intent(out) :: outvar

outvar = 2.0 * invar

end
