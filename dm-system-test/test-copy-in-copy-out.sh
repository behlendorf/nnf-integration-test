#!/bin/bash

# Copyright 2024 Hewlett Packard Enterprise Development LP
# Other additional copyright holders may be indicated within.
#
# The entirety of this work is licensed under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
#
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Run all of the copy-in-copy-out tests for all filesystems

set -e

pushd copy-in-copy-out

FS_TYPE=gfs2 ./copy-in-copy-out.bats
FS_TYPE=xfs ./copy-in-copy-out.bats
FS_TYPE=lustre ./copy-in-copy-out.bats

# Run the same with copy offload
FS_TYPE=gfs2 COPY_OFFLOAD=y ./copy-in-copy-out.bats
FS_TYPE=lustre COPY_OFFLOAD=y ./copy-in-copy-out.bats

popd