$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'actionpack-cloudflare'
require 'action_pack/cloudflare'

ap_path = Gem::Specification.find_all_by_name('actionpack').first.full_gem_path
ap_test = File.join ap_path, 'test'
$LOAD_PATH.unshift(ap_test)
require 'abstract_unit'
