local M = {}

M.config = function ()
    -- NOTE handled in cmp
    -- imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
    vim.cmd [[
        inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
        imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
        snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
        snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
    ]]

    local ls = require('luasnip')


    ls.snippets = {
        all = {
            ls.parser.parse_snippet(
                'copyright',
                [[Copyright (C) Axel Dahlberg ]] .. os.date("%Y")
            )
        },
        lua = {
            ls.parser.parse_snippet(
            'req',
            [[local ${1} = require('$1')$0]]
            ),
        },
        python = {
            ls.parser.parse_snippet(
            't',
            [[@pytest.mark.parametrize('${1:arguments}', [
    (${1}),
])
def ${2:function}(${1}):
    $0]]
            ),
            ls.parser.parse_snippet(
            'd',
            [[def ${1:function}(${2:arguments}) -> ${3:return}:
    $0]]
            ),
            ls.parser.parse_snippet(
            'd"', [[def ${1:function}(${2:arguments}) -> ${3:return}:
    """${4:description}

    Args:
    ${5:$2}

    Returns:
    ${6:$3}
    """
    $0]]
            ),
            ls.parser.parse_snippet(
            'c',
            [[class ${1:class}(${2:inherit}):
    $0]]
            ),
            ls.parser.parse_snippet(
            'i',
            [[if ${1:condition}:
    $0]]
            ),
            ls.parser.parse_snippet(
            'f',
            [[for ${1:i} in ${2:iter}:
    $0]]
            ),
            ls.parser.parse_snippet(
            'r',
            [[raise ${1:Value}Error('${2:msg}')]]
            ),
            ls.parser.parse_snippet(
            'fr',
            [[from ${1:pkg} import ${2:module}]]
            ),
            ls.parser.parse_snippet(
            'im',
            [[import ${1:pkg}]]
            ),
            ls.parser.parse_snippet(
            '@p',
            [[@pytest.mark.parametrize('${1:arguments}', [
    $0
])]]
            ),
            ls.parser.parse_snippet(
            '@d', [[@dataclass
class ${1:class}:
    $0]]
            ),
            ls.parser.parse_snippet(
            '"', [["""$0
"""]]
            ),
            ls.parser.parse_snippet(
            'doc', [["""${1:description}

Args:
${2:args}

Returns:
${3:returns}
"""
@0]]
            ),
            ls.parser.parse_snippet(
            'setup', [[from setuptools import setup, find_packages
import pathlib

here = pathlib.Path(__file__).parent.resolve()

long_description = (here / 'README.md').read_text(encoding='utf-8')

setup(
name='${1:name}',
version='0.0.0',
description='${2:description}',
long_description=long_description,
long_description_content_type='text/markdown',
url='${3:https://github.com/AckslD/${1}}',
author='${4:Axel Dahlberg}',
author_email='${5:git@valleymnt.com}',
package_dir={'': 'src'},
packages=find_packages(where='src'),
python_requires='>=${6:3.9}, <4',
install_requires=[${7}],
)]]
            ),
        },
    }
end

return M
