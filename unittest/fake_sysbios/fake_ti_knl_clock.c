/**
 * @file fake_ti_knl_clock.c
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2020-04-26
 * 
 * @copyright Copyright (c) 2020
 * 
 */
//#define FFF_GCC_FUNCTION_ATTRIBUTES __attribute__((weak))
#include "fake_ti_knl_clock.h"

DEFINE_FAKE_VOID_FUNC(ti_sysbios_knl_Clock_Params__init__S, xdc_Ptr, const xdc_Void *, xdc_SizeT, xdc_SizeT);
DEFINE_FAKE_VALUE_FUNC(Clock_Handle, Clock_create, Clock_FuncPtr, UInt, const Clock_Params*, Error_Block*);
DEFINE_FAKE_VOID_FUNC(Clock_start, Clock_Handle);
DEFINE_FAKE_VALUE_FUNC(UInt32, Clock_getTicks);
