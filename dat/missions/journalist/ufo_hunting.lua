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
   title['intro1'] = "Secrets"
   title['intro2'] = "Samzer Tehran"
   title['intro3'] = "UFO's"
   title['accept'] = "Good Hunting"
   title['enter'] = "Living dangerously"
   title['hail'] = "Anyone there?"
   title['board'] = "Run!"
   title[9] = "Pfew"
   
   text = {}
   -- First part intro msg
   text['intro1'] = [["You look like the spacefaring type, kind of person who has been around, know what I mean?" He says as you come near him. He motions for you to sit down across from him, tilts back a local brew. Then he leans across the table, and his voice drops to a conspiratorial whisper, "How would you like to be a part of something big? I mean, real big. Known universe big. Changing worlds kind of stuff."]]
   -- And even more intro
   text['intro2'] = [["But man, I am getting ahead of myself. My name is Samzer, Samzer Tehran. I work for Tru-pulse. You may have heard of us." He pulls up the badge from his chest. A similarly disheveled picture of Samzer stares out of it, right over the words 'Press Correspondent' and a Tru-pulse logo. 
"We are an independent journalistic outfit dedicated to finding and spreading the Truth, whatever it may be." Tru-pulse. It rings a bell. You've heard other spacers mention it countless bars, some kind of multimedia tabloid that's notorious for its far-fetched 'news' stories and tall tales. You wonder if you should really get involved in this kind of thing...]]
   -- Finalizing intro and let player choose to accept/reject
   text['intro3'] = [[You nod back at Samzer, and ask him what story he's working on right now.
"Aliens." He says simply, leaning back and taking another sip of his bottle. 
"Rumor has it that there have been multiple UFO sightings in the %s system. So far the Empire's kept this very hush hush. Good news is that gives us a chance to break this story before anyone else scoops it. But I can't do it by myself. I need a captain, someone with the cajones to risk life and limb to venture out into the unknown and bring the truth back to the people! Are you that captain?"]]
   -- 
   text['accept'] = [["I knew it was you, from the moment I laid eyes on you! I told myself, Samzer, now here is a fellow truthseeker, a hardcore adventurer just itching to make a difference!" He rubs his hands together, grinning. "Here's the job; you take me to the %s system, and we go UFO hunting. From what I've heard, they shouldn't be too hard to find. We get close enough for me to get some good holo-shots, and then fly to Arcturus to broadcast the story from Tru-pulse HQ. Let's rock and roll!" He gets up from the table, and bounds happily towards the docking bay.]]
   
   text['enter'] = [[As you enter the system Samzer comes up to the cockpit with you, opening a mobile monitor on his lap. "Last reports were about the UFO's sighted around one of the inhabited planets in this system." He points so some planes on your sensors. "Lets see if we can find one!", happily ignoring the flashing 'HOSTILE' indicators.]]
   text['hail'] = [[You try to hail the ship but all you receive back is static noise. "Lets board and see inside." You scan the ship, but no hatch is present. Only some docking clamps. You decide to dock with the UFO and see from there.]]
   
   text['board'] = [[As you dock your ship to the UFO, ... What the?! It is starting up! Need to get out of here!]]
   
   
  
   
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
   tk.msg( title['intro1'],text['intro1'])
   tk.msg( title['intro2'],text['intro2'])
   
   -- string.format(text[1], player.name())
   if not tk.yesno( title['intro3'], text['intro3'] ) then
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
   tk.msg( title['accept'], text['accept'] )
   
   misn.osdCreate(misn_title, {misn_desc[1]:format(misn_target:name())})
   entermsg = false
   
   hook.enter("enter")
   hook.land("land")
   
end


function enter()
   sys = system.cur()
   plt = player.pilot()
     
   if sys == misn_target then
		
		if not entermsg then
			entermsg = true
			-- Show a delayed message upon entering
			hook.timer(2000,"showmsg","enter")
		end
		-- Putting the player pilot close to a planet
		--TODO: picking a random planet. There are 4 planets so...
		dronepos = vec2.new( 6000, -12000 )
		
		p = pilot.add("Collective Drone", "scout", dronepos)[1]
		p:setFaction("CollectiveDummy")
		p:rename ("UFO")
		p:setHilight(true)
		p:setVisible(true)
		p:control()
		
		counter = 0
		brakecnt = 0
		threatd = 500 -- The distance at which the pilot feels threatened
		safed = 1500 -- the distance at which the pilot feels safe.
		-- The space in between can be either.
		running = false
		firstrun = true
		
		hook.pilot(p, "idle", "update")
		hook.pilot( p, "death", "trgtkill")
		hook.pilot(p, "hail", "trgthail")
		hook.pilot(p, "board", "trgtboard")
		
		-- Debug part
		q = pilot.add("Civilian Gawain", "scout", dronepos)[1]
		q:setFaction("CollectiveDummy")
		q:rename ("Dummy Help")
		q:setHilight(true)
		q:setVisible(true)
		q:control()
		-- Debug finish
		
		--proxy() -- And we initiate the distance checking
   end

   -- update mission
   -- if misn_stage == 0 and sys == misn_target then
   --   misn.setDesc( string.format(misn_desc[2],misn_base:name(),misn_base_sys:name()) )
   --   misn_stage = 1
   --   misn.markerMove( misn_marker, misn_base_sys )
   --   misn.osdCreate(misn_title, {misn_desc[2]:format(misn_base:name(),misn_base_sys:name())})
   -- end
