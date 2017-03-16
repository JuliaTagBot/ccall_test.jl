subroutine array_routine(invar, outvar, n)

! Loop over an array instead of multiplying single numbers

integer*8 :: n

real*8, intent(in) :: invar(n)
real*8, intent(out) :: outvar(n)

integer*8 :: i

do i = 1,n
   
   outvar(i) = 2.0 * invar(i)

end do

end
