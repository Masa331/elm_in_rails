module ElmInRails
  class Railtie < Rails::Railtie
    config.assets.configure do |env|
      env.register_mime_type 'text/x-elm', extensions: ['.elm']

      env.register_transformer 'text/x-elm', 'application/javascript', Transformer.new
    end
  end
end
