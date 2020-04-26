/**
 * @file fake_ti_bios.h
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

#include <ti/sysbios/BIOS.h>
#include "fff.h"
#ifdef __cplusplus
extern "C" {
#endif

DECLARE_FAKE_VOID_FUNC(BIOS_start);
DECLARE_FAKE_VOID_FUNC(BIOS_exit, Int);
#ifdef __cplusplus
}
#endif
