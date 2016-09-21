module SmsTeknik
  class Railties < ::Rails::Railtie
    initializer 'Rails logger' do
      SmsTeknik.logger = Rails.logger
    end
  end
end