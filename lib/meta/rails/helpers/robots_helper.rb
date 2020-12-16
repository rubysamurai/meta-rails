module MetaRailsHelpers
  module RobotsHelper
    # Produces html meta element for robots
    def robots(identifier: :robots)
      robots = content_for(identifier)
      return if robots.blank?

      tag(:meta, name: 'robots', content: robots)
    end
  end
end
