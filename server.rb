require 'sinatra'
require 'pg'

set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  t_msg = []

  begin
    # connect to the database
    conection = PG.connect :dbname => 'messageboard', :user => 'messageboarduser', :password => 'messageboarduser'

    # read data from the database
    t_messages = conection.exec 'SELECT * FROM messageboardmessages'

    # map data to t_msg, which is provided to the erb later
    t_messages.each do |s_message|
      t_msg.push({ nick: s_message['nickname'], msg: s_message['message'] })
    end

  rescue PG::Error => e
    val_error = e.message 

  ensure
    conection.close if conection
 
  end

  erb :v_message, :layout => :l_main, :locals => {:t_msg => t_msg, :val_error => val_error}
end