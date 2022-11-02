-- Copyright (C) 2022. All rights reserved.
-- File name   : cpp.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : cpp snippet file


local ls = require('luasnip')
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require('luasnip.extras').lambda
local r = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require('luasnip.util.types')
local conds = require('luasnip.extras.expand_conditions')

local expand = vim.fn.expand
local strftime = vim.fn.strftime

local function copy(args)
    return args[1]
end

local function printf_expand(args, _, old_state)
    local nodes = {}
    if not old_state then
        old_state = {}
    end

    -- count placeholders in string
    local _, count = args[1][1]:gsub('%%', '')
    if count == 0 then
        return sn(nil, nodes)
    end

    for j = 1, count do
        local iNode
        if old_state and old_state[j] then
            iNode = i(j, old_state[j].old_text)
        else
            iNode = i(j, 'arg')
        end
        nodes[j * 2 - 1] = t(', ')
        nodes[j * 2] = iNode
        old_state[j] = iNode
    end

    local snip = sn(nil, nodes)
    snip.old_state = old_state
    return snip
end

return {
    -- [ File Header]
    -- hdr
    s('hdr', {
        t({'/*****************************************************', ''}),
        t( 'Copyright (C) '), t(strftime("%Y")), t({'. All rights reserved.', ''}),
        t( 'File name     : '), t(expand("%:t")), t({'', ''}),
        t( 'Version       : '), i(1, 'v1.0'), t({'', ''}),
        t( 'Author        : '), i(2, 'zhengqijun'), t({'', ''}),
        t( 'Date          : '), t(strftime("%Y-%m-%d")), t({'', ''}),
        t({'Function List :', ''}),
        t( 'Description   : '), i(3), t({'', ''}),
        t({'******************************************************/', ''}),
    }),

    -- [ Main ]
    -- main
    s('main', {
        t({'int main(int argc, const char *argv[]) {', '\t'}),
        i(0), t({'', '\t'}),
        t('return 0;'),
        t({'', '}'}),
    }),
    -- mainn
    s('mainn', {
        t({'int main(void) {', '\t'}),
        i(0), t({'', '\t'}),
        t('return 0;'),
        t({'', '}'}),
    }),

    -- [ Preprocessor ]
    -- inc
    s('inc', {
        t('#include <'), i(1, 'stdio.h'), t('>'),
    }),
    -- Inc
    s('Inc', {
        t('#include "'), i(1, 'stdio.h'), t('"'),
    }),
    -- incc
    s('incc', {
        t('#include <'), i(1, 'iostream'), t('>'),
    }),
    -- nocxx
    s('nocxx', {
        t({'#ifdef __cplusplus', ''}),
        t({'extern "C" {', ''}),
        t({'#endif', ''}),
        t({'', ''}),
        i(0), t({'', ''}),
        t({'', ''}),
        t({'#ifdef __cplusplus', ''}),
        t({'}  /* extern "C" */', ''}),
        t({'#endif', ''}),
    }),

    -- [ Control Statements ]
    -- if
    s('if', {
        t('if ('), i(1, 'true'), t({') {', '\t'}),
        i(2), t({'', ''}),
        t('}'),
    }),
    -- el
    s('el', {
        t({'else {', '\t'}),
        i(1), t({'', ''}),
        t('}'),
    }),
    -- elif
    s('elif', {
        t('else if ('), i(1, 'true'), t({') {', '\t'}),
        i(2), t({'', ''}),
        t('}'),
    }),
    -- ife
    s('ife', {
        t('if ('), i(1, 'true'), t({') {', '\t'}),
        i(2), t({'', ''}),
        t({'} else {', '\t'}),
        i(3), t({'', ''}),
        t('}'),
    }),
    -- ifi
    s('ifi', {
        t('if ('), i(1, 'true'), t(') '), i(2), t(';'),
    }),
    -- t
    s('t', {
        i(1, 'true'), t(' ? '), i(2, 'a'), t(' : '), i(3, 'b'),
    }),
    -- switch
    s('switch', {
        t('switch ('), i(1, 'true'), t({') {', ''}),
        t('case '), i(2, 'true'), t({':', '\t'}),
        i(3), t({'', '\t'}),
        t({'break;', ''}),
        t({'default:', '\t'}),
        i(4), t({'', ''}),
        t('}'),
    }),
    -- case
    s('case', {
        t('case '), i(1, 'true'), t({':', '\t'}),
        i(2), t({'', '\t'}),
        t('break;'),
    }),

    -- [ Loops ]
    -- for
    s('for', {
        t('for (int '), i(2, 'i'), t(' = 0; '), f(copy, 2), t(' < '), i(1, '10'), t('; '), i(3, '++'), f(copy, 2), t({') {', '\t'}),
        i(4), t({'', ''}),
        t('}'),
    }),
    -- wh
    s('wh', {
        t('while ('), i(1, 'true'), t({') {', '\t'}),
        i(2), t({'', ''}),
        t('}'),
    }),
    -- do
    s('do', {
        t({'do {', '\t'}),
        i(1), t({'', ''}),
        t('} while ('), i(2, 'true'), t(');'),
    }),

    -- [ Types ]
    -- td
    s('td', {
        t('typedef '), i(1, 'int'), t(' '), i(2, 'Type'), t(';'),
    }),

    -- [ Nothing ]
    -- don
    s('don', {
        t('// do nothing'),
    }),

    -- [ STL Collections ]
    -- arr
    s('arr', {
        t('std::array<'), i(1, 'int'), t('> '), i(2, 'arr'), t(';'),
    }),
    -- str
    s('str', {
        t('std::string '), i(1, 'str'), t(';'),
    }),
    -- vec
    s('vec', {
        t('std::vector<'), i(1, 'int'), t('> '), i(2, 'vec'), t(';'),
    }),
    -- deque
    s('deque', {
        t('std::deque<'), i(1, 'int'), t('> '), i(2, 'deq'), t(';'),
    }),
    -- flist
    s('flist', {
        t('std::forward_list<'), i(1, 'int'), t('> '), i(2, 'fl'), t(';'),
    }),
    -- list
    s('list', {
        t('std::list<'), i(1, 'int'), t('> '), i(2, 'l'), t(';'),
    }),
    -- set
    s('set', {
        t('std::set<'), i(1, 'int'), t('> '), i(2, 's'), t(';'),
    }),
    -- map
    s('map', {
        t('std::map<'), i(1, 'int'), t('> '), i(2, 'm'), t(';'),
    }),
    -- mset
    s('mset', {
        t('std::multiset<'), i(1, 'int'), t('> '), i(2, 's'), t(';'),
    }),
    -- mmap
    s('mmap', {
        t('std::multimap<'), i(1, 'int'), t('> '), i(2, 'm'), t(';'),
    }),
    -- uset
    s('uset', {
        t('std::unordered_set<'), i(1, 'int'), t('> '), i(2, 's'), t(';'),
    }),
    -- umap
    s('umap', {
        t('std::unordered_map<'), i(1, 'int'), t('> '), i(2, 'm'), t(';'),
    }),
    -- unset
    s('unset', {
        t('std::unordered_multiset<'), i(1, 'int'), t('> '), i(2, 's'), t(';'),
    }),
    -- unmap
    s('unmap', {
        t('std::unordered_multimap<'), i(1, 'int'), t('> '), i(2, 'm'), t(';'),
    }),
    -- stack
    s('stack', {
        t('std::stack<'), i(1, 'int'), t('> '), i(2, 's'), t(';'),
    }),
    -- queue
    s('queue', {
        t('std::queue<'), i(1, 'int'), t('> '), i(2, 'q'), t(';'),
    }),
    -- pqueue
    s('pqueue', {
        t('std::priority_queue<'), i(1, 'int'), t('> '), i(2, 'q'), t(';'),
    }),

    -- [ STL smart pointers ]
    -- msp
    s('msp', {
        t('std::shared_ptr<'), i(1, 'int'), t('> '), i(2, 'sp'), t(' = std::make_shared<'), f(copy, 1), t('>('), i(3, 'ptr'), t(');'),
    }),
    -- amsp
    s('amsp', {
        t('auto '), i(1, 'sp'), t(' = std::make_shared<'), i(2, 'int'), t('>('), i(3, 'ptr'), t(');'),
    }),
    -- mup
    s('mup', {
        t('std::unique_ptr<'), i(1, 'int'), t('> '), i(2, 'sp'), t(' = std::make_unique<'), f(copy, 1), t('>('), i(3, 'ptr'), t(');'),
    }),
    -- mup
    s('amup', {
        t('auto '), i(1, 'sp'), t(' = std::make_unique<'), i(2, 'int'), t('>('), i(3, 'ptr'), t(');'),
    }),

    -- [ Iterator ]
    -- fore
    s('fore', {
        t('for ('), i(1, 'auto'), t(' '), i(2, 'it'), t(' : '), i(3, 'vec'), t({') {', '\t'}),
        i(4), t({'', ''}),
        t('}'),
    }),
    -- iter
    s('iter', {
        t('for ('), i(1, 'std::vector'), t('<'), i(2, 'int'), t('>::'), i(3, 'const_iterator'), t(' '),
        i(4, 'i'), t(' = '), i(5, 'vec'), t('.begin(); '),
        f(copy, 4), t(' != '), f(copy, 5), t('.end(); ++'), f(copy, 4), t({') {', '\t'}),
        i(6), t({'', ''}),
        t('}'),
    }),
    -- itera
    s('itera', {
        t('for (auto '), i(1, 'it'), t(' = '), i(2, 'vec'), t('.begin(); '),
        f(copy, 1), t(' != '), f(copy, 2), t('.end(); ++'), f(copy, 1), t({') {', '\t'}),
        i(3, 'std::cout << ', f(copy, 1), ' << std::endl;'), t({'', ''}),
        t('}'),
    }),

    -- [ Lambda ]
    -- ld
    s('ld', {
        t('['), i(1), t(']('), i(2), t('){'), i(3), t('};'),
    }),
    -- lld
    s('lld', {
        t('['), i(1), t('] ('), i(2), t({') {', '\t'}),
        i(3), t({'', ''}),
        t('};'),
    }),

    -- [ Template ]
    -- template
    s('template', {
        t('template <typename '), i(1, 'T'), t('>'),
    }),

    -- [ Access Modifiers ]
    -- pri
    s('pri', {
        t('private'),
    }),
    -- pro
    s('pro', {
        t('protected'),
    }),
    -- pub
    s('pub', {
        t('public'),
    }),
    -- fri
    s('fri', {
        t('fri'),
    }),
    -- mu
    s('mu', {
        t('mutable'),
    }),

    -- [ Output ]
    -- hello
    s('hello', {
        t('std::cout << "Hello World!" << std::endl;'),
    }),
    -- printf
    s('printf', {
        t('printf("'), i(1, 'Hello'), t('"'), d(2, printf_expand, 1), t(');'),
    }),
    -- cin
    s('cin', {
        t('std::cin >> '), i(1, 'var'), t(';'),
    }),
    -- cout
    s('cout', {
        t('std::cout << "'), i(1, 'Hello'), t('" << std::endl;'),
    }),
    -- endl
    s('endl', {
        t('std::cout << std::endl;'),
    }),
    -- ci
    s('ci', {
        t('std::cin'),
    }),
    -- co
    s('co', {
        t('std::cout'),
    }),
    -- en
    s('en', {
        t('std::endl'),
    }),

    -- [ Casts ]
    -- sca
    s('sca', {
        t('static_cast<'), i(1, 'int'), t('>('), i(2, 'var'), t(')'),
    }),
    -- dca
    s('dca', {
        t('dynamic_cast<'), i(1, 'int'), t('>('), i(2, 'var'), t(')'),
    }),
    -- rca
    s('rca', {
        t('reinterpret_cast<'), i(1, 'int'), t('>('), i(2, 'var'), t(')'),
    }),
    -- cca
    s('cca', {
        t('const_cast<'), i(1, 'int'), t('>('), i(2, 'var'), t(')'),
    }),

    -- [ Class ]
    -- cl
    s('cl', {
        t('class '), i(1, 'name'), t({' {', ''}),
        t({' public:', '\t'}),
        f(copy, 1), t('('), i(2), t({');', '\t'}),
        t('virtual ~'), f(copy, 1), t({'();', ''}),
        t({'', ''}),
        t({' private:', '\t'}),
        i(3, 'int'), t(' '), i(4, 'm_var'), t({';', ''}),
        t({'};', ''}),
    }),

    -- [ Struct ]
    -- st
    s('st', {
        t('struct '), i(1, 'name'), t({' {', '\t'}),
        i(2, 'int'), t(' '), i(3, 'm_var'), t({';', ''}),
        t({'};', ''}),
    }),

    -- [ Function ]
    -- func
    s('func', {
        i(1, 'void'), t(' '), i(2, 'func'), t('('), i(3, 'void'), t({') {', '\t'}),
        i(4),
        t({'', '}'}),
    }),

    -- [ Namespace ]
    -- ns
    s('ns', {
        t('namespace '), i(1, 'filename'), t({' {', '\t'}),
        i(0), t({'', ''}),
        t('}  // namespace'),
    }),

    -- [ Compilation ]
    -- cpp
    s('cpp', {
        t({'#ifndef __cplusplus', ''}),
        t({'#   error ERROR: This file requires C++ compilation(use a .cpp suffix)', ''}),
        t({'#endif', ''}),
    }),

    -- [ EOF ]
    -- EOF
    s('EOF', {
        i(0), t({'', ''}),
        t({'/* EOF */', ''}),
    }),

    -- [ Comment ]
    -- iauto
    s('iauto', {
        t({'/**', ''}),
        t( '* Copyright @ '), i(1, '2020'), t(' - '), i(2, '2022'), t({' IAUTO Software(Shanghai) Co., Ltd.', ''}),
        t({'* All Rights Reserved.', ''}),
        t({'*', ''}),
        t({'* Redistribution and use in source and binary forms, with or without', ''}),
        t({'* modification, are NOT permitted except as agreed by', ''}),
        t({'* IAUTO Software(Shanghai) Co., Ltd.', ''}),
        t({'*', ''}),
        t({'* Unless required by applicable law or agreed to in writing, software', ''}),
        t({'* distributed under the License is distributed on an "AS IS" BASIS,', ''}),
        t({'* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.', ''}),
        t({'*/', ''}),
    }),
}

-- EOF

