/**
 * @file fake_xdc_runtime_system.c
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2020-04-26
 * 
 * @copyright Copyright (c) 2020
 * 
 */
#include "fake_xdc_runtime_system.h"

DEFINE_FAKE_VALUE_FUNC_VARARG(Int, System_printf, CString, ...);
