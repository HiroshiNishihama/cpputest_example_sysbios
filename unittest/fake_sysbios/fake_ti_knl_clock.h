/**
 * @file fake_ti_knl_clock.h
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2020-04-26
 * 
 * @copyright Copyright (c) 2020
 * 
 */
#pragma once

#include <xdc/std.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Error.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include "fff.h"

#ifdef __cplusplus
extern "C" {
#endif

/* call by Clock_Params_init() */
DECLARE_FAKE_VOID_FUNC(ti_sysbios_knl_Clock_Params__init__S, xdc_Ptr, const xdc_Void *, xdc_SizeT, xdc_SizeT);
DECLARE_FAKE_VALUE_FUNC(Clock_Handle, Clock_create, Clock_FuncPtr, UInt, const Clock_Params*, Error_Block*);
DECLARE_FAKE_VOID_FUNC(Clock_start, Clock_Handle);
DECLARE_FAKE_VALUE_FUNC(UInt32, Clock_getTicks);

#ifdef __cplusplus
}
#endif
