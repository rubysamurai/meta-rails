module MetaRailsHelpers
  module TitleHelper
    # Produces html title element
    def title(identifier: :title,
              separator: '|',
              brand: default_brand,
              reverse: false)
      title = content_for(identifier)
      separator = '' unless title.present? && brand.present?
      if reverse == true
        content_tag :title, [brand, separator, title].reject(&:blank?).join(' ')
      else
        content_tag :title, [title, separator, brand].reject(&:blank?).join(' ')
      end
    end

    private

      # Returns Rails application class name as default brand
      def default_brand
        Rails.application.class.parent_name
      end
  end
end
