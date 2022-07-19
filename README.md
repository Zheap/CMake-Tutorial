# CMake Tutorial
### CMake内置关键字

#### PROJECT_BINARY_DIR

CMake的顶层编译目录，可以理解成就是build目录，

```
PROJECT_BINARY_DIR: D:/Code/CMake-Tutorial/Step1/build
```

#### PROJECT_SOURCE_DIR

CMakeLists.txt所处的工程源码根路径，可以理解成顶层代码所在路径

```
PROJECT_SOURCE_DIR: D:/Code/CMake-Tutorial/Step2
```

#### CMAKE_CXX_STANDARD & CMAKE_CXX_STANDARD_REQUIRED

指定C++的版本，配合set使用，需要放置在add_executable前面

```
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
```

#### CMAKE_CURRENT_SOURCE_DIR

当前CMakeLists.txt所处的目录

```
CMAKE_CURRENT_SOURCE_DIR: D:/Code/CMake-Tutorial/Step2/MathFunctions
```



------



### CMake内置命令

CMake的命令支持大写、小写或者大小写混合的写法，但是通常使用小写



#### cmake_minimum_required

指示当前CMakeLists.txt所需最小CMake版本

```
cmake_minimum_required(VERSION 3.10)
```

#### project

指示当前工程名，还可以指定版本号

```
project(Tutorial VERSION 1.0)
```

#### configure_file

拷贝一个文件的内容到另一个文件，并修改其中的内容，比如获取版本号，替换其中的@VAR@ 或 ${VAR}

```
configure_file(TutorialConfig.h.in TutorialConfig.h)

TutorialConfig.h.in的内容
    // the configured options and settings for Tutorial
    #define Tutorial_VERSION_MAJOR @Tutorial_VERSION_MAJOR@    // @Tutorial_VERSION_MAJOR@会被替换成1，依照上面project中指定的VERSION
    #define Tutorial_VERSION_MINOR @Tutorial_VERSION_MINOR@    // @Tutorial_VERSION_MINOR@会被替换成0
```

#### add_executable

添加可执行程序 .exe，.app，设置程序名，并执行源文件

```
add_executable(Tutorial tutorial.cpp)
```

#### add_library

用于创建静态库 (.lib)

```
add_library(MathFunctions mysqrt.cpp)
```

#### add_subdirectory

用于将指定目录放到当前工程编译环境中一起编译，该指定目录下一定要有CMakeLists.txt，比如将工程所引用的库的目录给添加进来

```
add_subdirectory(MathFunctions)
```

#### target_include_directories

用于将某路径添加到include搜索路径表中，这样子之后就能找到对应的include文件； 一般放在add_executable命令后

```
target_include_directories(Tutorial PUBLIC
                           "${PROJECT_BINARY_DIR}"
                          )
```

#### target_link_libraries

用于将库连接到当前工程中，一般放在add_executable后

```
list(APPEND EXTRA_LIBS MathFunctions)  				  // 此处的库名要和add_library中的库名对应

target_link_libraries(Tutorial PUBLIC ${EXTRA_LIBS})  // ${EXTRA_LIBS}是库的列表，可以存放许多库
```

#### option

定义开关选项，用于后续判断，可以在编译的时候通过 -DXXX 来指定开关；也可以通过在.in文件中使用#cmakedefine xxx定义，这样就能和对应同名的option开关做绑定，来实现宏开关功能，需要放在configure命令前

```
option(USE_MYMATH "Use tutorial provided math implementation" ON)

configure_file(TutorialConfig.h.in TutorialConfig.h)

// TutorialConfig.h.in
#cmakedefine USE_MYMATH

// 编译时指定
cmake .. -DUSE_MYMATH=FALSE
```

#### list & APPEND

可以理解成是CMake内置的数组列表，用于放置比如路径，库名等等，使用APPEND命令往里面添加元素；拥有自己的list别名，list声明后，作用域不仅仅局限于当前作用域，声明后的所有位置都可以访问到它；访问的方法是${list_name} 或 "${list_name}"

