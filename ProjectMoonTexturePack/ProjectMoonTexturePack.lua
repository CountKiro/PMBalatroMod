--- STEAMODDED HEADER
--- MOD_NAME: Project Moon Texture Pack
--- MOD_ID: ProjectMoonTexturePack
--- MOD_AUTHOR: [Kiro]
--- MOD_DESCRIPTION: Replaces most cards, consumables and UI elements with Project Moon related alternatives
--- PREFIX: pmmod
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]

----------------------------------------------
------------MOD CODE -------------------------



sendDebugMessage("Launching Project Moon Texture Pack!", "ProjectMoonTexturePack")

-- Hooks
local hook_list = {
	"game",
}
for _, hook in ipairs(hook_list) do
    local init, error = NFS.load(SMODS.current_mod.path .. "hooks/" .. hook ..".lua")
    if error then sendErrorMessage("PMTextureMod :: Failed to load "..hook.." with error "..error) else
        local data = init()
        sendDebugMessage("PMTextureMod :: Loaded hook: " .. hook)
    end
end

local possibleMainMenus = {"balatro.png", "balatro2.png", "balatro3.png", "balatro4.png"}


--SMODS.Atlas{key = "cards_1", path = "8BitDeck.png", px = 71, py = 95, prefix_config = { key = false } }
--SMODS.Atlas{key = "cards_2", path = "8BitDeck.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "blind_chips", path = "BlindChips.png", px = 34, py = 34, prefix_config = { key = false }, atlas_table = 'ANIMATION_ATLAS', frames = 21}
SMODS.Atlas{key = "Booster", path = "boosters.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "centers", path = "Enhancers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Joker", path = "Jokers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Planet", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Consumeable", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Tarot", path = "Tarots.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "Voucher", path = "Vouchers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "PMGoldenBough", path = "Enhancers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "chips", path = "chips.png", px = 29, py = 29, prefix_config = { key = false } }
SMODS.Atlas{key = "tags", path = "tags.png", px = 34, py = 34, prefix_config = { key = false } }
SMODS.Atlas{key = "stickers", path = "stickers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "shop_sign", path = "ShopSignAnimation.png", px = 113, py = 57, prefix_config = { key = false }, atlas_table = 'ANIMATION_ATLAS', frames = 4 }
SMODS.Atlas {key = "modicon",	path = "icon.png",	px = 32, py = 32}
if not next(SMODS.find_mod('KirosGameLogoMod')) then
	SMODS.Atlas {key = "balatro",	path = pseudorandom_element(possibleMainMenus),	px = 333, py = 216, prefix_config = { key = false }}
end

local atlas_hc = SMODS.Atlas{key = "PMSkinBlack", path = "8BitDeck.png", px = 71, py = 95,}
local icon_hc = SMODS.Atlas{key = "PMSkinIconBlack", path = "8BitDeck.png", px = 18, py = 18,}

local atlas_hc_white = SMODS.Atlas{key = "PMSkinWhite", path = "8BitDeck_White.png", px = 71, py = 95,}
local icon_hc_white = SMODS.Atlas{key = "PMSkinIconWhite", path = "8BitDeck_White.png", px =  18, py = 18,}

--Black deck skins

SMODS.DeckSkin{
    key = "pmCardsDarkHearts",
    suit = "Hearts",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsDarkSpades",
    suit = "Spades",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsDarkClubs",
    suit = "Clubs",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsDarkDiamonds",
    suit = "Diamonds",
    loc_txt =  'PM (Black)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc.key,
--			},
		},
	},
    
}

-- White deck skins



