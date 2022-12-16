
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <stdint.h>
#include <cmocka.h>
#include <string.h>
#include "triangle.h"

static int setup(void **state)
{
    (void) state; /* unused */

    
    return 0;
}

static void test_main(void **state)
{
    (void) state; /* unused */

    // ARRANGE
	// uint16_t status = 0;

    // ASSERT
    assert_int_equal(TypeOfTriangle(3, 4, -8), -1);
    // ASSERT
    assert_int_equal(TypeOfTriangle(10, 20, 30), 0);
    // ASSERT
    assert_int_equal(TypeOfTriangle(-10, 20, 30), -1);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test_setup_teardown(test_main, setup, NULL)
    };

    return cmocka_run_group_tests(tests, NULL, NULL);
}