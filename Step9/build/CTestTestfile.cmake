# CMake generated Testfile for 
# Source directory: D:/Code/CMake-Tutorial/Step9
# Build directory: D:/Code/CMake-Tutorial/Step9/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Runs "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "25")
  set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;44;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Runs "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "25")
  set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;44;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Runs "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "25")
  set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;44;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Runs "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "25")
  set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;44;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Runs NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Usage "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe")
  set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;47;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Usage "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe")
  set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;47;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Usage "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe")
  set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;47;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Usage "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe")
  set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;47;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Usage NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Comp4 "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "4")
  set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "4 is 2" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;61;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Comp4 "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "4")
  set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "4 is 2" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;61;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Comp4 "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "4")
  set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "4 is 2" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;61;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Comp4 "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "4")
  set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "4 is 2" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;61;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Comp4 NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Comp9 "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "9")
  set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;62;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Comp9 "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "9")
  set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;62;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Comp9 "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "9")
  set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;62;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Comp9 "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "9")
  set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;62;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Comp9 NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Comp5 "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "5")
  set_tests_properties(Comp5 PROPERTIES  PASS_REGULAR_EXPRESSION "5 is 2.236" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;63;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Comp5 "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "5")
  set_tests_properties(Comp5 PROPERTIES  PASS_REGULAR_EXPRESSION "5 is 2.236" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;63;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Comp5 "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "5")
  set_tests_properties(Comp5 PROPERTIES  PASS_REGULAR_EXPRESSION "5 is 2.236" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;63;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Comp5 "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "5")
  set_tests_properties(Comp5 PROPERTIES  PASS_REGULAR_EXPRESSION "5 is 2.236" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;63;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Comp5 NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Comp7 "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "7")
  set_tests_properties(Comp7 PROPERTIES  PASS_REGULAR_EXPRESSION "7 is 2.645" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;64;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Comp7 "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "7")
  set_tests_properties(Comp7 PROPERTIES  PASS_REGULAR_EXPRESSION "7 is 2.645" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;64;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Comp7 "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "7")
  set_tests_properties(Comp7 PROPERTIES  PASS_REGULAR_EXPRESSION "7 is 2.645" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;64;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Comp7 "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "7")
  set_tests_properties(Comp7 PROPERTIES  PASS_REGULAR_EXPRESSION "7 is 2.645" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;64;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Comp7 NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Comp25 "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "25")
  set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;65;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Comp25 "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "25")
  set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;65;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Comp25 "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "25")
  set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;65;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Comp25 "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "25")
  set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;65;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Comp25 NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Comp-25 "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "-25")
  set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is (-nan|nan|0)" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;66;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Comp-25 "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "-25")
  set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is (-nan|nan|0)" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;66;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Comp-25 "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "-25")
  set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is (-nan|nan|0)" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;66;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Comp-25 "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "-25")
  set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is (-nan|nan|0)" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;66;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Comp-25 NOT_AVAILABLE)
endif()
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(Comp0.0001 "D:/Code/CMake-Tutorial/Step9/build/Debug/Tutorial.exe" "0.0001")
  set_tests_properties(Comp0.0001 PROPERTIES  PASS_REGULAR_EXPRESSION "0.0001 is 0.01" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;67;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(Comp0.0001 "D:/Code/CMake-Tutorial/Step9/build/Release/Tutorial.exe" "0.0001")
  set_tests_properties(Comp0.0001 PROPERTIES  PASS_REGULAR_EXPRESSION "0.0001 is 0.01" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;67;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(Comp0.0001 "D:/Code/CMake-Tutorial/Step9/build/MinSizeRel/Tutorial.exe" "0.0001")
  set_tests_properties(Comp0.0001 PROPERTIES  PASS_REGULAR_EXPRESSION "0.0001 is 0.01" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;67;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(Comp0.0001 "D:/Code/CMake-Tutorial/Step9/build/RelWithDebInfo/Tutorial.exe" "0.0001")
  set_tests_properties(Comp0.0001 PROPERTIES  PASS_REGULAR_EXPRESSION "0.0001 is 0.01" _BACKTRACE_TRIPLES "D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;54;add_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;67;do_test;D:/Code/CMake-Tutorial/Step9/CMakeLists.txt;0;")
else()
  add_test(Comp0.0001 NOT_AVAILABLE)
endif()
subdirs("MathFunctions")
