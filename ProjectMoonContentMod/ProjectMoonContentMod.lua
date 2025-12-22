sendDebugMessage("Launching Project Moon Content Mod!", "ProjectMoonContentMod")

ProjectMoonMod = {}


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
SMODS.load_file("objects/editions.lua")()

---------------------
-- Preparing atlas --
---------------------
---


SMODS.Atlas {key = "ModdedProjectMoon",	path = "newProjectMoonJokers.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoon2",	path = "newProjectMoonJokers2.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoonTrue",	path = "newProjectMoonTrueJokers.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoonSpectrals",	path = "newProjectMoonSpectrals.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoonEditions",	path = "newProjectMoonEditions.png",	px = 71, py = 95}
SMODS.Atlas {key = "modicon",	path = "icon.png",	px = 32, py = 32}

SMODS.Shader{key = 'charge', path = 'charge.fs'}
----------------------------
-- Talisman Compatibility --
----------------------------

to_big = to_big or function(x)
    return x
end


-- Config Options --

--SMODS.current_mod.config_tab = function()
--    return {n=G.UIT.ROOT, config = {align = "cm", padding = 0.05, colour = G.C.CLEAR}, nodes={
--        create_toggle({label = localize("k_unlock_all"), ref_table = ProjectMoonMod.config, ref_value = "temporary_unlock_all"}),
--    }}
--end


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

-- Thumb
SMODS.ObjectType({
	key = "Thumb",
	default = "j_greedy_joker",
	cards = {
		["j_greedy_joker"] = true, 	--Aspect of Kalo
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_greedy_joker)
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
	key = "Bloodfiends",
	default = "j_seeing_double",
	cards = {
		["j_seeing_double"] = true, --Don Quixote
		["j_bloodstone"] = true, --Blood-red Night
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

-- Puppets
SMODS.ObjectType({
	key = "Puppets",
	default = "pmcmod_j_joker",
	cards = {
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

--Aspects
SMODS.ObjectType({
	key = "Aspects",
	default = "j_joker",
	cards = {
		["j_joker"] = true,
		["j_riff_raff"] = true,
		["j_greedy_joker"] = true,
		["j_lusty_joker"] = true,
		["j_wrathful_joker"] = true,
		["j_gluttenous_joker"] = true,
		["j_turtle_bean"] = true,
		["j_troubadour"] = true,
		["j_juggler"] = true,
		["j_half"] = true,
		["j_onyx_agate"] = true,
		["j_abstract"] = true,
		["j_swashbuckler"] = true,
		["j_bull"] = true,
		["j_constellation"] = true,
		["j_midas_mask"] = true,
		["j_hit_the_road"] = true,
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

--Aspects
SMODS.ObjectType({
	key = "TrueVersion",
	default = "j_pmcmod_oswald",
	cards = {
		["j_pmcmod_oswald"] = true,
		["j_pmcmod_angelaLoR"] = true,
		["j_pmcmod_kalo"] = true,
		["j_pmcmod_katriel"] = true,
		["j_pmcmod_denis"] = true,
		["j_pmcmod_boris"] = true,
		["j_pmcmod_esther"] = true,
		["j_pmcmod_gloria"] = true,
		["j_pmcmod_rubert"] = true,
		["j_pmcmod_angelica"] = true,
		["j_pmcmod_puppeteer"] = true,
		["j_pmcmod_nikolai"] = true,
		["j_pmcmod_rudolph"] = true,
		["j_pmcmod_maxim"] = true,
		["j_pmcmod_yisang"] = true,
		["j_pmcmod_ishmael"] = true,
		["j_pmcmod_heathcliff"] = true,
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)

	end,
})

-- QUIPS --

SMODS.JimboQuip({
    key = 'roland',
    extra = {
        center = 'j_stencil',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_stencil')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'malkuth',
    extra = {
        center = 'j_sock_and_buskin',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_sock_and_buskin')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'yesod',
    extra = {
        center = 'j_smeared',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_smeared')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'hod',
    extra = {
        center = 'j_pareidolia',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_pareidolia')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'netzach',
    extra = {
        center = 'j_satellite',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_satellite')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'tiph',
    extra = {
        center = 'j_shoot_the_moon',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_shoot_the_moon')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'gebura',
    extra = {
        center = 'j_stuntman',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_stuntman')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'chesed',
    extra = {
        center = 'j_castle',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_castle')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'hokma',
    extra = {
        center = 'j_cartomancer',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_cartomancer')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'binah',
    extra = {
        center = 'j_astronomer',
    },
    filter = function(self, type)
        if next(SMODS.find_card('j_astronomer')) then
            if type == 'win' then
                self.extra.text_key = self.key..'_win'
                return true, { weight = 100 }
            elseif type == 'loss' then
                self.extra.text_key = self.key..'_loss'
                return true, { weight = 100 }
            end
        end
    end
})

-- DUMMY CARD AREA

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.pmcmod_dummy_joker_area = CardArea(
        0,
        0,
        self.CARD_W * 1.9,
        self.CARD_H * 0.95,
        {
            card_limit = 999,
            type = 'joker',
            highlight_limit = 1,
        }
    )
	self.pmcmod_dummy_joker_area.states.visible = false
    ProjectMoonMod.dummyJoker = G.pmcmod_dummy_joker_area

    game_start_run_ref(self, args)
end

local card_set_cost_voucher = Card.set_cost
function Card:set_cost()
    card_set_cost_voucher(self)
    if next(SMODS.find_card("j_pmcmod_santata")) then
        if (self.ability.set == 'Voucher') then self.cost = 0 end
    end
end

SMODS.DrawStep {
    key = "censoring",
    order = 11,
    func = function(card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            local censoredPresent = false
            local pinnocchioPresent = false

            if G.GAME and G.GAME.blind then
                if G.jokers then
                    for i=1, #G.jokers.cards do
                        if G.jokers.cards[i].config.center.key == "j_pmcmod_censored" then
                            censoredPresent = true
                            break
                        end

                        if G.jokers.cards[i].config.center.key == "j_pmcmod_pinnocchio" then
                            pinnocchioPresent = true
                            break
                        end
                    end
                end
                if censoredPresent == true and card.ability.set == 'Joker' and not (card.children.center.sprite_pos.x == 2 and card.children.center.sprite_pos.y == 1 and card.children.center.atlas == G.ASSET_ATLAS["pmcmod_ModdedProjectMoonEditions"]) then
                --card.children.center = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["pmcmod_ModdedProjectMoon2"], {x = 0, y = 0})
                        card.children.center.atlas = G.ASSET_ATLAS["pmcmod_ModdedProjectMoonEditions"]
                        card.children.center:set_sprite_pos({x = 2, y = 1})
						if card.children.floating_sprite then
							card.children.floating_sprite.atlas = G.ASSET_ATLAS["pmcmod_ModdedProjectMoonEditions"]
							card.children.floating_sprite:set_sprite_pos({x = 2, y = 1})
						end
                end
            end
        end
    end
}
