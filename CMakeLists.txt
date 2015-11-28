INCLUDE(Towerism/CMake/add_cxx_flags)
INCLUDE(Towerism/CMake/code_coverage)

OPTION(FRACKPARITY_COVERAGE "Enable test coverage analysis of FrackDB" OFF)

ADD_BII_TARGETS()

ADD_CXX_FLAGS("-std=c++14")

IF (${FRACKPARITY_COVERAGE} AND NOT WINDOWS AND NOT APPLE)
  ADD_CXX_FLAGS("--coverage")
  SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
  SETUP_TARGET_FOR_COVERAGE(
    coverage
    ${BII_test_unit_TARGET}
    coverage
  )
ENDIF()
