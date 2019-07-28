# Iptables Insert Before Logging
[heading__title]:
  #iptables-insert-before-logging
  "&#x2B06; Top of this page"


[`iptables-insert-before-logging.sh`][iptables_insert_before_logging__master__source_code], contains a function inserts rules prior to logging rules or appends if no logging chain jumps where found.


> The following covers how to install this branch as a submodule within your own project, and parameters that `iptables-insert-before-logging.sh` currently responds to.


## [![Byte size of iptables-insert-before-logging.sh][badge__master__iptables_insert_before_logging__source_code]][iptables_insert_before_logging__master__source_code] [![Open Issues][badge__issues__iptables_insert_before_logging]][issues__iptables_insert_before_logging] [![Open Pull Requests][badge__pull_requests__iptables_insert_before_logging]][pull_requests__iptables_insert_before_logging] [![Latest commits][badge__commits__iptables_insert_before_logging__master]][commits__iptables_insert_before_logging__master]



------


#### Table of Contents


- [&#x2B06; Top of ReadMe File][heading__title]

- [:zap: Quick Start][heading__quick_start]

  - [:memo: Edit Your ReadMe File][heading__edit_your_readme_file]
  - [:shell: Example Usage][heading__example_usage]
  - [:floppy_disk: Commit and Push][heading__commit_and_push]

- [:scroll: API][heading__api]

- [:copyright: License][heading__license]


------



## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; ...well as quick as it may get with things like this"


**Bash Variables**


```Bash
_module_https_url='https://github.com/network-utilities/iptables-insert-before-logging.git'
_module_relative_path='modules/iptables-insert-before-logging'
```


**Git Commands**


```Bash
cd "<your-git-project-path>"

git checkout master
git submodule add -b master --name iptables-insert-before-logging "${_module_https_url}" "${_module_relative_path}"
```


### Edit Your ReadMe File
[heading__edit_your_readme_file]:
  #edit-your-readme-file
  "&#x1F4DD; Suggested additions so everyone has a good time with submodules"


Suggested additions so everyone has a good time with submodules


```MarkDown
Clone with the following to avoid incomplete downloads


    git clone --recurse-submodules <url-for-your-project>


Update/upgrade submodules via


    git submodule update --init --recursive --merge
```


### Example Usage
[heading__example_usage]:
  #example-usage
  "&#x1F41A; Example of sourcing and utilize `iptables_insert_before_logging` features"


Example of sourcing and utilize `iptables_insert_before_logging` features


**`example-usage.sh`**


```Bash
#!/usr/bin/env bash


## Find true directory this script resides in
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"


## Source module code within this script
source "${__DIR__}/modules/iptables-insert-before-logging/iptables-insert-before-logging.sh"

iptables -N some_chain
iptables_insert_before_logging -A OUTPUT -p tcp -j some_chain
```


**Test that things work!**


### Commit and Push
[heading__commit_and_push]:
  #commit-and-push
  "&#x1F4BE; And congratulate yourself on not having to write something similar!"



```Bash
git add .gitmodules
git add modules/iptables-insert-before-logging
git add README.md


git commit -F- <<'EOF'
:heavy_plus_sign: Adds network-utilities/iptables-insert-before-logging#1 submodule


**Edits**


- `README.md` file, documentation updates for submodules


**Additions**

- `.gitmodules` file, tracks other Git repository code utilized by this project

- `modules/iptables-insert-before-logging` submodule, Git tracked dependency
EOF


git push origin master
```


**:tada: Excellent :tada:** your repository is now ready to begin unitizing code from this project!


___


## Iptables Insert Before Logging API
[heading__api]:
  #iptables-insert-before-logging-api
  "&#x1F4DC; The arguments that `iptables_insert_before_logging` understands"


Inserts iptables rules prior to any logging jumps, or append if no logging rules where defined.


| Param | Type |  | Description |
|---|---|---|---|
| `$@` | list | **required** | iptables rules to insert |


**Returns: `boolean`**, exit status of inserting iptables rules


**Throws** `Parameter_Error: ipv4_range_from_address  not provided any arguments`, arguments are not defined


**Example:**

```Bash
iptables_insert_before_logging '-A' 'OUTPUT' '-p' 'tcp' '-j' 'some_chain'
#> iptables -I 5 OUTPUT -p tcp -j some_chain
```


___


## License
[heading__license]:
  #license
  "&#x00A9; Legal bits of Open Source software"


```
Iptables Insert Before Logging submodule quick start documentation
Copyright (C) 2019  S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation; version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
by `jesin`
on
```



[badge__travis_ci__iptables_insert_before_logging]:
  https://img.shields.io/travis/network-utilities/iptables-insert-before-logging/example.svg

[travis_ci__iptables_insert_before_logging]:
  https://travis-ci.com/network-utilities/iptables-insert-before-logging
  "&#x1F6E0; Automated tests and build logs"


[badge__commits__iptables_insert_before_logging__master]:
  https://img.shields.io/github/last-commit/network-utilities/iptables-insert-before-logging/master.svg

[commits__iptables_insert_before_logging__master]:
  https://github.com/network-utilities/iptables-insert-before-logging/commits/master
  "&#x1F4DD; History of changes on this branch"


[iptables_insert_before_logging__community]:
  https://github.com/network-utilities/iptables-insert-before-logging/community
  "&#x1F331; Dedicated to functioning code"


[iptables_insert_before_logging__example_branch]:
  https://github.com/network-utilities/iptables-insert-before-logging/tree/example
  "If it lurches, it lives"


[badge__issues__iptables_insert_before_logging]:
  https://img.shields.io/github/issues/network-utilities/iptables-insert-before-logging.svg

[issues__iptables_insert_before_logging]:
  https://github.com/network-utilities/iptables-insert-before-logging/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."


[badge__pull_requests__iptables_insert_before_logging]:
  https://img.shields.io/github/issues-pr/network-utilities/iptables-insert-before-logging.svg

[pull_requests__iptables_insert_before_logging]:
  https://github.com/network-utilities/iptables-insert-before-logging/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"


[badge__master__iptables_insert_before_logging__source_code]:
  https://img.shields.io/github/size/network-utilities/iptables-insert-before-logging/iptables-insert-before-logging.sh.svg?label=iptables-insert-before-logging.sh

[iptables_insert_before_logging__master__source_code]:
  https://github.com/network-utilities/iptables-insert-before-logging/blob/master/iptables-insert-before-logging.sh
  "&#x2328; Project source code!"
