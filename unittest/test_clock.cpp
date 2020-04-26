/**
 * @file test_clock.c
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2020-04-26
 * 
 * @copyright Copyright (c) 2020
 * 
 */
#include "CppUTest/CommandLineTestRunner.h"
#include "CppUTest/TestHarness.h"
#include "fff.h"

#include "fake_ti_knl_clock.h"
#include "fake_xdc_runtime_system.h"

DEFINE_FFF_GLOBALS;

extern "C"
{
    Int main_test_target(void);
    Void clk0Fxn(UArg arg0);
    Void clk1Fxn(UArg arg0);
    char stringbuff[64][256];
    int gstringcount;

    Int mySystemPrintf(CString format, va_list ap)
    {
        if (xdc_runtime_System_printf__E_fake.return_val < 0 )
        {
            return xdc_runtime_System_printf__E_fake.return_val;
        }
        if (gstringcount >= 64)
        {
            return 0;
        }
        return vsprintf(stringbuff[gstringcount++], format, ap);
    }
}


TEST_GROUP(CLOCK_TEST)
{

    void setup()
    {
        for(int i = 0; i < 64; i++ ) 
            stringbuff[i][0] = '\0';
        gstringcount = 0;
        RESET_FAKE(ti_sysbios_knl_Clock_create);
        RESET_FAKE(ti_sysbios_knl_Clock_getTicks__E);

        FFF_RESET_HISTORY();
    }

    void teardown()
    {

    }
    void checkFxnClockCreateParameter(Clock_FuncPtr fxn, int callcount)
    {
        FUNCTIONPOINTERS_EQUAL(fxn, ti_sysbios_knl_Clock_create_fake.arg0_history[callcount]);
    }
    void checkTimeoutClockCreateParameter(UInt timeout, int callcount)
    {
        LONGS_EQUAL(timeout, ti_sysbios_knl_Clock_create_fake.arg1_history[callcount]);
    }
    void checkCallCountClock_getTicks(int count)
    {
        LONGS_EQUAL(count, ti_sysbios_knl_Clock_getTicks__E_fake.call_count);
    }
    void checkString(const char *str, int callcount)
    {
        STRCMP_EQUAL(str, stringbuff[callcount]);
    }

};

TEST(CLOCK_TEST, Test_Main)
{
    LONGS_EQUAL(0, main_test_target());
    checkFxnClockCreateParameter(clk0Fxn, 0);
    checkTimeoutClockCreateParameter(5, 0);
    checkFxnClockCreateParameter(clk1Fxn, 1);
    checkTimeoutClockCreateParameter(11, 1);
}

TEST(CLOCK_TEST, clk0FxnTest)
{
    ti_sysbios_knl_Clock_getTicks__E_fake.return_val = (UInt)5555;
    xdc_runtime_System_printf__E_fake.custom_fake = mySystemPrintf;
    clk0Fxn(0);
    checkCallCountClock_getTicks(1);
    checkString("System time in clk0Fxn = 5555\n", 0);
}


TEST(CLOCK_TEST, clk1FxnTest)
{
    ti_sysbios_knl_Clock_getTicks__E_fake.return_val = (UInt)7722;
    xdc_runtime_System_printf__E_fake.custom_fake = mySystemPrintf;
    clk1Fxn(0);
    checkCallCountClock_getTicks(1);
    checkString("System time in clk1Fxn = 7722\n", 0);
    checkString("Calling BIOS_exit() from clk1Fxn\n", 1);
}