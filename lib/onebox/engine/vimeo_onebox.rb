module Onebox
  module Engine
    # Vimeo Onebox that works with private videos.
    # Since Feb 1st 2014, Vimeo no longer include OpenGraph tags in pages of private videos.
    class VimeoOnebox
      include Engine

      matches do
        http
        domain("vimeo")
        tld("com")
      end

      def to_html
        %Q{<iframe src="//player.vimeo.com/video/#{video_id}" width="500" height="300" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>}
      end

      def placeholder_html
        %{<img src="http://placehold.it/500x300">}
      end

      private

      def video_id
        @url[%r{vimeo\.com\/(\d+)}, 1]
      end

    end
  end
end
