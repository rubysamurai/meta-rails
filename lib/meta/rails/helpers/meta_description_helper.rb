module MetaRailsHelpers
  module MetaDescriptionHelper
    # Produces html meta element for description
    def meta_description(page_description: :meta_description)
      # Assigns content stored in a meta_description
      page_description = content_for(page_description)

      # Returns meta description element only when page description is present
      if page_description.present?
        tag(:meta, name: 'description', content: page_description)
      end
    end
  end
end
