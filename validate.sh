#!/bin/bash
# Copyright 2020 Coinbase, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Ensure specification is valid
swagger-cli validate api.json;

# Ensure specification includes all changes
./codegen.sh api_test.json;

DIFF_RESULT="$(diff api.json api_test.json)"
rm api_test.json;

if [ "${DIFF_RESULT}" != 0 ]; then
  echo ERROR: difference detected between api.json and YAML files
  exit 1
fi