```
if(USE_MYMATH)
    add_subdirectory(MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
    list(APPEND EXTRA_INCLUDES "${PROJECT_SOURCE_DIR}/MathFunctions") // 这两个list都可以在if外面被访问到
endif()
```

#### INTERFACE

可以理解成是对外提供接口，在库的CMakeLists.txt中定义，用于将库本身的源码目录自动包含，配和着target_include_directories；需要注意的是，INTERFACE意味着库的消费者（Consumers）需要，库的生产者（本身 Producer）不需要

```
target_include_directories(MathFunctions
        INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
        )
```

#### install

可以理解是指定 文件/库/可执行程序 等的最终输出地址，简单理解就是将一个文件拷贝到另一个地方的功能，install命名会配合着**DESTINATION**使用，表示拷贝的目的地

```
install(TARGETS Tutorial DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h" DESTINATION include)

cmake --install . --prefix "D:\Code\CMake-Tutorial\Step4" // 指定路径，这样子CMakeLists.txt中定义的install命令就会将文件拷贝到该目录下
```



#### enable_testing

打开测试开关，在当前目录及之后生效，会自动引入CTest模块（除非BUILD_TESTING option关闭），后续可以使用add_test进行测试

```
enable_testing()
```

#### add_test

添加CTest任务，指定任务名，编辑器，以及输入参数

```
add_test(NAME Runs COMMAND Tutorial 25)
```

#### set_tests_properties

设置CTest的属性，比如搭配**PASS_REGULAR_EXPRESSION**使用，即验证输出结果中是否能匹配到后续的字符串，匹配上就算成功，匹配不上就失败

```
set_tests_properties(Usage
  PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number"
  )
```

#### function & endfunction

CMake中定义函数，指定函数名，及参数

```
function(do_test target arg result)
  add_test(NAME Comp${arg} COMMAND ${target} ${arg})
  set_tests_properties(Comp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result}
  )
endfunction()
```



------



### 一些总结

#### 如何添加库

当前工程中添加一个库，需要三个步骤（Not Modern）：

1. 将库的目录包含进来                                              **add_subdirectory(MathFunctions)**
2. 链接库                                                                     **target_link_libraries(Tutorial PUBLIC MathFunctions)**
3. 将库的头文件添加到include搜索路径中              **target_include_directories(Tutorial PUBLIC "${PROJECT_SOURCE_DIR}/MathFunctions")**



*上面的方法不智能（不现代），更好的方法是在库（MathFunctions)对应的CMakeLists.txt中，使用INTERFACE声明，这样子别的项目在引用这个库的时候会自动包含该库的源码目录，而自身不会额外引用；省却了第1步和第3步，只需要链接好库即可*

1. ~~将库的目录包含进来                                              **add_subdirectory(MathFunctions)**~~
2. 链接库                                                                     **target_link_libraries(Tutorial PUBLIC MathFunctions)**
3. ~~将库的头文件添加到include搜索路径中              **target_include_directories(Tutorial PUBLIC "${PROJECT_SOURCE_DIR}/MathFunctions")**~~



#### 别名的访问

使用 **${}** 与 **“${}”** 的访问效果是等同的，如果是${}和字符串连用，就需要使用双引号括起来""



#### CMake生成并安装Release版

```
// 生成
cmake --build . --config Release 

// 安装
cmake --install . --prefix "D:\Code\CMake-Tutorial\Step4" // 指定路径，这样子CMakeLists.txt中定义的install命令就会将文件拷贝到该目录下
```



#### CMake中编写Test

分成三步：

1. enable_testing()

2. add_test(NAME XXX COMMAND YYY ZZZ)

3. 命令行执行**ctest -N**(查看一共有多少个test)，**ctest -VV**(执行test)，如果使用多配置编辑器生成的，如vs，还需要指定mode，比如**ctest -C Debug -VV**，或

   **ctest -C Release -VV**；执行命令的话需要在binary文件夹下执行，这里我理解是PROJECT_BINARY_DIR，即build目录

