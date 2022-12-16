C_INCLUDE_PATH :=C:\cmocka\include
LD_LIBRARY_PATH :=C:\cmocka\lib
CC := gcc
GCOV = C:\Tools\MinGW\v4.8.1-1.0.0\bin\gcov
C_FLAGS := -Wall -Wextra -Wpedantic -std=c99 -g -O2 -fprofile-arcs -ftest-coverage

UT_TARGET := 	triangle
UT_SOURCE := 	./source/triangle.c	\
				./test/test_main.c

UT_INCLUDES += 	-I$(C_INCLUDE_PATH) \
				-I./source

LD_FLAGS := -L$(LD_LIBRARY_PATH)

# do not modify the following contents
SOURCE_NO_PATH = $(notdir $(UT_SOURCE))
UT_OBJ := $(SOURCE_NO_PATH:%.c=%.o)

.PHONY: all
all: run_test coverage

vpath %.c $(sort $(dir $(UT_SOURCE)))

$(UT_OBJ): %.o: %.c
	$(CC) -c $(C_FLAGS) $(UT_INCLUDES) -o $@ $<

test_$(UT_TARGET): $(UT_OBJ)
	$(CC) $(C_FLAGS) $^ -o $@ $(LD_FLAGS) -lcmocka

.PHONY: run_test
run_test: test_$(UT_TARGET)
	./$^

$(UT_TARGET).gcda: run_test
$(UT_TARGET).gcno: run_test

.PHONY: coverage
coverage: $(UT_TARGET).gcda $(UT_TARGET).gcno
	$(GCOV) -bcf $(UT_TARGET).c	

.PHONY: clean
clean:
	$(RM) *.o *.gcda *.gcno *.gcov test_$(UT_TARGET)