SMODS.DeckSkin{
    key = "pmCardsWhiteHearts",
    suit = "Hearts",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
      suit_icon = {
				atlas = atlas_hc_white.key,
			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsWhiteSpades",
    suit = "Spades",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsWhiteClubs",
    suit = "Clubs",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

SMODS.DeckSkin{
    key = "pmCardsWhiteDiamonds",
    suit = "Diamonds",
    loc_txt =  'PM (White)',
    palettes = {
		{
			key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
      suit_icon = {
				atlas = atlas_hc_white.key,
			},
		},
		{
			key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
			display_ranks = {"King", "Queen", "Jack"},
			atlas = atlas_hc_white.key,
			pos_style = 'deck',
			colour = HEX("9734f0"),
--      suit_icon = {
--				atlas = atlas_hc_white.key,
--			},
		},
	},
    
}

AltTexture{
    key = "spectral",
    set = "Spectral",
    path = "Tarots.png",
    soul = "Enhancers.png",
    loc_txt = {
        name = 'Spectral fixes'
    },
    original_sheet = true
}

AltTexture({
    key = 'whiteBaseCard',
    keys = {'c_base'},
    set = 'Enhanced',
    path = 'WhiteEnhancers.png',
    loc_txt = {
        name = 'White background enhancements'
    },
     original_sheet = true
})

AltTexture({
    key = 'whiteBaseCardEnhanced',
    set = 'Enhanced',
    path = 'WhiteEnhancers.png',
    loc_txt = {
        name = 'White card base'
    }
})


TexturePack{
    key = "pmSpectralTexturemod",
    loc_txt = {
        name = 'Spectral fixes',
        text = {'Fixes spectral cards','Required for Soul Card (Golden Bough)'},
    },
    textures = {
        "pmmod_spectral"
    }
}

TexturePack{
    key = "pmWhiteCards",
    loc_txt = {
        name = 'White backgrounds',
        text = {'White background for cards.','Make sure to select the appropriate Deck Skin','via Options -> Customize Deck','(REQUIRES RESTART)'},
    },
    textures = {
        "pmmod_whiteBaseCard",
        "pmmod_whiteBaseCardEnhanced"
    }
}

----------------------
-- JOKER OVERWRITES --
----------------------
--[[
SMODS.Joker:take_ownership('j_joker', 
  {
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge("The 8 o’Clock Circus", HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)
--]]
SMODS.Joker:take_ownership('j_greedy_joker', 
  {
  pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_thumb'), HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_lusty_joker', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_thumb'), HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_wrathful_joker', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_thumb'), HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_gluttenous_joker', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_thumb'), HEX('7d130f'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_jolly', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_liu'), HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_zany', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_wedge'), HEX('1c1c1c'), HEX('4387e0'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mad', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_circus'), HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_crazy', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_kurokumo'), HEX('292a2e'), HEX('6f7178'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_droll', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_hana'), HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_sly', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_liu'), HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_wily', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_wedge'), HEX('1c1c1c'), HEX('4387e0'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_clever', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_circus'), HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_devious', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_kurokumo'), HEX('292a2e'), HEX('6f7178'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_crafty', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_hana'), HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_half', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_charles'), HEX('3d3d3d'), HEX('b5b5b5'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_stencil', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_four_fingers', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_carnival'), HEX('242424'), HEX('8c0a0a'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mime', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_credit_card', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_rats'), HEX('3b2f28'), HEX('520f07'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ceremonial', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_banner', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_gaze'), HEX('332e2c'), HEX('9b3f9e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mystic_summit', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_gaze'), HEX('332e2c'), HEX('9b3f9e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_marble', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_bremen'), HEX('200921'), HEX('f016fa'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_loyalty_card', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_pierre'), HEX('c4c4c4'), HEX('960c0c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_8_ball', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_brotherhood'), HEX('303030'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_misprint', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_loveTown'), HEX('523f16'), HEX('f21b98'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_dusk', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_dawnOffice'), HEX('4a443d'), HEX('e0d482'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_raised_fist', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_strayDogs'), HEX('303030'), HEX('c7c7c7'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_chaos', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_yuns'), HEX('302c2c'), HEX('b5b1b1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_fibonacci', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_brotherhood'), HEX('303030'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_steel_joker', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_bremen'), HEX('200921'), HEX('f016fa'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_scary_face', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_hook'), HEX('542813'), HEX('dbdbdb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_abstract', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_RCorp'), HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_delayed_grat', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_rusted'), HEX('2b2727'), HEX('56755b'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hack', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_zwei'), HEX('23306e'), HEX('ab851d'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_pareidolia', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_gros_michel', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_shi'), HEX('212121'), HEX('8f1313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_even_steven', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_citizen'), HEX('828282'), HEX('ebebeb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_odd_todd', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_citizen'), HEX('828282'), HEX('ebebeb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_scholar', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_brotherhood'), HEX('303030'), HEX('c29c29'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_business', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_hook'), HEX('542813'), HEX('dbdbdb'), 1.2 )
         end
  }, true)
  
SMODS.Joker:take_ownership('j_supernova', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_dawnOffice'), HEX('4a443d'), HEX('e0d482'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ride_the_bus', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_space', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_charles'), HEX('3d3d3d'), HEX('b5b5b5'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_egg', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_smiling'), HEX('521612'), HEX('d1d1d1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_burglar', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_streetlight'), HEX('232b2e'), HEX('8d9ba1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_blackboard', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_liu'), HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_runner', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_strayDogs'), HEX('303030'), HEX('c7c7c7'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ice_cream', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_sweepers'), HEX('2e3138'), HEX('a6190f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_dna', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_RCorp'), HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_splash', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_carnival'), HEX('242424'), HEX('8c0a0a'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_blue_joker', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_gaze'), HEX('332e2c'), HEX('9b3f9e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_sixth_sense', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_shi'), HEX('212121'), HEX('8f1313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_constellation', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hiker', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_strayDogs'), HEX('303030'), HEX('c7c7c7'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_faceless', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_molar'), HEX('595447'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_green_joker', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_WCorp'), HEX('24303b'), HEX('0078e6'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_superposition', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_liu'), HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_todo_list', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_cavendish', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_card_sharp', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_seven'), HEX('234a39'), HEX('b59c36'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_red_card', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_liu'), HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_madness', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_square', 
  {
    pronouns = "he_him",
  display_size = { w = 71, h = 95 },
  pixel_size = { w = 71, h = 130 },
  set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('badge_molar'), HEX('23306e'), HEX('ab851d'), 1.2 )
 	end
  }, true)

