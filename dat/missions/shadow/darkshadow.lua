--[[
-- This is the third mission in the "shadow" series, featuring the return of SHITMAN.
--]]

include ("scripts/proximity.lua")

-- localization stuff, translators would work here
lang = naev.lang()
if lang == "es" then
else -- default english

    title = {}
    text = {}
    Jorscene = {}

    title[1] = "An urgent invitation"
    text[1] = [[    Suddenly, out of nowhere, one of the dormant panels in your cockpit springs to life. It shows you a face you've never seen before in your life, but you recognize the plain grey uniform as belonging to the Four Winds.
    "Hello %s," the face says. "You must be wondering who I am and how it is I'm talking to you like this. Neither question is important. What is important is that captain Rebina has urgent need of your services. You are to meet her on the Seiryuu, which is currently in orbit around %s in the % system. Please don't ask any questions now. We expect to see you as quickly as you can make your way here."
    The screen goes dead again. You decide to make a note of this in your log. Perhaps it would be a good idea to visit the Seiryuu once more, if only to find out how they got a private line to your ship!]]

    title[2] = "Disclosure"
    text[2] = [[    You make your way through the now familiar corridors of the Seiryuu. You barely notice the strange environment anymore. It seems unimportant compared to the strange events that surround your every encounter with these Four Winds.
    You step onto the bridge, where captain Rebina is waiting for you. "Welcome back, %s," she says. "I'm pleased to see that you decided to respond to our communication. I doubt you would have come here if you weren't willing to continue to aid us. Your presence here confirms that you are a reliable partner, so I will treat you accordingly."
    the captain motions you to take a seat at what looks like a holotable in the center of the bridge. "Before I tell you what I've called you here for, I feel I should explain to you in full who we are, what we do and what your part in all this is." She takes a seat opposite from yours, and leans on the holotable. "As I've said before, we are the Four Winds. Our organization is a very secretive one, as you've experienced firsthand. Very few outside our know ranks of our existence, and now you're one of those few."]]

    text[3] = [[    "The Four Winds are old, %s. Very old indeed. The movement dates back to old Earth, before the Space Age, even. We have been with human civilization throughout the ages, at first only in the Eastern nations, later establishing a foothold worldwide. Our purpose was to guide humanity, prevent it from making mistakes it could not afford to make. We never came out in the open, we always worked behind the scenes, from the shadows. We were diplomats, scientists, journalists, politicians' spouses, sometimes even assassins. We used any means necessary to gather information and avert disaster, when we could.
    "Of course, we didn't always succeed. We couldn't prevent the nuclear strikes on Japan, though we managed to prevent several others. We foiled the sabotage attempts on several of the colony ships launched during the First Growth, but sadly failed to do so in Wendigo's case. We failed to stop the Faction Wars, though we managed to help the Empire gain the upper hand. Our most recent failure is the Incident - we should have seen it coming, but we were completely taken by surprise."]]

    text[4] = [[    Captain Rebina sits back in her chair and heaves a sigh. "I think that may have been when things started to change. We used to be committed to our purpose, but apparently things are different now. No doubt you remember what happened to the diplomatic exchange between the Empire and the Dvaered some time ago. Well, suffice to say that increasing the tension between the two is definitely not part of our mandate. In fact, it's completely at odds with what we stand for. And that was not just an isolated incident either. Things have been happening that suggest Four Winds involvement, things that bode ill."
    She activates the holotable, and it displays four cruisers, all seemingly identical to the Seiryuu, though you notice subtle differences in the hull designs.
    "These are our flagships. Including this ship, they are the Seiryuu, Suzaku, Byakko and Genbu. I'm given to understand that these names, as well as our collective name, have their roots in ancient Oriental mythology." The captain touches another control, and four portraits appear, superimposed over the ships. "These are the four captains of the flagships, which by extension makes them the highest level of authority within the Four Winds. You know me. The other three are called Giornio, Zurike and Farett."]]

    text[5] = [[    "It is my belief that one or more of my fellow captains have abandoned their mission, and are misusing their resources for a different agenda. I have been unable to find out the details of Four Winds missions that I did not order myself, which is a bad sign. I am being stonewalled, and I don't like it. I want to know what's going on, %s, and you're going to help me do it."
    The captain turns the holotable back off so she can have your undivided attention. "I have sent Jorek on a recon mission to the planet of %s in the %s system. He hasn't reported back to me so far, and that's bad news. Jorek is a reliable agent. If he fails to meet a deadline, then it means he is tied down by factors outside of his control, or worse. I want you to find him. Your position as an outsider will help you fly below the radar of potentially hostile Four Winds operatives. You must go to %s and contact Jorek if you can, or find out where he is if you can't."
    Captain Rebina stands up, a signal that this briefing is over. You are seen to your ship by a grey-uniformed crewman. You sit in your cockpit for a few minutes before disengaging the cocking clamp. What captain Rebina has told you is a lot to take in. A shadowy organization that guides humanity behind the scenes? And parts of that organization going rogue? The road ahead could well be a bumpy one.]]

    title[3] = "A tip from the barman"
    text[6] = [[    You meet the barman's stare. He hesitates for a moment, then speaks up.
    "Hey man. Are you %s by any chance?"
    You tell him that yes, that's you, and ask how he knows your name.
    "Well, your description was given to me by an old friend of mine. His name is Jarek. Do you know him?"
    You tell him that you don't know anyone by the name of Jarek, but you do know a man named Jorek. The barman visibly relaxes when he hears that name.
    "Ah, good. You're the real deal then. Can't be too careful in times like these, you know. Anyway, old Jorek was here, but he couldn't stay. He told me to keep an eye out for you, said you'd be coming to look for him." The barman glances around to make sure nobody is within earshot, even though the bar's music makes it difficult to overhear anyone who isn't standing right next to you. "I have a message for you. Go to the %s system and land on %s. Jorek will be waiting for you there. But you better be ready for some trouble. I don't know what kind of trouble it is, but Jorek is never in any kind of minor trouble. Don't say I didn't warn you."
    You thank the barman, pay for your drink and prepare to head back to your ship, wondering whether your armaments will be enough to deal with whatever trouble Jorek is in.]]

    title[4] = "Still an unpleasant man"
    text[7] = [[    "Well hello there %s," Jorek says when you approach his table. "It's about damn time you showed up. I've been wastin' credits on this awful swill for days now."
    Not at all surprised that Jorek is still as disagreeable as the last time you encountered him, you decide to ask him to explain the situation, beginning with how he knew that it was you who would be coming for him. Jorek laughs heartiily at that.
    "Ha! Of course it was going to be you. Who else would that lass Rebina send? She's tough as nails, that girl, but I know how her mind works. She's cornered, potential enemies behind every door in the organization. And you have done us a couple of favors already. In fact, you're the only guy she can trust outside her own little circle of friends, and right now I'm not too sure how far she trusts those. Plus, she really has a keen nose when it comes to sniffin' out reliable people, and she knows it. Yeah, I knew she'd send you to find me."
    That answers one question. But you still don't know why Jorek hasn't been reporting in like he should have.
    "Yeah, right, about that. You know about the deal with the other branches getting too big for their britches? Good. Well, I've been lookin' into that, pokin' my nose into their business. Since I'm dealin' with my fellow Shadows here, I couldn't afford to give myself away. So that's that. But there's more."]]

    text[8] = [[    I dunno if you've seen them on your way here, but there's guys of ours hangin' around in the system. And when I say guys of ours, I mean guys of theirs, since they sure ain't our guys any more. They've been on my ass ever since I left Manis, so I think I know what they want. They want to get me and see what I know, or maybe they just want to blow me into space dust. Either way, I need you to help me get out of this rothole."
    You ask Jorek why he didn't just lie low on some world until the coast was clear, instead of coming to this sink for the dregs of intergalactic society.
    "It ain't that simple," Jorek sighs. "See, I got an inside man. A guy in their ranks who wants out. I need to get him back to the old girl so he can tell her what he knows firsthand. He's out there now, with the pack, so we need to pick him up on our way out. Now, there's two ways we can do this. We can either go in fast, grab the guy, get out fast before the wolves get us. Or we can try to fight our way through. Let me warn you though, these guys mean business, and they're not your average pirates. Unless you got a really tough ship, I recommend you run."
    Jorek sits back in his chair. "Well, there you have it. I'll fill you in on the details once we're spaceborne. Show me to your ship, buddy, and let's get rollin' I've had enough of this damn place."]]

    title[5] = "An extra passenger"
    text[9] = [[    You board with the Four Winds vessel, and as soon as the airlock opens a nervous looking man enters your ship. He eyes you warily, but when he sees that Jorek is with you his tension fades.
    "Come on, %s," Jorek says. "Let's not waste any more time here. We got what we came for. Now let's give these damn vultures the slip, eh?"]]

    Jorscene[1] = [[Jorek> "That's my guy. We got to board his ship and get him off before we jump."]]
    Jorscene[2] = [[Jorek> "Watch out for those patrols though. If they spot us, they'll be all over us."]]
    Jorscene[3] = [[Jorek> "They're tougher than they look. Don't underestimate them."]]

    joefailtitle = "You forgot the informant!"
    joefailtext = [[Jorek is enraged. "Dammit, %s! I told you to pick up that informant on the way! Too late to go back now. I'll have to think of somethin' else. I'm disembarkin' at the next spaceport, don't bother taking me back to the Seiryuu."]]

    patrolcomm = "All pilots, we've detected McArthy on that ship! Break and intercept!"
    
    NPCtitle = "No Jorek"
    NPCtext = [[You step into the bar, expecting to find Jorek McArthy sitting somewhere at a table. However, you don't see him anywhere. You decide to go for a drink to contemplate your next move. Then, you notice the barman is giving you a curious look.]]
    NPCdesc = "The barman seems to be eyeing you in particular."

    Jordesc = "There he is, Jorek McArthy, the man you've been chasing across half the galaxy. What he's doing on this piece of junk is unclear."

    -- Mission info stuff
    osd_title = {}
    osd_msg   = {}
    osd_title = "Dark Shadow"
    osd_msg[0] = "Look for Jorek on %s in the %s system" -- Note: indexing at 0 because it's a template.

    misn_desc1 = [[You have been summoned to the %s system, where the Seiryuu is supposedly waiting for you in orbit around %s.]]
    misn_desc2 = [[You have been tasked by captain Rebina of the Four Winds to assist Jorek McArthy.]]
    misn_reward = "A sum of money."
end

function create()
    var.push("darkshadow_active", true)

    seirplanet, seirsys = planet.get("Edergast")
    jorekplanet1, joreksys1 = planet.get("Manis")
    jorekplanet2, joreksys2 = planet.get("The Wringer")
    ambushsys = system.get("Herakin")

    if not misn.claim ( {seirsys, joreksys2, ambushsys} ) then
        abort()
    end

    tk.msg(title[1], text[1]:format(player.name(), seirplanet:name(), seirsys:name()))
    accept() -- The player automatically accepts this mission.
end

-- This is the initial phase of the mission, when it still only shows up in the mission list. No OSD, reward or markers yet.
function accept()
    misn.setDesc(misn_desc1:format(seirsys:name(), seirplanet:name()))
    misn.accept()
    misn.osdDestroy() -- This is here because setDesc initializes the OSD.

    stage = 1

    hook.enter("enter")
end

-- This is the "real" start of the mission. Get yer mission variables here!
function accept2()
    osd_msg[1] = osd_msg[0]:format(jorekplanet1:name(), joreksys1:name())
    misn.osdCreate(osd_title, osd_msg)
    misn.setDesc(misn_desc2)
    misn.setReward(misn_reward)
    marker = misn.markerAdd(joreksys1, "low")
    landhook = hook.land("land", "bar")
end

-- Handle boarding of the Seiryuu
function seiryuuBoard()
    if stage == 1 then -- Briefing
        tk.msg(title[2], text[2]:format(player.name()))
        tk.msg(title[2], text[3]:format(player.name()))
        tk.msg(title[2], text[4])
        tk.msg(title[2], text[5]:format(player.name(), jorekplanet1:name(), joreksys1:name(), jorekplanet1:name()))
        player.unboard()
        seiryuu:setHilight(false)
        accept2()
        stage = 2
    elseif stage == 5 then -- Debriefing
        player.unboard()
        seiryuu:setHilight(false)
        var.pop("darkshadow_active")
        misn.finish(true)
    end
end

-- Board hook for joe
function joeBoard()
    tk.msg(title[5], text[9]:format(player.name()))
    misn.cargoAdd("Four Winds Informant", 0)
    player.unboard()
    stage = 5
end
    
-- Enter hook
function enter()
    if system.cur() == seirsys then
        seiryuu = pilot.add("Seiryuu", nil, vec2.new(300, 300) + seirplanet:pos())[1]
        seiryuu:setInvincible(true)
        seiryuu:disable()
        if stage == 1 or stage == 5 then
            seiryuu:setHilight(true)
            hook.pilot(seiryuu, "board", "seiryuuBoard")
        else
            seiryuu:setNoboard(true)
        end
    elseif system.cur() == joreksys2 and stage == 3 then
        pilot.clear()
        pilot.toggleSpawn(false)
        spawnSquads(false)
    elseif system.cur() == joreksys2 and stage == 4 then
        pilot.clear()
        pilot.toggleSpawn(false)
        pilot.allowLand(false, "Landing permission denied. Our docking clamps are currently undergoing maintenance.")
        -- Meet Joe, our informant.
        joe = pilot.add("Four Winds Vendetta", nil, vec2.new(-500, -4000))[1]
        joe:control()
        joe:rename("Four Winds Informant")
        joe:setHilight(true)
        joe:setVisplayer()
        joe:setInvincible(true)
        joe:disable()
        spawnSquads(true)

        -- Make everyone visible for the cutscene
        squadVis(true)

        -- The cutscene itself
        local delay = 0
        hook.timer(delay, "playerControl", true)
        delay = delay + 2000
        hook.timer(delay, "zoomTo", joe)
        delay = delay + 4000
        hook.timer(delay, "showText", Jorscene[1])
        delay = delay + 4000
        hook.timer(delay, "zoomTo", leader[1])
        delay = delay + 1000
        hook.timer(delay, "showText", Jorscene[2])
        delay = delay + 2000
        hook.timer(delay, "zoomTo", leader[2])
        delay = delay + 3000
        hook.timer(delay, "zoomTo", leader[3])
        delay = delay + 2000
        hook.timer(delay, "showText", Jorscene[3])
        delay = delay + 3000
        hook.timer(delay, "zoomTo", leader[4])
        delay = delay + 4000
        hook.timer(delay, "zoomTo", leader[5])
        delay = delay + 4000
        hook.timer(delay, "zoomTo", player.pilot())
        hook.timer(delay, "playerControl", false)

        -- Hide everyone again
        delay = delay + 2000
        hook.timer(delay, "squadVis", false)
        delay = delay + 1
        -- ...except the leadears.
        hook.timer(delay, "leaderVis", true)

        hook.pilot(joe, "board", "joeBoard")
        hook.timer(500, "patrolPoll")
    elseif system.cur() == ambushsys and stage == 4 then
        tk.msg(joefailtitle, joefailtext:format(player.name()))
        abort()
    elseif system.cur() == ambushsys and stage == 5 then
        pilot.clear()
        pilot.toggleSpawn(false)
        invProximity(system.cur():adjacentSystems()[system.get("Suna")]) -- Starts an inverse proximity poll for distance from the jump point.
    end
end

function spawnSquads(highlight)
    -- Start positions for the leaders
    leaderstart1 = vec2.new(-2500, -1500)
    leaderstart2 = vec2.new(2500, 1000)
    leaderstart3 = vec2.new(-3500, -4500)
    leaderstart4 = vec2.new(2500, -2500)
    leaderstart5 = vec2.new(-2500, -6500)

    -- Leaders will patrol between their start position and this one
    leaderdest1 = vec2.new(2500, -1000)
    leaderdest2 = vec2.new(-2000, 2000)
    leaderdest3 = vec2.new(-4500, -1500)
    leaderdest4 = vec2.new(2000, -6000)
    leaderdest5 = vec2.new(1000, -1500)

    squads = {}
    squads[1] = pilot.add("Four Winds Vendetta Quad", nil, leaderstart1)
    squads[2] = pilot.add("Four Winds Vendetta Quad", nil, leaderstart2)
    squads[3] = pilot.add("Four Winds Vendetta Quad", nil, leaderstart3)
    squads[4] = pilot.add("Four Winds Vendetta Quad", nil, leaderstart4)
    squads[5] = pilot.add("Four Winds Vendetta Quad", nil, leaderstart5)

    for _, squad in ipairs(squads) do
        for _, k in ipairs(squad) do
            hook.pilot(k, "attacked", "attacked")
            k:control()
            k:rmOutfit("all")
            k:addOutfit("Cheater's Laser Cannon", 6) -- Equip these fellas with unfair weaponry
            k:follow(squad[1]) -- Each ship in the squad follows the squad leader
        end
        squad[1]:taskClear() --...except the leader himself.
    end
    
    -- Shorthand notation for the leader pilots
    leader = {}
    leader[1] = squads[1][1]
    leader[2] = squads[2][1]
    leader[3] = squads[3][1]
    leader[4] = squads[4][1]
    leader[5] = squads[5][1]

    leaderVis(highlight)

    -- Kickstart the patrol sequence
    leader[1]:goto(leaderdest1, false)
    leader[2]:goto(leaderdest2, false)
    leader[3]:goto(leaderdest3, false)
    leader[4]:goto(leaderdest4, false)
    leader[5]:goto(leaderdest5, false)

    -- Set up the rest of the patrol sequence
    hook.pilot(leader[1], "idle", "leaderIdle")
    hook.pilot(leader[2], "idle", "leaderIdle")
    hook.pilot(leader[3], "idle", "leaderIdle")
    hook.pilot(leader[4], "idle", "leaderIdle")
    hook.pilot(leader[5], "idle", "leaderIdle")
end

function spawnGenbu()
    genbu = pilot.add("Genbu", nil, system.get("Anrique"))[1]
    genbu:rmOutfit("all")
    genbu:addOutfit("Cheater's Ragnarok Beam", 4) -- You can't win. Seriously.
    genbu:control()
    genbu:setHilight()
    genbu:setVisplayer()
    genbu:setHostile()
    genbu:attack(player.pilot())
end

-- Makes the squads either visible or hides them
function squadVis(visible)
    for _, squad in ipairs(squads) do
        for _, k in ipairs(squad) do
            k:setVisplayer(visible)
        end
    end
end

-- Makes the leaders visible or hides them, also highlights them (or not)
function leaderVis(visible)
    leader[1]:setVisplayer(visible)
    leader[1]:setHilight(visible)
    leader[2]:setVisplayer(visible)
    leader[2]:setHilight(visible)
    leader[3]:setVisplayer(visible)
    leader[3]:setHilight(visible)
    leader[4]:setVisplayer(visible)
    leader[4]:setHilight(visible)
    leader[5]:setVisplayer(visible)
    leader[5]:setHilight(visible)
end

-- Hook for hostile actions against a squad member
function attacked()
    for _, squad in ipairs(squads) do
        for _, k in ipairs(squad) do
            k:hookClear()
            k:control()
            k:attack(player.pilot())
        end
    end
end

-- Hook for the idle status of the leader of a squad.
-- Makes the squads patrol their routes.
function leaderIdle(pilot)
    if pilot == leader[1] then
        if tick1 then leader[1]:goto(leaderdest1, false)
        else leader[1]:goto(leaderstart1, false)
        end
        tick1 = not tick1
    elseif pilot == leader[2] then
        if tick1 then leader[2]:goto(leaderdest2, false)
        else leader[2]:goto(leaderstart2, false)
        end
        tick2 = not tick2
    elseif pilot == leader[3] then
        if tick3 then leader[3]:goto(leaderdest3, false)
        else leader[3]:goto(leaderstart3, false)
        end
        tick3 = not tick3
    elseif pilot == leader[4] then
        if tick1 then leader[4]:goto(leaderdest4, false)
        else leader[4]:goto(leaderstart4, false)
        end
        tick4 = not tick4
    elseif pilot == leader[5] then
        if tick5 then leader[5]:goto(leaderdest5, false)
        else leader[5]:goto(leaderstart5, false)
        end
        tick5 = not tick5
    end
end

-- Check if any of the patrolling leaders can see the player, and if so intercept.
function patrolPoll()
    for _, patroller in ipairs(leader) do
        if vec2.dist(player.pilot():pos(), patroller:pos()) < 1000 then
            patroller:broadcast(patrolcomm)
            attacked()
            return
        end
    end
    hook.timer(500, "patrolPoll")
end

-- Land hook
function land()
    if planet.cur() == jorekplanet1 and stage == 2 then
        -- Thank you player, but our SHITMAN is in another castle.
        tk.msg(NPCtitle, NPCtext)
        barmanNPC = misn.npcAdd("barman", "Barman", "thief2", NPCdesc, 4)
    elseif planet.cur() == jorekplanet2 and stage == 3 then
        joreknpc = misn.npcAdd("jorek", "Jorek", "jorek", Jordesc, 4)
    end
end

-- NPC hook
function barman()
    tk.msg(title[3], text[6]:format(player.name(), joreksys2:name(), jorekplanet2:name()))
    osd_msg[1] = osd_msg[0]:format(jorekplanet2:name(), joreksys2:name())
    misn.osdCreate(osd_title, osd_msg)
    misn.markerMove(marker, joreksys2)
    misn.npcRm(barmanNPC)
    stage = 3
end

-- NPC hook
function jorek()
    tk.msg(title[4], text[7]:format(player.name()))
    tk.msg(title[4], text[8])
    misn.npcRm(joreknpc)
    misn.cargoAdd("Jorek", 0)
    stage = 4
end

-- Capsule function for camera.set, for timer use
function zoomTo(target)
    camera.set(target, true)
end

-- Capsule function for player.msg, for timer use
function showText(text)
    player.msg(text)
end

-- Capsule function for player.pilot():control(), for timer use
function playerControl(status)
    player.pilot():control(status)
end

-- Poll for player proximity to a point in space. Will trigger when the player is NOT within the specified distance.
-- argument trigger: a table containing:
-- location: The target location
-- radius: The radius around the location
-- funcname: The name of the function to be called when the player is out of proximity.
function invProximity(trigger)
    if vec2.dist(player.pos(), trigger.location) >= trigger.radius then
        _G[trigger.funcname]()
    else
        hook.timer(500, "proximity", trigger)
    end
end

-- Handle the unsuccessful end of the mission.
function abort()
    var.pop("darkshadow_active")
    misn.finish(false)
end