```
enable_testing()

# does the application run
add_test(NAME Runs COMMAND Tutorial 25)

# does the usage message work?
add_test(NAME Usage COMMAND Tutorial)
set_tests_properties(Usage
  PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number"
  )

# define a function to simplify adding testing
function(do_test target arg result)
  add_test(NAME Comp${arg} COMMAND ${target} ${arg})
  set_tests_properties(Comp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result}
  )
endfunction()

# do a bunch of result based tests
do_test(Tutorial 4 "4 is 2")
do_test(Tutorial 9 "9 is 3")
do_test(Tutorial 5 "5 is 2.236")
do_test(Tutorial 7 "7 is 2.645")
do_test(Tutorial 25 "25 is 5")
do_test(Tutorial -25 "-25 is (-nan|nan|0)")
do_test(Tutorial 0.0001 "0.0001 is 0.01")
```

```
PS D:\Code\CMake-Tutorial\Step4\build> ctest -N
Test project D:/Code/CMake-Tutorial/Step4/build
  Test #1: Runs
  Test #2: Usage
  Test #3: Comp4
  Test #4: Comp9
  Test #5: Comp5
  Test #6: Comp7
  Test #7: Comp25
  Test #8: Comp-25
  Test #9: Comp0.0001

Total Tests: 9
```

