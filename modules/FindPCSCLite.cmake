# - Find PCSC-Lite
# Find the native PCSC-Lite includes and library
#
#  PCSCLITE_INCLUDE_DIR - where to find winscard.h, wintypes.h, etc.
#  PCSCLITE_LIBRARIES   - List of libraries when using PCSC-Lite.
#  PCSCLITE_FOUND       - True if PCSC-Lite found.


IF (PCSCLITE_INCLUDE_DIR AND PCSCLITE_LIBRARIES)
  # Already in cache, be silent
  SET(PCSCLITE_FIND_QUIETLY TRUE)
ENDIF (PCSCLITE_INCLUDE_DIR AND PCSCLITE_LIBRARIES)

IF (NOT WIN32)
  FIND_PACKAGE(PkgConfig)
  PKG_CHECK_MODULES(PC_PCSCLITE libpcsclite)
ENDIF (NOT WIN32)

FIND_PATH(PCSCLITE_INCLUDE_DIR winscard.h
  HINTS
  /usr/include/PCSC
  ${PC_PCSCLITE_INCLUDEDIR}
  ${PC_PCSCLITE_INCLUDE_DIRS}
  ${PC_PCSCLITE_INCLUDE_DIRS}/PCSC
  )

FIND_LIBRARY(PCSCLITE_LIBRARY NAMES pcsclite libpcsclite PCSC
  HINTS
  ${PC_PCSCLITE_LIBDIR}
  ${PC_PCSCLITE_LIBRARY_DIRS}
  )

# handle the QUIETLY and REQUIRED arguments and set PCSCLITE_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PCSC-Lite DEFAULT_MSG PCSCLITE_LIBRARY PCSCLITE_INCLUDE_DIR)

IF(PCSCLITE_FOUND)
  SET( PCSCLITE_LIBRARIES ${PCSCLITE_LIBRARY} )
ELSE(PCSCLITE_FOUND)
  SET( PCSCLITE_LIBRARIES )
ENDIF(PCSCLITE_FOUND)

MARK_AS_ADVANCED( PCSCLITE_LIBRARY PCSCLITE_INCLUDE_DIR )
