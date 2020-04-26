/**
 * @file testRunner.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2020-04-26
 * 
 * @copyright Copyright (c) 2020
 * 
 */
#include "CppUTest/CommandLineTestRunner.h"

int main(int argc, char *argv[])
{
    // CppUTest起動
    return CommandLineTestRunner::RunAllTests(argc, argv);
}
