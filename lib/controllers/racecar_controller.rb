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

  get "/racecars/new" do
    erb :"racecars/new"
  end

  get "/racecars/:id/delete" do
    @id = params[:id]
    erb :"racecars/delete"
  end

  get "/racecars/:id/edit" do
    @racecar = Racecar.find(params[:id])

    erb :"racecars/edit"
  end

  patch "/racecars/:id" do
    @racecar = Racecar.find(params[:id])
    @racecar.name = params[:name]
    @racecar.horsepower = params[:horsepower]
    @racecar.bio = params[:bio]
    @racecar.save

    redirect "/racecars/#{@racecar.id}"
  end

  get "/racecars/:id" do
    @racecar = Racecar.find(params[:id])

    erb :"racecars/show"
  end

  post "/racecars" do
    new_racecar = Racecar.create({
      name: params[:name],
      horsepower: params[:horsepower],
      bio: params[:bio]
    })

    id = new_racecar.id

    redirect "/racecars/#{id}"
  end

  delete "/racecars/:id" do
    @racecar = Racecar.find(params[:id])
    @racecar.destroy

    redirect "/racecars"
  end
end
