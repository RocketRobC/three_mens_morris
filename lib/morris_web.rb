$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'sinatra/base'
require 'morris'

class MorrisWeb < Sinatra::Base
  configure do
    set :views, File.join(File.dirname(__FILE__), '../views')
  end

  get '/' do
    haml :index
  end

  get '/board' do
    headers 'Content-Type' => 'text/event-stream'
    stream do |board|
      board_cells.each do |cell|
        board << "data: #{cell}\n"
      end
      board << "\n"
    end
  end

  def board_cells


  end

  run! if app_file == $PROGRAM_NAME
end
