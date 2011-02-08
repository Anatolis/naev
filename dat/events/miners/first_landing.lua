--[[	
	+ First landing
		- Just a simple message to the player, welcoming him on his first arival in the system.
		- More missions are to be presented in the bar.

		- Programmed: Anatolis (feb 2011)
		- Text:	Anatolis (feb 2011)
]]--

lang = naev.lang()
if lang == "es" then
else -- default english
   
    title = "First arival"
    text = [[ 
As you enter the system you see a brand new station appearing on you radar. ]]
end

function create () 
	-- Upon landing the text is shown.
	hook.timer( 2000, "showMessage" )
	
end

function showMessage ()
	tk.msg(title, text:format( player.name() ) )
	var.push( "miner_stat", 2 )
end
