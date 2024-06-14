# SPDX-FileCopyrightText: 2020 Efabless Corporation
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
#
# SPDX-License-Identifier: Apache-2.0

IP_ROOT?=$(PWD)/dependencies

EFABLESS_URL=git@github.com:efabless
OPENCIRCUITDESIGN_URL=git@github.com:RTimothyEdwards

# This project uses the follower amplifier from the samplehold repo
SAMPLEHOLD_IP=sky130_ef_ip__samplehold

# Use "make get_ip_blocks" to retrieve project dependencies

.PHONY: get_ip_blocks
get_ip_blocks: check_dependencies
	@if [ ! -d "$(IP_ROOT)/$(SAMPLEHOLD_IP)" ]; then \
		git clone --depth=1 \
			$(OPENCIRCUITDESIGN_URL)/$(SAMPLEHOLD_IP) \
			$(IP_ROOT)/$(SAMPLEHOLD_IP) ; \
	fi
	@echo "Done!"

.PHONY: check_dependencies
check_dependencies:
	@if [ ! -d "$(PWD)/dependencies" ]; then \
		mkdir $(PWD)/dependencies; \
	fi

