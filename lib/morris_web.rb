$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'sinatra/base'
require 'morris'

class MorrisWeb < Sinatra::Base
  configure do
    set :views, File.join(File.dirname(__FILE__), '../views')
    set :public_dir, File.join(File.dirname(__FILE__), '../public')
    set :control, Morris::Control.new(Morris::WebVisitor)
  end

  get '/' do
    haml :index, locals: { control: settings.control }
  end

  post '/move' do
    settings.control.play(params[:cell])
  end

  run! if app_file == $PROGRAM_NAME
end
