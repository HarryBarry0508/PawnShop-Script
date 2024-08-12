HarryBarry = {}

-- Item Layout {Label = '(Name You Want Displayed In The menu)', name = '(Spawn Name For Item)', price = (Price Of The Item)},

HarryBarry['SellPed1'] = {
}

-- Item Layout {Label = '(Name You Want Displayed In The menu)', name = '(Spawn Name For Item)', price = (Price Of The Item)},

HarryBarry['SellPed2'] = {
}

-- Item Layout {Label = '(Name You Want Displayed In The menu)', name = '(Spawn Name For Item)', price = (Price Of The Item)},

HarryBarry['SellPed3'] = {
}


HarryBarry['Coords'] = {
    SellPed1 = {
        ['SellPed1'] = { 
            coords = vec3(539.39, -177.01, 54.48), -- Change Vec3 Cords If Needed
            npc = {ped = 0xE7565327, anim = "WORLD_HUMAN_CLIPBOARD", x = 539.39, y = -177.01, z = 54.48, h = 91.52},
        },
          --Change Ped Code If needed                               Change Cords if you changed the vec3 Cords above

    },
    SellPed2 = {
        ['SellPed2'] = {
            coords = vec3(539.47, -179.97, 54.48), -- Change Vec3 Cords If Needed
            npc = {ped = 0x6BD9B68C, anim = "WORLD_HUMAN_CLIPBOARD", x = 539.47, y = -179.97, z = 54.48, h = 92.94},
        },
          --Change Ped Code If needed                               Change Cords if you changed the vec3 Cords above

    },
    SellPed3 = {
        ['SellPed3'] = {
            coords = vec3(539.42, -182.96, 54.48), -- Change Vec3 Cords If Needed
            npc = {ped = 0x6BD9B68C, anim = "WORLD_HUMAN_CLIPBOARD", x = 539.42, y = -182.96, z = 54.48, h = 97.3},
        },
          --Change Ped Code If needed                               Change Cords if you changed the vec3 Cords above

    },
}

HarryBarry['Locales'] = {
    ['invaliditem'] = 'You have selected an invalid item',
    ['solditem'] = 'You selled this item amount: ',
    ['noitemtosell'] = 'You need this item to do this: ',
    ['inventoryfull'] = 'Your inventory is full',
    ['boughtitem'] = 'Item purchased',
}




