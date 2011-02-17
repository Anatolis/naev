--[[	
	+ Refuse landing
		- Refuse landing to the player after the first mission
		- During the second miner mission the blockage will be lifted

		- Programmed: 	Anatolis (feb 2011)
		- Text:			Anatolis (feb 2011)
]]--

lang = naev.lang()
if lang == "es" then
else -- default english
    automsg = "Mining Base Alpha> Automessage: No lifesupport, docking not permitted"
end

function create () 
	
	enter()
	hook.jumpout("jumpout")
end

function enter ()
	-- player.msg("Entering...") -- Debug line
	-- Just for sure checking the conditions again (also in the event.xml!)
	if (var.peek("miner_status") < 2 and system.cur():name() == "Sirou") then
		player.allowLand(false, automsg)
	else
		evt.finish(true) -- Don't need to trigger the event anymore in the future.
	end
end

function jumpout()
	-- player.msg("killing event") -- Debug line
	evt.finish(false) 
	-- The event doesn't have to stay persistent, so just kill it
	-- The event will be initiated again when entering the system next time.
end