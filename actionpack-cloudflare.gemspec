# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_pack/cloudflare/version'

Gem::Specification.new do |spec|
  spec.name          = 'actionpack-cloudflare'
  spec.version       = ActionPack::Cloudflare::VERSION
  spec.authors       = ['Ken Collins']
  spec.email         = ['ken@metaskills.net']
  spec.summary       = "Allow Rails request.remote_ip to defer to CloudFlare's connecting IP address."
  spec.description   = "Simple gem that extends Rails `request.remote_ip` to default to Cloudflare's `HTTP_CF_CONNECTING_IP` header."
  spec.homepage      = 'https://github.com/customink/actionpack-cloudflare'
  spec.license       = 'MIT'
  spec.metadata['allowed_push_host'] = '' if spec.respond_to?(:metadata)
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_runtime_dependency     'actionpack', '>= 3.2'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
end
