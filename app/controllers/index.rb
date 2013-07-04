get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :event_new
end

post '/events/create' do
	event = Event.new(params[:event])
	if event.save
		redirect "/events/#{event.id}/show"
	else
		show_errors(event)
		erb :event_new
	end
end
