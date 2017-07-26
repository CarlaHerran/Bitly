get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  @urls = Url.all
  erb :index
end

post '/urls' do
  # crea una nueva Url
  @url = Url.create(long_url: params[:url])
  @urls = Url.all
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  url = Url.find_by(short_url: params[:short_url])
  url.increment(:click_count).save
  redirect to url.long_url
end