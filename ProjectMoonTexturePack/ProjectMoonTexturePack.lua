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


SMODS.Atlas{key = "cards_1", path = "8BitDeck.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "cards_2", path = "8BitDeck.png", px = 71, py = 95, prefix_config = { key = false } }
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
SMODS.Atlas{key = "stickers", path = "stickers.png", px = 71, py = 95, prefix_config = { key = false } }
SMODS.Atlas{key = "shop_sign", path = "ShopSignAnimation.png", px = 113, py = 57, prefix_config = { key = false }, atlas_table = 'ANIMATION_ATLAS', frames = 4 }




AltTexture{
    key = 'spectral',
    set = 'Spectral',
    path = 'Tarots.png',
    soul = 'Enhancers.png',
    original_sheet = true
}

TexturePack{
    key = 'pmtexturemod',
    textures = {
        'pmmod_spectral'
    }
}