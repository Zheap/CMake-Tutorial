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

使用 **${}** 与 **“${}”** 的访问效果是等同的
