#!/usr/bin/env python3
# C言語ソースプログラムのスタブ関数を生成するプログラム
import sys
import subprocess
import os
import re
import uuid
from clang.cindex import Index


def push_function_decl_node(node, func_node):
    '''
    func_nodeにFUNCTION_DECLのノードを追加する。
    この関数は再帰呼び出しされる。
    Parameters
    ========
    node        : translationunit by parsing source
    func_node   : list of nodes with FUNCTION_DECL
    '''
    if node.kind.name == 'FUNCTION_DECL':
        func_node += [node]
    for child in node.get_children():
        push_function_decl_node(child, func_node)


def get_function_decl_node(node):
    '''
    FUNCTION_DECLのノードのリストを取得する。

    Parameters
    ========
    node        : translationunit by parsing source

    Returns
    ========
    func_node   : list of nodes with FUNCTION_DECL
    '''
    func_node = []
    push_function_decl_node(node, func_node)
    return func_node


def filter_function_decl_node(func_node, func_list):
    '''
    関数リストと一致するノードを取り出す
    Paremeters
    =========
    func_node   : list of nodes with FUNCTION_DECL
    func_list   : list of functions

    Returns
    =========
    filterd_node
    '''
    filterd_node = [n for n in func_node if n.spelling in func_list]
    return filterd_node


def get_type_ref_name(node):
    '''
    関数の型を取得する。

    Parameters
    ========
    node        : translationunit by parsing source

    Returns
    ========
    node.result_type.spelling : 関数戻り値の型   
    '''
    return node.result_type.spelling


def cat_fff_void_func(node):
    fake = 'FAKE_VOID_FUNC'
    fake += '(' + node.spelling
    for child in node.get_children():
        fake += ', ' + child.type.spelling
    fake += ');'
    return fake


def cat_fff_value_func(node):
    fake = 'FAKE_VALUE_FUNC'
    fake += '(' + node.result_type.spelling + ', ' + node.spelling
    for child in node.get_children():
        fake += ', ' + child.type.spelling
    fake += ');'
    return fake


def cat_fff_reset_func(node):
    fake = 'RESET_FAKE'
    fake += '(' + node.spelling + ');'
    return fake


