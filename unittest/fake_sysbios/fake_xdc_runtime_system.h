/**
 * @file fake_xdc_runtime_system.h
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

#include "fff.h"

#ifdef __cplusplus
extern "C" {
#endif

DECLARE_FAKE_VALUE_FUNC_VARARG(Int, System_printf, CString, ...);

#ifdef __cplusplus
}
#endif
