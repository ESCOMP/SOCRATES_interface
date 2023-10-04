! *****************************COPYRIGHT*******************************
! (C) Crown copyright Met Office. All rights reserved.
! For further details please refer to the file COPYRIGHT.txt
! which you should have received as part of this distribution.
! *****************************COPYRIGHT*******************************

MODULE Ereport_Mod

CONTAINS

  !  Subroutine Ereport - handles errors/warnings
  !
  ! Method:
  !   ErrorStatus > 0 is a hard error
  !   ErrorStatus < 0 is a warning
  !   ErrorStatus = 0 is hunky-dory

  SUBROUTINE Ereport ( RoutineName, ErrorStatus, Cmessage )

! Arguments
    CHARACTER (LEN=*), INTENT( IN )   :: RoutineName
    CHARACTER (LEN=*), INTENT( IN )   :: Cmessage
    INTEGER, INTENT( INOUT )          :: ErrorStatus

! Local scalars
    INTEGER                       :: unit = 6
    CHARACTER (LEN=*), PARAMETER  :: astline = '************************&
        &*****************************************************'

    IF ( ErrorStatus > 0 ) THEN
      CALL stop_model('SOCRATES: ' // TRIM(Cmessage), 255)
      STOP
    ELSE IF ( ErrorStatus < 0) THEN
      WRITE(unit,'(A)')    astline
      WRITE(unit,'(A)')    '*** WARNING *****************************'
      WRITE(unit,'(A,A)')  '* Warning in routine: ', &
          RoutineName( 1 : Len_Trim(RoutineName) )
      WRITE(unit,'(A,I5)') '* Warning Code: ',ErrorStatus
      WRITE(unit,'(A,A)')  '* Warning Message: ', &
          Cmessage( 1 : LEN_TRIM(Cmessage) )
      WRITE(unit,'(A)')    astline
    END IF
    
    ! Reset ErrorStatus
    ErrorStatus = 0

  END SUBROUTINE Ereport

END MODULE Ereport_Mod