class PyCppUTest:
    '''
    CppUTestのTestHarnessを生成する
    '''
    CC = 'clang'
    NM = 'llvm-nm'
    CFLAGS = []
    INCPATH = []

    def get_external_refrence_function(self, srcfile):
        '''
        外部参照の関数名を抽出する
        Parameters
        ============
        srcfile     : string ソースファイル名

        Returns
        refs        : list of strings 関数名
        '''
        outfile = str(uuid.uuid4()) + '.o'
        cc_flags = ' '.join(self.CFLAGS)
        cc_inc = ' '.join(self.INCPATH)
        command = ' '.join(
            [self.CC, '-c', srcfile, '-o', outfile, cc_flags, cc_inc])
        proc = subprocess.Popen(command, shell=True)
        proc.communicate()
        command = ' '.join([self.NM, '-u', outfile])
        proc = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
        refs = []
        for line in proc.stdout:
            funcstr = line.decode()
            funcstr = re.sub('[uU] +', '', funcstr)
            funcstr = funcstr.strip()
            funcstr = re.sub('^_', '', funcstr)
            refs.append(funcstr)
        proc.communicate()
        os.remove(outfile)
        return refs

    def extract_source_file(self, srcfile):
        '''
        プリプロセス後のソースコードを取得する
        Parameters
        ========
        srcfile     : string    ソースコードファイル名

        Returns
        ========
        source_code : string    プリプロセス後のソースコード
        '''
        cc_flags = ' '.join(self.CFLAGS)
        cc_inc = ' '.join(self.INCPATH)
        command = ' '.join([self.CC, '-E', srcfile, cc_flags, cc_inc])
        proc = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
        source_code = ''
        for line in proc.stdout:
            s = line.decode()
            source_code += s
        proc.communicate()
        return source_code

    def get_function_declare(self, srcfile, filterList=None):
        '''
        ソースコードから関数宣言を取得する
        Parameters
        ==========
        srcfile     : string    ソースコードファイル名

        Returns
        ==========
        function_declares   : list of strings   関数宣言リスト
        '''
        code = self.extract_source_file(srcfile)
        index = Index.create()
        tu = index.parse(srcfile, unsaved_files=[(srcfile, code)])
        func_node = get_function_decl_node(tu.cursor)
        if filterList != None:
            func_node = filter_function_decl_node(func_node, filterList)
        function_declares = [
            ' '.join([get_type_ref_name(n), n.displayname]) for n in func_node]
        return function_declares

    def get_fake_function_define(self, srcfile, filterList=None):
        '''
        ソースコードからフェイク関数定義を生成する
        Parameters
        ==========
        srcfile     : string    ソースコードファイル名
        filterList  : string    生成する関数リスト
        Returns
        ==========
        fakes       : フェイク関数定義のリスト
        '''
        code = self.extract_source_file(srcfile)
        index = Index.create()
        tu = index.parse(srcfile, unsaved_files=[(srcfile, code)])
        func_node = get_function_decl_node(tu.cursor)
        if filterList != None:
            func_node = filter_function_decl_node(func_node, filterList)
        fakes = []
        for func in func_node:
            if func.result_type.spelling == 'void':
                fake = cat_fff_void_func(func)
            else:
                fake = cat_fff_value_func(func)
            fakes += [fake]
        return fakes

    def get_fake_reset_function_define(self, srcfile, filterList=None):
        '''
        ソースコードからフェイクリセット関数の定義を生成する
        Parameters
        ==========
        srcfile     : string    ソースコードファイル名
        filterList  : string    生成する関数リスト
        Returns
        ==========
        fakes       : フェイクリセット関数定義のリスト
        '''
        code = self.extract_source_file(srcfile)
        index = Index.create()
        tu = index.parse(srcfile, unsaved_files=[(srcfile, code)])
        func_node = get_function_decl_node(tu.cursor)
        if filterList != None:
            func_node = filter_function_decl_node(func_node, filterList)
        fakes = []
        for func in func_node:
            fakes += [cat_fff_reset_func(func)]
        return fakes

    def get_test_target_function(self, srcfile):
        '''
        ソースコードからテスト対象の関数リストを生成する
        Parameters
        =======
        srcfile     : string ソースコードファイル名

        Returns
        =======
        test_targets    : テスト対象関数名のリスト
        '''
        index = Index.create()
        tu = index.parse(srcfile)
        func_node = get_function_decl_node(tu.cursor)
        test_targets = [
            func.spelling for func in func_node if srcfile == func.location.file.name]
        return test_targets

    def add_cflags(self, cflags):
        '''
        コンパイルオプションを追加する
        Parameters
        ==========
        cflags      : str コンパイルオプション
        '''
        self.CFLAGS.append(cflags)

    def add_include_path(self, path):
        '''
        インクルードパスを追加する
        Parameters
        ==========
        path        : str インクルードパス
        '''
        self.INCPATH.append('-I' + path)

    def generate_test_harness(self, srcfile, outfile):
        ref_functions = self.get_external_refrence_function(srcfile)
        fff_functions = self.get_fake_function_define(srcfile, ref_functions)
        reset_functions = self.get_fake_reset_function_define(
            srcfile, ref_functions)
        test_targets = self.get_test_target_function(srcfile)

        with open(outfile, "w") as f:
            s = 'extern "C" {\n'
            s += '#include "{0}"\n'.format(srcfile)
            s += '}\n\n\n\n'
            s += '#include "CppUTest/TestHarness.h"\n'
            s += '#include "CppUTest/CommandLineTestRunner.h"\n'
            s += '#include "fff.h"\n'
            s += 'DEFINE_FFF_GLOBALS;\n'
            s += 'extern "C" {\n'
            for fake in fff_functions:
                s += fake + '\n'
            s += '\n'
            s += 'void reset_fake(void)\n'
            s += '{\n'
            for reset in reset_functions:
                s += '\t' + reset + '\n'
            s += '}\n\n'
            s += '}\n\n\n\n'
            testname = os.path.splitext(os.path.basename(srcfile))[0] + 'Test'
            s += 'TEST_GROUP({0})\n'.format(testname)
            s += '{\n'
            s += '\tvoid setup(){}\n'
            s += '\tvoid teardown(){}\n'
            s += '};\n'

            for test_case_name in test_targets:
                s += 'TEST({0},{1})\n'.format(testname, 'TestCase_' + test_case_name)
                s += '{\n\n'
                s += '}\n\n'

            s += 'int main(int argc, char **argv)\n{\n'
            s += '\treturn CommandLineTestRunner::RunAllTests(argc, argv);\n'
            s += '}\n'
            f.write(s)


if __name__ == '__main__':
    cpputest = PyCppUTest()
    cpputest.add_cflags('-Dxdc_target_types__="gnu/targets/std.h"')
    cpputest.add_cflags('-Dxdc_target_name__=Linux86_64')
    cpputest.add_cflags('-Dmain=test_target_main')
    cpputest.add_include_path('C:/ti/bios_6_75_02_00/packages')
    cpputest.add_include_path('C:/ti/ipc_3_50_03_05/packages')
    cpputest.add_include_path(
        'C:/ti/ccs1000/xdctools_3_61_00_16_core/packages')
    cpputest.generate_test_harness(sys.argv[1], sys.argv[2])
