sendDebugMessage("Launching Project Moon Content Mod!", "ProjectMoonContentMod")

SMODS.current_mod.optional_features = function()
    return {
        retrigger_joker = true
    }
end

-------------------
-- Loading files --
-------------------

if (SMODS.Mods['partner'] or {}).can_load or false then SMODS.load_file('objects/partners.lua')() end
if (SMODS.Mods['CardSleeves'] or {}).can_load or false then SMODS.load_file('objects/sleeves.lua')() end
SMODS.load_file("objects/backs.lua")()
SMODS.load_file("objects/enhancements.lua")()
SMODS.load_file("objects/jokers.lua")()
SMODS.load_file("objects/seals.lua")()
SMODS.load_file("objects/spectrals.lua")()

---------------------
-- Preparing atlas --
---------------------

SMODS.Atlas {key = "ModdedProjectMoon",	path = "newProjectMoonJokers.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoonSpectrals",	path = "newProjectMoonSpectrals.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoonEditions",	path = "newProjectMoonEditions.png",	px = 71, py = 95}
SMODS.Atlas {key = "modicon",	path = "icon.png",	px = 32, py = 32}


----------------------------
-- Talisman Compatibility --
----------------------------

to_big = to_big or function(x)
    return x
end


-- Config Options --

SMODS.current_mod.config_tab = function()
    return {n=G.UIT.ROOT, config = {align = "cm", padding = 0.05, colour = G.C.CLEAR}, nodes={
        create_toggle({label = localize("k_unlock_all"), ref_table = Partner_API.config, ref_value = "temporary_unlock_all"}),
    }}
end


-------------------

SMODS.Sound{
	key = 'gubo_aim',
	path = 'gubo_aim.ogg',
	pitch = 0.7,
	volume = 0.6,
}


SMODS.Sound{
	key = 'gubo_shoot',
	path = 'gubo_shoot.ogg',
	pitch = 0.7,
	volume = 0.6,
}


------------------
-- Object Types --
------------------

--Sinners
-- K Corp
SMODS.ObjectType({
	key = "Sinners",
	default = "j_ring_master",
	cards = {
		["j_ring_master"] = true, 	--Gregor
		["j_bootstraps"] = true, 	--Rodya
		["j_idol"] = true, 			--Sinclair
		["j_constellation"] = true, --Yi Sang
		["j_midas_mask"] = true, 	--Ishamel
		["j_hit_the_road"] = true, 	--Heathcliff
		["j_seeing_double"] = true, --Don Quixote
		["j_diet_cola"] = true, 	--Hong Lu
		["j_flower_pot"] = true, 	--Ryoshu
		["j_baron"] = true, 		--Meursault
		["j_hanging_chad"] = true, 	--Outis
		["j_oops"] = true, 			--Faust
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_ring_master)
		self:inject_card(G.P_CENTERS.j_bootstraps)
		self:inject_card(G.P_CENTERS.j_idol)
		self:inject_card(G.P_CENTERS.j_constellation)
		self:inject_card(G.P_CENTERS.j_midas_mask)
		self:inject_card(G.P_CENTERS.j_hit_the_road)
		self:inject_card(G.P_CENTERS.j_seeing_double)
		self:inject_card(G.P_CENTERS.j_diet_cola)
		self:inject_card(G.P_CENTERS.j_flower_pot)
		self:inject_card(G.P_CENTERS.j_baron)
		self:inject_card(G.P_CENTERS.j_hanging_chad)
		self:inject_card(G.P_CENTERS.j_oops)
	end,
})

-- Heretics
SMODS.ObjectType({
	key = "Heretics",
	default = "j_four_fingers",
	cards = {
 		["j_four_fingers"] = true, 	--Gamma
 		["j_mime"] = true,			--Eilleen
		["j_banner"] = true,		--Dalloc
		["j_8_ball"] = true,		--Arnold
		["j_fibonacci"] = true,		--Consta
		["j_scholar"] = true,		--Mo
		["j_egg"] = true,			--Mi
		["j_splash"] = true,		--Beta
		["j_blue_joker"] = true,	--Alloc
		["j_ride_the_bus"] = true,	--Manager Dante
		["j_square_joker"] = true,	--Jin
		["j_seance"] = true,		--Jae-heon
		["j_riff_raff"] = true,		--Angela
		["j_shortcut"] = true,		--Alpha
		["j_hologram"] = true,		--Luda
		["j_rocket"] = true,		--Nemo
		["j_fortune_teller"] = true,--Wang
		["j_smiley_face"] = true,	--Taein
		["j_troubadour"] = true,	--Gloria
		["j_certificate"] = true,	--Allen
		["j_onyx_agate"] = true,	--The Puppeteer
		["j_glass_joker"] = true,	--Distorted Yan
		["j_brainstorm"] = true,	--Baral
		["j_joker"] = true,			--Oswald
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_four_fingers)
		self:inject_card(G.P_CENTERS.j_mime)
		self:inject_card(G.P_CENTERS.j_banner)
		self:inject_card(G.P_CENTERS.j_8_ball)
		self:inject_card(G.P_CENTERS.j_fibonacci)
		self:inject_card(G.P_CENTERS.j_scholar)
		self:inject_card(G.P_CENTERS.j_egg)
		self:inject_card(G.P_CENTERS.j_splash)
		self:inject_card(G.P_CENTERS.j_blue_joker)
		self:inject_card(G.P_CENTERS.j_ride_the_bus)
		self:inject_card(G.P_CENTERS.j_square)
		self:inject_card(G.P_CENTERS.j_seance)
		self:inject_card(G.P_CENTERS.j_riff_raff)
		self:inject_card(G.P_CENTERS.j_shortcut)
		self:inject_card(G.P_CENTERS.j_hologram)
		self:inject_card(G.P_CENTERS.j_rocket)
		self:inject_card(G.P_CENTERS.j_fortune_teller)
		self:inject_card(G.P_CENTERS.j_smiley)
		self:inject_card(G.P_CENTERS.j_troubadour)
		self:inject_card(G.P_CENTERS.j_certificate)
		self:inject_card(G.P_CENTERS.j_onyx_agate)
		self:inject_card(G.P_CENTERS.j_glass)
		self:inject_card(G.P_CENTERS.j_brainstorm)
		self:inject_card(G.P_CENTERS.j_mystic_summit)
	end,
})

--Demian's Group
SMODS.ObjectType({
	key = "DemiansGroup",
	default = "pmcmod_j_demian",
	cards = {
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

--Hell's Kitchen
SMODS.ObjectType({
	key = "HellsKitchen",
	default = "pmcmod_j_chickenA",
	cards = {
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

-- Bloodfiend
SMODS.ObjectType({
	key = "Bloodfiend",
	default = "j_seeing_double",
	cards = {
		["j_seeing_double"] = true, --Don Quixote
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_seeing_double)
	end,
})

-- New League of Nine
SMODS.ObjectType({
	key = "NewLeagueOfNine",
	default = "pmcmod_j_sonya",
	cards = {
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

-- N Corp
SMODS.ObjectType({
	key = "NCorp",
	default = "pmcmod_j_kromer",
	cards = {
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

-- K Corp
SMODS.ObjectType({
	key = "KCorp",
	default = "pmcmod_j_dongrang",
	cards = {
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})




