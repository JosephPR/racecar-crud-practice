class RacecarController < Sinatra::Base
  configure do
    set :views, "lib/views"
  end

  get "/" do
    erb :index
  end

  get "/racecars" do
    @racecars = Racecar.all
    erb :"racecars/index"
  end

  get "/racecars/:id" do
    @racecar = Racecar.find(params[:id])

    erb :"racecars/show"
  end
end
