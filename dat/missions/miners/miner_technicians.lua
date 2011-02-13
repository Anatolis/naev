--[[	
	+ Ferry miners
		- Second miner mission
		- Bring a group of miners to their new spacestation to make it operational

		- Programmed: Anatolis (feb 2011)
		- Text:	Anatolis (feb 2011)
]]--

lang = naev.lang()
if lang == "es" then
   -- not translated atm
else -- default english
   -- Mission details
   bar_desc = "Suprisingly you see miner <X> sitting at the bar. You would not have expected him here."
   misn_title = "First miners"
   misn_reward = "%d credits"
   misn_desc = {}
   misn_desc[1] = "Pick up a group of miners at %s in the %s system."
   misn_desc[2] = "Ferry the miners to %s in the %s system." 

   -- Fancy text messages
   title = {}
   title[1] = "Miner <X>"
   title[2] = "Accepted"
   title[2] = "The miners"
   title[3] = "Embarking"
   title[4] = "Docking"
   
   text = {}
   text[1] = [["Hello %s! Don't look so supprised. We miners are a traveling group of people. But it is nice we meet again, because we could use your help once again."

"Are you interested?" ]]
   text[2] = [["Thank you! After you launched the station modules, they assambled succesfully. The station is now ready but not yet opperational. We would like you to pick-up a group miners from %s in the %s system and bring them to the new station in the %s system. They will start up the lifesupport and other station systems to make it opperational. The miners will be waiting for you at the landing pad. The reward of %d will be paid when you are succesfull.
Good luck!"]]
	text[3] = [[As you finish your landing routine you spot the group of miners already. They have some equipment boxes and spacesuits. You signal them and the walk to your ship. 
"We will load our equipment. When we are done we can travel emediately to %s in the %s system."]]
	text[4] = [[Once you are docked with the space station the miners jumped in their space suits. They leave your ship via the airlock. From you cockpit you see them walking in different directions. Only a few minutes later the lights in the station start flickering until they keep on burning steadily. 
	One of the miners approaches your ship, this time without his spacesuit. "Thank you for your help. All systems function normally and the atmospere is breathable, so if you want you can leave your ship." He hands you a creditchip. 
	
	"If you want we have some more missions for you. When you're interested please visit my collegue at the bar."]]
   -- Errors
   errtitle = {}
   errtitle[1] = "Need More Space"
   errtitle[2] = "Declined"
   err = {}
   err[1] = "You do not have enough space to load the packages. You need to make room for %d more tons."
   err[2] = [[ "To bad. I hoped you had time right now. Perhaps we will meet again in the future." 
<X> turn around an walks away, clearly dissapointed. ]]
end


function create ()
   -- Note: this mission does not make any system claims.
   misn.setNPC( "Miner <x>", "none" )
   misn.setDesc( bar_desc )
end

function accept ()

	-- See if accept mission
	if not tk.yesno( title[1], string.format(text[1], player.name()) ) then
		tk.msg(errtitle[2],err[2])
      	misn.finish()
	end

	misn.accept()
	misn_stage = 0
	var.push( "miner_status", 2 ) -- Next stage in the miner missions. 2 or higher allows landing on base
	diff.apply("Mining_base_alpha2")
	-- target destination
	pickup,pickupsys = planet.get( "Selphod" ) -- TODO: random location picking
	dest,destsys = planet.get( "Mining base Alpha" )
   
	misn_marker = misn.markerAdd( pickupsys, "low" )

	-- Mission details
	misn_stage = 0
	reward = 20000
	misn.setTitle(misn_title)
	misn.setReward( string.format(misn_reward, reward) )
	misn.setDesc( string.format(misn_desc[1], pickup:name(), pickupsys:name()))
	
   -- The mini-briefing
   tk.msg( title[2], string.format( text[2], pickup:name(), pickupsys:name(),destsys:name(), reward ))
  
   misn.osdCreate(misn_title, {misn_desc[1]:format(pickup:name(),pickupsys:name())})

   -- Set hooks
   hook.land("land")
   hook.enter("enter")
end


function land ()
   landed = planet.cur()

   if landed == pickup and misn_stage == 0 then

      -- Make sure player has room.
      if pilot.cargoFree(player.pilot()) < 5 then
         tk.msg( errtitle[1], string.format( err[1], 5 - pilot.cargoFree(player.pilot()) ) )
         return
      end

      -- Update mission
      package = misn.cargoAdd("Packages", 5)
      misn_stage = 1
      
      misn.setDesc( string.format(misn_desc[2], dest:name(), destsys:name()))
      misn.markerMove( misn_marker, destsys )
      misn.osdCreate(misn_title, {misn_desc[2]:format(dest:name(),destsys:name())})

      -- Load message
      tk.msg( title[3], string.format( text[3], dest:name(), destsys:name()) )

   elseif landed == dest and misn_stage == 1 then
      if misn.cargoRm(package) then

        player.pay(reward) -- Paying the player
         
        tk.msg( title[4], text[4] )
		
		misn.finish(true)
      end
   

      
   end
end


function enter ()
   sys = system.cur()

end

function abort()
	misn.finish(false)
end


