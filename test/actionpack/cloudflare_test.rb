require 'test_helper'

class CloudflareTest < ActiveSupport::TestCase

  test '#remote_ip - passes a few standard rails tests' do
    request = stub_request 'REMOTE_ADDR' => '1.2.3.4'
    assert_equal '1.2.3.4', request.remote_ip

    request = stub_request 'REMOTE_ADDR' => '127.0.0.1',
                           'HTTP_X_FORWARDED_FOR' => '3.4.5.6'
    assert_equal '3.4.5.6', request.remote_ip
  end

  test '#remote_ip - with cloudflare connecting ip header' do
    request = stub_request 'REMOTE_ADDR' => '172.68.65.232',
                           'HTTP_CF_CONNECTING_IP' => '72.1.1.42'
    assert_equal '72.1.1.42', request.remote_ip

    request = stub_request 'REMOTE_ADDR' => '127.0.0.1',
                           'HTTP_X_FORWARDED_FOR' => '72.1.1.1, 172.1.1.42',
                           'HTTP_CF_CONNECTING_IP' => '72.1.1.42'
    assert_equal '72.1.1.42', request.remote_ip
  end

  private

  def stub_request(env = {})
    ip_spoofing_check = env.key?(:ip_spoofing_check) ? env.delete(:ip_spoofing_check) : true
    @trusted_proxies ||= nil
    ip_app = ActionDispatch::RemoteIp.new(Proc.new { }, ip_spoofing_check, @trusted_proxies)
    tld_length = env.key?(:tld_length) ? env.delete(:tld_length) : 1
    ip_app.call(env)
    ActionDispatch::Http::URL.tld_length = tld_length
    ActionDispatch::Request.new(env)
  end

end
