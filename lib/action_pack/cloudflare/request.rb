module ActionPack
  module Cloudflare
    module Request

      def remote_ip
        remote_ip_cloudflare || super
      end

      private

      def remote_ip_cloudflare
        @env['HTTP_CF_CONNECTING_IP']
      end

    end
  end
end

ActionDispatch::Request.class_eval do
  prepend ActionPack::Cloudflare::Request
end
