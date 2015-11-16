module MetaRailsHelpers
  class Railtie < Rails::Railtie
    initializer 'title.helper' do
      ActiveSupport.on_load :action_view do
        include MetaRailsHelpers::TitleHelper
      end
    end
  end
end