```
PS D:\Code\CMake-Tutorial\Step4\build> ctest -C Release -VV
UpdateCTestConfiguration  from :D:/Code/CMake-Tutorial/Step4/build/DartConfiguration.tcl
UpdateCTestConfiguration  from :D:/Code/CMake-Tutorial/Step4/build/DartConfiguration.tcl
Test project D:/Code/CMake-Tutorial/Step4/build
Constructing a list of tests
Done constructing a list of tests
Updating test list for fixtures
Added 0 tests to meet fixture requirements
Checking test dependency graph...
Checking test dependency graph end
test 1
    Start 1: Runs

1: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "25"
1: Test timeout computed to be: 10000000
1: Computing sqrt of 25 to be 13
1: Computing sqrt of 25 to be 7.46154
1: Computing sqrt of 25 to be 5.40603
1: Computing sqrt of 25 to be 5.01525
1: Computing sqrt of 25 to be 5.00002
1: Computing sqrt of 25 to be 5
1: Computing sqrt of 25 to be 5
1: Computing sqrt of 25 to be 5
1: Computing sqrt of 25 to be 5
1: Computing sqrt of 25 to be 5
1: The square root of 25 is 5
1/9 Test #1: Runs .............................   Passed    0.05 sec
test 2
    Start 2: Usage

2: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe
2: Test timeout computed to be: 10000000
2: D:/Code/CMake-Tutorial/Step4/build/Release/Tutorial.exe Version 1.0
2: Usage: D:/Code/CMake-Tutorial/Step4/build/Release/Tutorial.exe number
2/9 Test #2: Usage ............................   Passed    0.02 sec
test 3
    Start 3: Comp4

3: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "4"
3: Test timeout computed to be: 10000000
3: Computing sqrt of 4 to be 2.5
3: Computing sqrt of 4 to be 2.05
3: Computing sqrt of 4 to be 2.00061
3: Computing sqrt of 4 to be 2
3: Computing sqrt of 4 to be 2
3: Computing sqrt of 4 to be 2
3: Computing sqrt of 4 to be 2
3: Computing sqrt of 4 to be 2
3: Computing sqrt of 4 to be 2
3: Computing sqrt of 4 to be 2
3: The square root of 4 is 2
3/9 Test #3: Comp4 ............................   Passed    0.02 sec
test 4
    Start 4: Comp9

4: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "9"
4: Test timeout computed to be: 10000000
4: Computing sqrt of 9 to be 5
4: Computing sqrt of 9 to be 3.4
4: Computing sqrt of 9 to be 3.02353
4: Computing sqrt of 9 to be 3.00009
4: Computing sqrt of 9 to be 3
4: Computing sqrt of 9 to be 3
4: Computing sqrt of 9 to be 3
4: Computing sqrt of 9 to be 3
4: Computing sqrt of 9 to be 3
4: Computing sqrt of 9 to be 3
4: The square root of 9 is 3
4/9 Test #4: Comp9 ............................   Passed    0.02 sec
test 5
    Start 5: Comp5

5: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "5"
5: Test timeout computed to be: 10000000
5: Computing sqrt of 5 to be 3
5: Computing sqrt of 5 to be 2.33333
5: Computing sqrt of 5 to be 2.2381
5: Computing sqrt of 5 to be 2.23607
5: Computing sqrt of 5 to be 2.23607
5: Computing sqrt of 5 to be 2.23607
5: Computing sqrt of 5 to be 2.23607
5: Computing sqrt of 5 to be 2.23607
5: Computing sqrt of 5 to be 2.23607
5: Computing sqrt of 5 to be 2.23607
5: The square root of 5 is 2.23607
5/9 Test #5: Comp5 ............................   Passed    0.02 sec
test 6
    Start 6: Comp7

6: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "7"
6: Test timeout computed to be: 10000000
6: Computing sqrt of 7 to be 4
6: Computing sqrt of 7 to be 2.875
6: Computing sqrt of 7 to be 2.65489
6: Computing sqrt of 7 to be 2.64577
6: Computing sqrt of 7 to be 2.64575
6: Computing sqrt of 7 to be 2.64575
6: Computing sqrt of 7 to be 2.64575
6: Computing sqrt of 7 to be 2.64575
6: Computing sqrt of 7 to be 2.64575
6: Computing sqrt of 7 to be 2.64575
6: The square root of 7 is 2.64575
6/9 Test #6: Comp7 ............................   Passed    0.02 sec
test 7
    Start 7: Comp25

7: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "25"
7: Test timeout computed to be: 10000000
7: Computing sqrt of 25 to be 13
7: Computing sqrt of 25 to be 7.46154
7: Computing sqrt of 25 to be 5.40603
7: Computing sqrt of 25 to be 5.01525
7: Computing sqrt of 25 to be 5.00002
7: Computing sqrt of 25 to be 5
7: Computing sqrt of 25 to be 5
7: Computing sqrt of 25 to be 5
7: Computing sqrt of 25 to be 5
7: Computing sqrt of 25 to be 5
7: The square root of 25 is 5
7/9 Test #7: Comp25 ...........................   Passed    0.02 sec
test 8
    Start 8: Comp-25

8: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "-25"
8: Test timeout computed to be: 10000000
8: The square root of -25 is 0
8/9 Test #8: Comp-25 ..........................   Passed    0.02 sec
test 9
    Start 9: Comp0.0001

9: Test command: D:\Code\CMake-Tutorial\Step4\build\Release\Tutorial.exe "0.0001"
9: Test timeout computed to be: 10000000
9: Computing sqrt of 0.0001 to be 0.50005
9: Computing sqrt of 0.0001 to be 0.250125
9: Computing sqrt of 0.0001 to be 0.125262
9: Computing sqrt of 0.0001 to be 0.0630304
9: Computing sqrt of 0.0001 to be 0.0323084
9: Computing sqrt of 0.0001 to be 0.0177018
9: Computing sqrt of 0.0001 to be 0.0116755
9: Computing sqrt of 0.0001 to be 0.0101202
9: Computing sqrt of 0.0001 to be 0.0100007
9: Computing sqrt of 0.0001 to be 0.01
9: The square root of 0.0001 is 0.01
9/9 Test #9: Comp0.0001 .......................   Passed    0.02 sec

100% tests passed, 0 tests failed out of 9

Total Test time (real) =   0.23 sec
```