end

function showmsg(txt)
	tk.msg( title['enter'], text['enter'] )
end

function trgtboard()
	-- If the pilot-ship gets boarded
	player.unboard()
	tk.msg( title['board'], text['board'] )
	--p:setNodisable( true )
	p:setHealth(100,100) -- Enabeling the drone again
	pilot.setHealth (player.pilot(), 80, 100)
	
	
	proxy() -- And we initiate the distance checking
end

function proxy()
	-- Testing if player is in vicinity of pilot (for running)
    if running and brakecnt <= 2 then
        if player.pilot():pos():dist(p:pos()) >= safed then
            -- Case 1: Pilot is currently running away, but the player is at least the safe distance away.
			running = false
            
		
				p:taskClear()
				p:brake() -- Do this here and NOT in update(), or the hook will constantly perpetuate itself.
				brakecnt = brakecnt + 1
			
        else
			-- Case 2: Pilot is currently running away, AND the player is closer than the safe distance.
            -- Nothing needed here. This clause can be safely omitted.
			-- player.msg( string.format("Damn, still not safe %d...", counter) ) -- Debug line
			if counter > 10 then 
				update()	-- If the pilot tried to reach a nav point 10 times unsuccesfully. Preventing the 'satelite dance' behaviour.
			end
			counter = counter +1
            
        end
    else
        if player.pilot():pos():dist(p:pos()) <= threatd then
            -- Case 3: Pilot is currently not running away, but the player is too close for comfort.
            running = true
            
			if brakecnt <= 2 then -- if we have been chasing the pilot for some time now
				shout()
				update()
			else
				p:broadcast("I had enough. I'm OUT!")
				p:taskClear()
				p:hyperspace ( system.get("Hades") )
			end
        else
            -- Case 3: Pilot is currently not running away, and the player is still a comfortable distance away.
            -- Nothing needed here. This clause can be safely omitted.
        end
    end
	
	hook.timer(500, "proxy")
end

function update()
	
    if running then
        -- We're on the run, so get a new position to run to.
		counter = 0
        local dist = 500 -- The distance to run before looking over our shoulder to see if the player is chasing us.
        
        local myvec = p:pos() - player.pilot():pos() -- Vector from player to the pilot, also the vector along which we want to run!
       
		myvec = (myvec / myvec:mod()) * dist -- Make the vector exactly dist long
        
        p:taskClear() -- Shouldn't be needed, but doesn't hurt.
		local newloc = p:pos() + myvec
		
        p:goto( newloc, false, false )
		
		if firstrun then
			
			player.pilot():setVel( (myvec / myvec:mod())*50  )
			--player.pilot():goto(newloc/2)
			player.msg('first time running')
			
			firstrun = false
		end
		
		q:setPos(newloc) -- Debug
		
    end
    -- If NOT running, do nothing. The hook will not trigger again unless another order is issued.
end

function shout()
    local shouts = {}
    shouts[1] = "Get away from me, you maniac!"
    shouts[2] = "Help! I'm being oppressed! Did you see him oppressing me!?"
    shouts[3] = "Damn it, I'm out of here!"
    shouts[4] = "Aaaaaaaahhhhhh!!"
    
    p:broadcast(shouts[rnd.rnd(1, #shouts)])
end


function land()
   planet = planet.cur()

   if misn_stage == 1 and  planet == misn_return then
      tk.msg( title[3], string.format(text[4],misn_target:name()) )
      misn.finish(false)
   end
end

function trgthail ()
	-- TODO: custom hail message and stuff. something like "unhail"
	player.commClose()
	tk.msg(title['hail'],text['hail'])
	p:disable()
end

function trgtkill()
   player.msg( msg_killdrone )
   misn.finish(false)
end
