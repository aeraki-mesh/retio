# Tencent is pleased to support the open source community by making DevOps
# available.
#
# Copyright (C) 2014 THL A29 Limited, a Tencent company. All rights reserved.

# Licensed under the BSD 3-Clause License (the "License"); you may not use this
# file except in compliance with the License. You may obtain a copy of the
# License at
#
# https://opensource.org/licenses/BSD-3-Clause
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.


# ==============================================================================
# Help

define HELPTEXT
Usage: make <OPTIONS> ... <TARGETS>

Targets:
    build              Build source code for host platform.
    build.all          Build source code for all platforms.
                       Best done in the cross build container
                       due to cross compiler dependencies.
    lint               Check syntax and styling of go sources.
    clean              Remove all files that are created by building.
    help               Show this help info.

Options:
    DEBUG        Whether to generate debug symbols. Default is 0.
    PLATFORMS    The platform to build. Default is host platform and arch.
    VERSION      The version information compiled into binaries.
                 The default is obtained from git.
    V            Set to 1 enable verbose build. Default is 0.

endef
export HELPTEXT

