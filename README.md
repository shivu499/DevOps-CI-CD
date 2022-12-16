# gcc compiler from https://sourceforge.net/projects/mingw/

## run the below code

##generate build,package and unit test
make

##generate PC lint results
cpplint --extensions=h,c --output=junit source\triangle.c source\triangle.h 2> pc-lint.xml

