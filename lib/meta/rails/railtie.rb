require 'rails/railtie'

module MetaRailsHelpers
  class Railtie < Rails::Railtie
    initializer 'meta_description.helper' do
      ActiveSupport.on_load :action_view do
        include MetaRailsHelpers::MetaDescriptionHelper
      end
    end

    initializer 'robots.helper' do
      ActiveSupport.on_load :action_view do
        include MetaRailsHelpers::RobotsHelper
      end
    end

    initializer 'title.helper' do
      ActiveSupport.on_load :action_view do
        include MetaRailsHelpers::TitleHelper
      end
    end
  end
end
