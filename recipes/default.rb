#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Author:: Gerhard Lazu (<gerhard@lazu.co.uk>)
# Copyright 2010-2011, Gerhard Lazu
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

include_recipe "mongodb::apt"

# There are 3 server types:
# * mongod - main db server
# * mongos - sharding router
# * mongoc - config server
#
# include_recipe "mongodb::#{node[:mongodb][:server_type]}"
