module MetaRailsHelpers
  module MetaDescriptionHelper
    # Produces html meta element for description
    def meta_description(identifier: :meta_description)
      # Assigns content stored in a identifier
      meta_description = content_for(identifier)

      # Returns meta description element only when page description is present
      if meta_description.present?
        tag(:meta, name: 'description', content: meta_description)
      end
    end
  end
end