SMODS.Joker:take_ownership('j_seance', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_riff_raff', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_vampire', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_shortcut', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_carnival'), HEX('242424'), HEX('8c0a0a'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hologram', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_eye'), HEX('242424'), HEX('e0c02f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_vagabond', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_rats'), HEX('3b2f28'), HEX('520f07'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_baron', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_cloud_9', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_cane'), HEX('242424'), HEX('e87a20'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_rocket', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_cane'), HEX('242424'), HEX('e87a20'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_obelisk', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_WCorp'), HEX('24303b'), HEX('0078e6'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_midas_mask', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_luchador', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_yuns'), HEX('302c2c'), HEX('b5b1b1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_photograph', 
  {
    pronouns = "he_him",
  display_size = { w = 71, h = 95 },
  pixel_size = { w = 71, h = 115 },
  set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('badge_zwei'), HEX('23306e'), HEX('ab851d'), 1.2 )
 	end
  }, true)

SMODS.Joker:take_ownership('j_gift', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_fullStop'), HEX('3b3a38'), HEX('b59348'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_turtle_bean', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_erosion', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_streetlight'), HEX('232b2e'), HEX('8d9ba1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_reserved_parking', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_fullStop'), HEX('3b3a38'), HEX('b59348'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mail', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_to_the_moon', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_fullStop'), HEX('3b3a38'), HEX('b59348'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hallucination', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_leaflet'), HEX('240e0a'), HEX('613229'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_fortune_teller', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_smiling'), HEX('521612'), HEX('d1d1d1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_juggler', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_drunkard', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_molar'), HEX('595447'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_stone', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_bremen'), HEX('200921'), HEX('f016fa'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_golden', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_cane'), HEX('242424'), HEX('e87a20'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_lucky_cat', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_fixer'), HEX('1c1c1c'), HEX('808080'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_baseball', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_streetlight'), HEX('232b2e'), HEX('8d9ba1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_bull', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_RCorp'), HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_diet_cola', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_trading', 
  {
    pronouns = "he_him",
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_shi'), HEX('212121'), HEX('8f1313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_flash', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_yuns'), HEX('302c2c'), HEX('b5b1b1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_popcorn', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_sweepers'), HEX('2e3138'), HEX('a6190f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_trousers', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_circus'), HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ancient', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_bayard'), HEX('283623'), HEX('bfbfbf'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ramen', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_pierre'), HEX('c4c4c4'), HEX('960c0c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_walkie_talkie', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_zwei'), HEX('23306e'), HEX('ab851d'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_selzer', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_LCorp'), HEX('b82c2c'), HEX('f2e396'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_castle', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_smiley', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_hook'), HEX('542813'), HEX('dbdbdb'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_campfire', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_WCorp'), HEX('24303b'), HEX('0078e6'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ticket', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_rats'), HEX('3b2f28'), HEX('520f07'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_mr_bones', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_sweepers'), HEX('2e3138'), HEX('a6190f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_acrobat', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blade'), HEX('26292e'), HEX('a81338'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_sock_and_buskin', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_swashbuckler', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_RCorp'), HEX('2e2b2b'), HEX('c4560c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_troubadour', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_certificate', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_nightAwls'), HEX('2b2b2b'), HEX('a1a1a1'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_smeared', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_throwback', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_mirae'), HEX('463a54'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hanging_chad', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_rough_gem', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_bloodstone', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_arrowhead', 
  {
    pronouns = "they_them",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_onyx_agate', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_blueReverberation'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_glass', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_ring_master', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_flower_pot', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_blueprint', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_head'), HEX('242424'), HEX('e0c02f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_wee', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_circus'), HEX('851734'), HEX('e8e6e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_merry_andy', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_molar'), HEX('595447'), HEX('c9c9c9'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_oops', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_idol', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_seeing_double', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_matador', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_LCorp'), HEX('b82c2c'), HEX('f2e396'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_hit_the_road', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_duo', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_liu'), HEX('9e0000'), HEX('e8970c'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_trio', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_wedge'), HEX('1c1c1c'), HEX('4387e0'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_family', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_order', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_kurokumo'), HEX('292a2e'), HEX('6f7178'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_tribe', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_hana'), HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_stuntman', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_invisible', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_brainstorm', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_claw'), HEX('242424'), HEX('e0c02f'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_satellite', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_shoot_the_moon', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_drivers_license', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_cartomancer', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_astronomer', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_library'), HEX('998350'), HEX('0cf07e'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_burnt', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_dawnOffice'), HEX('4a443d'), HEX('e0d482'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_bootstraps', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_caino', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_colorFixer'), HEX('495c3a'), HEX('330606'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_triboulet', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_colorFixer'), HEX('330606'), HEX('db0707'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_yorick', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_colorFixer'), HEX('09479e'), HEX('cfae42'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_chicot', 
  {
    pronouns = "she_her",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_colorFixer'), HEX('1c1c1c'), HEX('9e13bd'), 1.2 )
         end
  }, true)

SMODS.Joker:take_ownership('j_perkeo', 
  {
    pronouns = "he_him",
  set_badges = function(self, card, badges)
                 badges[#badges+1] = create_badge(localize('badge_colorFixer'), HEX('1c1c1c'), HEX('808080'), 1.2 )
         end
  }, true)

SMODS.Shader{key = 'debuffGold', path = 'debuffGold.fs'}
SMODS.Shader{key = 'sepia', path = 'negative.fs'}




G.SHADERS['negative'] = love.graphics.newShader(NFS.read(SMODS.current_mod.path..'assets/shaders/negative.fs'))

--watch shader Mods/ProjectMoonTexturePack/assets/shaders/negative.fs