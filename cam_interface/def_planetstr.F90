! Module containing derive type definitions for use in planet radiation.

MODULE def_planetstr

  USE realtype_rd, ONLY: RealK
  USE rad_ccf,    ONLY: solar_t_effective, solar_radius

! Define derived type to keep high resolution solar spectrum
  TYPE StrSolarSpec

    INTEGER :: &
        n_points = 0
!         Number of points in the spectrum
    REAL (RealK), ALLOCATABLE :: &
        wavelength(:), &
!         Wavelength at which the spectral irradiance is specified
        irrad(:)
!         Solar spectral irradiance in units of Wm-2.m-1
    REAL (RealK) :: &
        t_effective = solar_t_effective, &
!         Effective solar temperature
        radius = solar_radius
!         Radius at the photosphere

  END TYPE StrSolarSpec

! Define derived type to keep tabulated aerosol optical properties
  TYPE StrAerData

!   Dimension sizes
    INTEGER :: &
        n_component, &
!         Number of aerosol components
        n_radius_max, &
!         Number of radii
        n_humidity, &
!         Number of humidities
        n_band
!         Number of bands

!   Dimensions
    INTEGER, ALLOCATABLE :: &
        i_component(:), &
!         Aerosol component index defined in rad_pcf
        band(:), &
!         Band index
        n_radius(:)
!         Number of radii in table
    REAL(RealK), ALLOCATABLE :: &
        radius_eff(:, :, :), &
!         Effective radius
        humidity(:)
!         Humidities

!   Data
    LOGICAL, ALLOCATABLE :: &
        l_humidity(:)
!         Logical for humidity dependence of optical properties
    INTEGER, ALLOCATABLE :: &
        i_component_map(:)
!         Maps component index in i_component (as defined in rad_pcf) into
!         component index used in data arrays
    REAL(RealK), ALLOCATABLE :: &
        radius_eff_dry(:, :), &
!         Dry effective radius
        k_abs(:, :, :, :), &
!         Absorption coefficient
        k_scat(:, :, :, :), &
!         Scattering coefficient
        g_asym(:, :, :, :), &
!         Asymmetry parameter
        density(:), &
!         Bulk density for each aerosol component used in data
        k_abs_550nm(:, :, :), &
!         Absorption coefficient at 550nm for diagnostic purposes
        k_scat_550nm(:, :, :), &
!         Scattering coefficient at 550nm for diagnostic purposes
        g_asym_550nm(:, :, :)
!         Asymmetry parameter at 550nm for diagnostic purposes

    CHARACTER(LEN=256) :: &
        spectral_file
!         Name of spectral file to be used with aerosol data
    CHARACTER(LEN=2) :: &
        spectral_region
!         Indicates if data is for short-wave (also contains diagnostic
!         quantities) or long-wave. Either 'sw' or 'lw'.

  END TYPE StrAerData

END MODULE def_planetstr
