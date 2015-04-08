require 'bundler'
Bundler.require

ENV['KEY_POOL'] = '[{"keyId":"sample_v1","secret":"development_secret","acceptOnly":0}]'
ENV['SAMPLE_KEYID'] = 'sample'

CredentialScope = 'example/credential/scope'
AuthOptions = {}

require_relative('your_awesome_app')
require_relative('escher/rack_middleware')
