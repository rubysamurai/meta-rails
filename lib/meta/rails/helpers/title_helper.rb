module MetaRailsHelpers
  module TitleHelper
    # Produces html title element
    def title(options = {})
      page_title = content_for(options[:page_title] || :title)
      separator  = options[:separator] || '|'
      brand      = options[:brand] || default_brand
      reverse    = options[:reverse] || false

      if page_title.present?
        if reverse
          content_tag(:title, brand + ' ' + separator + ' ' + page_title)
        else
          content_tag(:title, page_title + ' ' + separator + ' ' + brand)
        end
      else
        content_tag(:title, base_title)
      end
    end

    private
      # Returns Rails application name as default brand
      def default_brand
        Rails.application.class.to_s.split('::').first
      end
  end
end
