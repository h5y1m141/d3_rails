require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module D3Rails
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # locale関連設定
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.fallbacks = { ja: :en }
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}', 'uploaders').to_s]
    config.active_record.default_timezone = :local
    config.active_record.raise_in_transactional_callbacks = true
    # generatorの挙動
    config.generators do |g|
      g.javascript_engine :js
      g.test_framework :rspec, view_specs: false, helper_specs: false, fixture: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end    
  end
end
