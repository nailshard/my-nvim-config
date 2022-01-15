local M = {}

M.config = function()
    require'snippets'.use_suggested_mappings()

    local snippets = require'snippets'
    local U = require'snippets.utils'
    snippets.snippets = {
        lua = {
            req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']];
            func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]];
            ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]];
            -- Match the indentation of the current line for newlines.
            ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
$0
end]];
        },
        python = {
            d = U.match_indentation [[
def ${1:function}(${2:arguments}) -> ${3:return}:
$0

]],
            t = U.match_indentation [[
@pytest.mark.parametrize('${1:arguments}', [
(${1}),
])
def ${2:function}(${1}):
$0

]],
            ['d"'] = U.match_indentation [[
def ${1:function}(${2:arguments}) -> ${3:return}:
"""${4:description}

Args:
${5:$2}

Returns:
${6:$3}
"""]],
            c = U.match_indentation [[
class ${1:class}(${2:inherit}):
$0]],
            i = [[
if ${1:condition}:
$0]],
            f = [[
for ${1:i} in ${2:iter}:
$0]],
            r = [[raise ${1:Value}Error('${2:msg}')]],
            fr = [[from ${1:pkg} import ${2:module}]],
            im = [[import ${1:pkg}]],
            ['@p'] = U.match_indentation [[
@pytest.mark.parametrize('${1:arguments}', [
$0
])]],
            ['@d'] = U.match_indentation [[
@dataclass
class ${1:class}:
$0

]],
            ['"'] = U.match_indentation [[
"""$0
"""]],
            doc = U.match_indentation [[
"""${1:description}

Args:
${2:args}

Returns:
${3:returns}
"""]],
            setup = U.match_indentation [[
from setuptools import setup, find_packages
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
)]],
        },
        _global = {
            -- If you aren't inside of a comment, make the line a comment.
            copyright = U.force_comment [[Copyright (C) Axel Dahlberg ${=os.date("%Y")}]];
        },
    }
end

return M
