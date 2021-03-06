#
# Cookbook Name:: keystone
# Resource:: service
#
# Copyright 2012, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :create, :delete

# In earlier versions of Chef the LWRP DSL doesn't support specifying
# a default action, so you need to drop into Ruby.
def initialize(*args)
  super
  @action = :create
end

attribute :auth_protocol, :kind_of => String, :equal_to => [ "http", "https" ], :required => true
attribute :auth_host, :kind_of => String, :required => true
attribute :auth_port, :kind_of => String, :required => true
attribute :api_ver, :kind_of => String, :default => "/v2.0", :required => true
attribute :auth_token, :kind_of => String, :required => true
attribute :service_type, :kind_of => String, :equal_to => [ "image", "identity", "compute", "storage", "network", "ec2", "volume", "object-store", "metering" ], :required => true
attribute :service_name, :kind_of => String, :required => true
attribute :service_description, :kind_of => String, :required => true
