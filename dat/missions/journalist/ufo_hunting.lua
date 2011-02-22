--[[

   Collective Scout

   Author: bobbens
      minor edits by Infiltrator

   Starts the collective mini campaign.

   You must inspect a stray drone.

]]--

lang = naev.lang()
if lang == "es" then
   -- not translated atm
else -- default english
   bar_desc = "A disheveled, bearded stranger waves at you to join him in his booth at the back of the bar. A wrist-computer glints from his arm, and some kind of badge hangs from a chain on his neck. Do you approach?"
   misn_title = "Hunting UFOs"
   misn_reward = "7500"
   misn_desc = {}
   misn_desc[1] = "Go UFO spotting in the %s system."
   misn_desc[2] = "Travel back to %s in %s."
   
   title = {}
   title[1] = "Secrets"
   title[2] = "Samzer Tehran"
   title[3] = "UFO's"
   title[4] = "Good Hunting"
   title[9] = "Pfew"
   
   text = {}
   text[1] = [["You look like the spacefaring type, kind of person who has been around, know what I mean?" He says as you come near him. He motions for you to sit down across from him, tilts back a local brew. Then he leans across the table, and his voice drops to a conspiratorial whisper, "How would you like to be a part of something big? I mean, real big. Known universe big. Changing worlds kind of stuff."]]
   text[2] = [["But man, I am getting ahead of myself. My name is Samzer, Samzer Tehran. I work for Tru-pulse. You may have heard of us." He pulls up the badge from his chest. A similarly disheveled picture of Samzer stares out of it, right over the words 'Press Correspondent' and a Tru-pulse logo. 
"We are an independent journalistic outfit dedicated to finding and spreading the Truth, whatever it may be." Tru-pulse. It rings a bell. You've heard other spacers mention it countless bars, some kind of multimedia tabloid that's notorious for its far-fetched 'news' stories and tall tales. You wonder if you should really get involved in this kind of thing...]]
   text[3] = [[You nod back at Samzer, and ask him what story he's working on right now.
"Aliens." He says simply, leaning back and taking another sip of his bottle. 
"Rumor has it that there have been multiple UFO sightings in the %s system. So far the Empire's kept this very hush hush. Good news is that gives us a chance to break this story before anyone else scoops it. But I can't do it by myself. I need a captain, someone with the cajones to risk life and limb to venture out into the unknown and bring the truth back to the people! Are you that captain?"]]
   text[4] = [["I knew it was you, from the moment I laid eyes on you! I told myself, Samzer, now here is a fellow truthseeker, a hardcore adventurer just itching to make a difference!" He rubs his hands together, grinning. "Here's the job; you take me to the %s system, and we go UFO hunting. From what I've heard, they shouldn't be too hard to find. We get close enough for me to get some good holo-shots, and then fly to Arcturus to broadcast the story from Tru-pulse HQ. Let's rock and roll!" He gets up from the table, and bounds happily towards the docking bay.]]
   
   text[5] = [[Samzer comes up to the cockpit with you, opening a mobile monitor on his lap. He points to a dot on your sensors, happily ignoring the flashing 慔OSTILE' indicators. "There! Get in as close as you can! I need you to stay close to the UFO for at least three seconds so I can get some good shots!"]]
   text[6] = "Shooting holo�3�2�1匔omplete!"
   
   text[9] = [["Man! That was something, wasn't it!" Samzer says as he rolls his holo-recording equipment off your ship. You eye the scorch marks on your hull from the strange ship's weapons, but refrain from yelling. "The public is gonna go nuts over this! We've gotta get it out on the Pulse right away!" He start to dart away. You clear your throat loudly to remind Samzer that he's forgetting something. He turns around then slaps himself on the forehead. "Oh yeah! Your credits! My bad, here you go." He hands you a credit chip for 10,000 credits. "I know it's not much, but it's the best we can do. But hey, if you ever want to help us uncover the truth in the future, look for me here. We can always use a good pilot!"]]
   
   errtxt = {}
   errtxt[1] = [[You tell Samzer that you're not interested in his offer. He looks crestfallen, and returns to his bottle. You leave the table to look for more sensible company.]]
   
   msg_killdrone = "Mission Failed: You weren't supposed to kill the drone!"
end


function create ()
   -- Note: this mission does not make any system claims.
   misn.setNPC( "Stranger", "thief2" )
   misn.setDesc( bar_desc )
end


function accept ()
   -- Intro text
   tk.msg( title[1],text[1])
   
   -- string.format(text[1], player.name())
   if not tk.yesno( title[2], text[2] ) then
      misn.finish()
   end

   -- Accept mission
   misn.accept()

   misn_stage = 0
   misn_target = system.get("Fortitude")
   misn_return,misn_return_sys = planet.cur()
   
   misn_marker = misn.markerAdd( misn_target, "low" )

   -- Mission details
   misn.setTitle(misn_title)
   misn.setReward( misn_reward )
   misn.setDesc( string.format(misn_desc[1],misn_target:name()))

   -- Flavour text and mini-briefing
   tk.msg( title[3], text[3] )
   
   misn.osdCreate(misn_title, {misn_desc[1]:format(misn_target:name())})
   hook.enter("enter")
   hook.land("land")
end


function enter()
   sys = system.cur()
   plt = player.pilot()
   
   
   if sys == misn_target then
		--dist = rnd.rnd() * system.cur():radius()
		-- angle = rnd.rnd() * 2 * math.pi
		
		dronepos = vec2.new( 6000, -12000 )
		
		p = pilot.add("Collective Drone", "scout", dronepos)[1]
		p:setFaction("CollectiveDummy")
		hook.pilot( p, "death", "kill")
		p:control()
		
		--v:runaway( player.pilot() )
		p:setHilight(true)
		p:setVisible(true)
--v:changeAI( "scout" )
		 
		hook.pilot(p,"idle", "checkDist")
		misn_stage = 1
		evaded = true
   end

   -- update mission
   -- if misn_stage == 0 and sys == misn_target then
   --   misn.setDesc( string.format(misn_desc[2],misn_base:name(),misn_base_sys:name()) )
   --   misn_stage = 1
   --   misn.markerMove( misn_marker, misn_base_sys )
   --   misn.osdCreate(misn_title, {misn_desc[2]:format(misn_base:name(),misn_base_sys:name())})
   -- end
end

function checkDist()
	
	if p:pos():dist( player.pilot():pos() ) < 500 then
		
		--if evaded then
			player.msg("Je bent dichtbij")
			msnevade()	
		--end
	
	else
		
		evaded = true
		
		p:taskClear()
		p:brake()
		
		player.msg("Te ver weg")
		hook.timer(1000, "checkDist")
	
	end
	
end

function msnevade()
	evaded = false
	player.msg("Start evading")
	-- print v:pos():dist( player.pilot:pos() )
	dist = 1000
	--angle = rnd.rnd() * 2 * math.pi
	dx = rnd.rnd(-1, 1)
	dy = rnd.rnd(-1, 1)
	newloc = vec2.new(dx*dist, dy*dist)
	--newloc:add(dronepos)
	
	p:taskClear()
	p:goto(newloc+dronepos, false, true)
		
	-- hook.timer(1000, "checkDist")
end


function land()
   planet = planet.cur()

   if misn_stage == 1 and  planet == misn_return then
      tk.msg( title[3], string.format(text[4],misn_target:name()) )
      misn.finish(false)
   end
end
-- None hook functions
function kill()
   player.msg( msg_killdrone )
   misn.finish(false)
end
