module MetaRailsHelpers
  module MetaDescriptionHelper
    # Produces html meta element for description
    def meta_description(identifier: :meta_description)
      meta_description = content_for(identifier)
      return if meta_description.blank?

      tag(:meta, name: 'description', content: meta_description)
    end
  end
end
