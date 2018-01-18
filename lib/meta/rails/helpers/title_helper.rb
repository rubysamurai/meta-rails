module MetaRailsHelpers
  module TitleHelper
    # Produces html title element
    def title(identifier: :title,
              separator: '|',
              brand: default_brand,
              reverse: false)

      # Assigns content stored in a identifier
      title = content_for(identifier)

      # Disregards separator when title or brand is not present
      separator = '' unless title.present? && brand.present?

      # Returns 'brand separator title' format when reverse is true
      # and 'title separator brand' format when reverse is false
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
