require 'sinatra/base'
require 'rack-flash'
require_relative 'peep'

class Chitter < Sinatra::Base

use Rack::Flash 

set :views, File.join(File.dirname(__FILE__), '..', 'views')

enable :sessions
set :session_secret, 'incredible sensitive devesh'

  get '/' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :index
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  get '/sign_in' do 
    erb :sign_in
  end

  get '/peep' do 
    erb :peep 
  end

  post '/peep' do 
    if current_user
      user = User.get(session[:user_id])
      Peep.create(:post => params[:post], :user_name => user.user_name, :name => user.name, :created_at => Time.now)
      redirect to ('/')
    else
      flash.now[:errors] = ["Please log in or make an account"]
      erb :peep
    end 
  end

  post '/sign_out' do 
    flash[:notice] = "You are no longer logged in"
    session[:user_id] = nil 
    redirect to('/')
  end

  post '/sign_in' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password are incorrect"]
    erb :sign_in
  end
end

  post '/sign_up' do 
    @user = User.create(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :name => params[:name], :user_name => params[:user_name])
    if @user.save
    session[:user_id] = @user.id 
    redirect to ('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up 
    end
  end

helpers do 

  def current_user 
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
