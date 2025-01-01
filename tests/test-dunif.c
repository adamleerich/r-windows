#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h> // cmocka.h needs this
#include <cmocka.h>

#include "../src/nmath/dunif.c"

static void test_dunif()
{
    assert_double_equal(dunif(0, 0, 1, 0), 1, 0);
}

int main(int argc, char **argv)
{
    const struct CMUnitTest tests[] =
        {
            cmocka_unit_test(test_dunif),
        };

    return cmocka_run_group_tests(tests, NULL, NULL);
}
