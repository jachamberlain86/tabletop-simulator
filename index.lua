--Part of original CE code
--Runs whenever game is saved/autosaved
function onSave()
  local data_to_save = {}
  saved_data = JSON.encode(data_to_save)
  --saved_data = "" --Remove -- at start + save to clear save data
  return saved_data
end
--Runs when game is loaded
function onLoad(saved_data)
  --Loads the tracking for if the game has started yet
  if saved_data ~= "" then
      local loaded_data = JSON.decode(saved_data)
  else
  end--
  --Establish static objects
  obj_gate = getObjectFromGUID("fb12fb")
  startLuaCoroutine(Global, "shipCounter_routine")
  --[[
  --Used to place the original displays, not used for gameplay
  local obj_example = getObjectFromGUID("814855")
  for _, planetGUID in ipairs(ref_planetGUID) do
      local planet = getObjectFromGUID(planetGUID)
      --
      local pos = planet.getPosition()
      local display = obj_example.clone({ position=pos })
      display.setLock(true)
      display.setPosition(pos)
      display.setScale({2.3,2,2.3})
      --
      local rot = {0, math.deg(math.atan2(-pos.z, pos.x))-90, 0}
      display.setRotation(rot)
      --display.createButton({
      --    label="TEST", click_function="none",
      --    position={0,0.29,0}, height=0, width=0, font_size=800,
      --})
      pos = display.positionToWorld({0,-0.15,-3.6})
      display.setPosition(pos)
  end
  ]]
  --Interactable disabled items 5726c5 = room/table
  ref_noninteractable = {
      "5726c5","d98e62","231021","45d183","5527d8","86af80", "2242a7",
      "5bccf0","1eeb03","81e3bc","5726c5",
      --Black
      "ff28e4","d2ad1e","8fe3c2","163511","db0a54",
      --Orange
      "551b0a","96527d","850e2f","79af97","922d68",
      --Red
      "67cdc4","5bd5c6","423f38","dc3df8","d88d2e",
      --Blue
      "66107c","9be08d","5ffdaf","ed2d1b","62ec0b",
      --Yellow
      "02a661","1e34f2","487ca2","130d90","5320f0",
      --Purple
      "59e941","bb747a","f7c754","74b922","91a579",
      --Green
      "86262a","39c531","99d6ea","4914d1","cae184",
      --White
      "9cf22a","e8718a","9d3db3","85c253","98adff",
  }
  --Disables interactable status of objects with GUID in list
  for _, guid in ipairs(ref_noninteractable) do
      local obj = getObjectFromGUID(guid)
      if obj then obj.interactable = false end
  end

  --Used for automated game setup interface.
  aliensBoardGUID = "be1e26"
  aliensBoard = getObjectFromGUID(aliensBoardGUID)
  playerCountBoardGUID = 'a578c6'
  playerCountBoard = getObjectFromGUID(playerCountBoardGUID)
  setUpBoardGUID = '59030d'
  setUpBoard = getObjectFromGUID(setUpBoardGUID)
  gameStartBoardGUID = 'b3f927'
  gameStartBoard = getObjectFromGUID(gameStartBoardGUID)

  --Used to prevent game setup loading when it's missing during back up history.
  aliensTokenGUID = "a1e63e"
  aliensToken = getObjectFromGUID(aliensTokenGUID)
  playerCountTokenGUID = '0d7004'
  playerCountToken = getObjectFromGUID(playerCountTokenGUID)
  setUpTokenGUID = 'bbe251'
  setUpToken = getObjectFromGUID(setUpTokenGUID)
  gameStartTokenGUID = 'e00b8e'
  gameStartToken = getObjectFromGUID(gameStartTokenGUID)

  --Unused components will be stored here
  gameBoxGUID = '141c15'
  gameBox = getObjectFromGUID(gameBoxGUID)

  --Set up planet tokens, ship stacks, and destiny cards
  --Black
  planetBlack1GUID = "47c8bd"
  planetBlack1 = getObjectFromGUID(planetBlack1GUID)
  planetBlack2GUID = "ae7107"
  planetBlack2 = getObjectFromGUID(planetBlack2GUID)
  planetBlack3GUID = "2e92de"
  planetBlack3 = getObjectFromGUID(planetBlack3GUID)
  planetBlack4GUID = "59514b"
  planetBlack4 = getObjectFromGUID(planetBlack4GUID)
  planetBlack5GUID = "0e5bdf"
  planetBlack5 = getObjectFromGUID(planetBlack5GUID)

  shipsBlack1GUID = "c68b76"
  shipsBlack1 = getObjectFromGUID(shipsBlack1GUID)
  shipsBlack2GUID = "21a787"
  shipsBlack2 = getObjectFromGUID(shipsBlack2GUID)
  shipsBlack3GUID = "6867bf"
  shipsBlack3 = getObjectFromGUID(shipsBlack3GUID)
  shipsBlack4GUID = "7e6922"
  shipsBlack4 = getObjectFromGUID(shipsBlack4GUID)
  shipsBlack5GUID = "b1a511"
  shipsBlack5 = getObjectFromGUID(shipsBlack5GUID)

  destinyBlackGUID = "9a39d7"
  destinyBlack = getObjectFromGUID(destinyBlackGUID)

  playerTokenBlackGUID = "04da8e"
  playerTokenBlack = getObjectFromGUID(playerTokenBlackGUID)
  --Orange
  planetOrange1GUID = "e83ea8"
  planetOrange1 = getObjectFromGUID(planetOrange1GUID)
  planetOrange2GUID = "ad3ae9"
  planetOrange2 = getObjectFromGUID(planetOrange2GUID)
  planetOrange3GUID = "f31934"
  planetOrange3 = getObjectFromGUID(planetOrange3GUID)
  planetOrange4GUID = "479ed0"
  planetOrange4 = getObjectFromGUID(planetOrange4GUID)
  planetOrange5GUID = "6d5d93"
  planetOrange5 = getObjectFromGUID(planetOrange5GUID)

  shipsOrange1GUID = "379bb3"
  shipsOrange1 = getObjectFromGUID(shipsOrange1GUID)
  shipsOrange2GUID = "cfeb2a"
  shipsOrange2 = getObjectFromGUID(shipsOrange2GUID)
  shipsOrange3GUID = "e9f4f9"
  shipsOrange3 = getObjectFromGUID(shipsOrange3GUID)
  shipsOrange4GUID = "ab50fa"
  shipsOrange4 = getObjectFromGUID(shipsOrange4GUID)
  shipsOrange5GUID = "586da5"
  shipsOrange5 = getObjectFromGUID(shipsOrange5GUID)

  destinyOrangeGUID = "4b86ec"
  destinyOrange = getObjectFromGUID(destinyOrangeGUID)

  playerTokenOrangeGUID = "f0414a"
  playerTokenOrange = getObjectFromGUID(playerTokenOrangeGUID)
  --Red
  planetRed1GUID = "f7a8a8"
  planetRed1 = getObjectFromGUID(planetRed1GUID)
  planetRed2GUID = "e15716"
  planetRed2 = getObjectFromGUID(planetRed2GUID)
  planetRed3GUID = "ce7bec"
  planetRed3 = getObjectFromGUID(planetRed3GUID)
  planetRed4GUID = "409a10"
  planetRed4 = getObjectFromGUID(planetRed4GUID)
  planetRed5GUID = "bd7d84"
  planetRed5 = getObjectFromGUID(planetRed5GUID)

  shipsRed1GUID = "d04074"
  shipsRed1 = getObjectFromGUID(shipsRed1GUID)
  shipsRed2GUID = "b3b4a9"
  shipsRed2 = getObjectFromGUID(shipsRed2GUID)
  shipsRed3GUID = "2344e1"
  shipsRed3 = getObjectFromGUID(shipsRed3GUID)
  shipsRed4GUID = "e652dd"
  shipsRed4 = getObjectFromGUID(shipsRed4GUID)
  shipsRed5GUID = "06fb96"
  shipsRed5 = getObjectFromGUID(shipsRed5GUID)

  destinyRedGUID = "57f575"
  destinyRed = getObjectFromGUID(destinyRedGUID)

  playerTokenRedGUID = "6c11e9"
  playerTokenRed = getObjectFromGUID(playerTokenRedGUID)
  --Blue
  planetBlue1GUID = "1e20d7"
  planetBlue1 = getObjectFromGUID(planetBlue1GUID)
  planetBlue2GUID = "3f3122"
  planetBlue2 = getObjectFromGUID(planetBlue2GUID)
  planetBlue3GUID = "111138"
  planetBlue3 = getObjectFromGUID(planetBlue3GUID)
  planetBlue4GUID = "10d6d4"
  planetBlue4 = getObjectFromGUID(planetBlue4GUID)
  planetBlue5GUID = "2e1f42"
  planetBlue5 = getObjectFromGUID(planetBlue5GUID)

  shipsBlue1GUID = "26a06e"
  shipsBlue1 = getObjectFromGUID(shipsBlue1GUID)
  shipsBlue2GUID = "ee0073"
  shipsBlue2 = getObjectFromGUID(shipsBlue2GUID)
  shipsBlue3GUID = "dedd81"
  shipsBlue3 = getObjectFromGUID(shipsBlue3GUID)
  shipsBlue4GUID = "ea35a5"
  shipsBlue4 = getObjectFromGUID(shipsBlue4GUID)
  shipsBlue5GUID = "b85a10"
  shipsBlue5 = getObjectFromGUID(shipsBlue5GUID)

  destinyBlueGUID = "89e515"
  destinyBlue = getObjectFromGUID(destinyBlueGUID)

  playerTokenBlueGUID = "f0e732"
  playerTokenBlue = getObjectFromGUID(playerTokenBlueGUID)
  --Yellow
  planetYellow1GUID = "af511f"
  planetYellow1 = getObjectFromGUID(planetYellow1GUID)
  planetYellow2GUID = "cc520a"
  planetYellow2 = getObjectFromGUID(planetYellow2GUID)
  planetYellow3GUID = "ad7542"
  planetYellow3 = getObjectFromGUID(planetYellow3GUID)
  planetYellow4GUID = "f3abce"
  planetYellow4 = getObjectFromGUID(planetYellow4GUID)
  planetYellow5GUID = "a443ae"
  planetYellow5 = getObjectFromGUID(planetYellow5GUID)

  shipsYellow1GUID = "b48b7e"
  shipsYellow1 = getObjectFromGUID(shipsYellow1GUID)
  shipsYellow2GUID = "b9858f"
  shipsYellow2 = getObjectFromGUID(shipsYellow2GUID)
  shipsYellow3GUID = "b318bd"
  shipsYellow3 = getObjectFromGUID(shipsYellow3GUID)
  shipsYellow4GUID = "c8b262"
  shipsYellow4 = getObjectFromGUID(shipsYellow4GUID)
  shipsYellow5GUID = "612491"
  shipsYellow5 = getObjectFromGUID(shipsYellow5GUID)

  destinyYellowGUID = "3089e3"
  destinyYellow = getObjectFromGUID(destinyYellowGUID)

  playerTokenYellowGUID = "64a504"
  playerTokenYellow = getObjectFromGUID(playerTokenYellowGUID)
  --Purple
  planetPurple1GUID = "bb0770"
  planetPurple1 = getObjectFromGUID(planetPurple1GUID)
  planetPurple2GUID = "b55714"
  planetPurple2 = getObjectFromGUID(planetPurple2GUID)
  planetPurple3GUID = "e7299b"
  planetPurple3 = getObjectFromGUID(planetPurple3GUID)
  planetPurple4GUID = "900eae"
  planetPurple4 = getObjectFromGUID(planetPurple4GUID)
  planetPurple5GUID = "8647c4"
  planetPurple5 = getObjectFromGUID(planetPurple5GUID)

  shipsPurple1GUID = "8e3ee6"
  shipsPurple1 = getObjectFromGUID(shipsPurple1GUID)
  shipsPurple2GUID = "bb2a6f"
  shipsPurple2 = getObjectFromGUID(shipsPurple2GUID)
  shipsPurple3GUID = "7e58e4"
  shipsPurple3 = getObjectFromGUID(shipsPurple3GUID)
  shipsPurple4GUID = "9fc178"
  shipsPurple4 = getObjectFromGUID(shipsPurple4GUID)
  shipsPurple5GUID = "81a67f"
  shipsPurple5 = getObjectFromGUID(shipsPurple5GUID)

  destinyPurpleGUID = "ac560c"
  destinyPurple = getObjectFromGUID(destinyPurpleGUID)

  playerTokenPurpleGUID = "86aab7"
  playerTokenPurple = getObjectFromGUID(playerTokenPurpleGUID)
  --Green
  planetGreen1GUID = "a7c668"
  planetGreen1 = getObjectFromGUID(planetGreen1GUID)
  planetGreen2GUID = "52880c"
  planetGreen2 = getObjectFromGUID(planetGreen2GUID)
  planetGreen3GUID = "b94ba7"
  planetGreen3 = getObjectFromGUID(planetGreen3GUID)
  planetGreen4GUID = "30b3a5"
  planetGreen4 = getObjectFromGUID(planetGreen4GUID)
  planetGreen5GUID = "42b8cd"
  planetGreen5 = getObjectFromGUID(planetGreen5GUID)

  shipsGreen1GUID = "c3ad6c"
  shipsGreen1 = getObjectFromGUID(shipsGreen1GUID)
  shipsGreen2GUID = "3a0caa"
  shipsGreen2 = getObjectFromGUID(shipsGreen2GUID)
  shipsGreen3GUID = "3b5a9b"
  shipsGreen3 = getObjectFromGUID(shipsGreen3GUID)
  shipsGreen4GUID = "efb7b4"
  shipsGreen4 = getObjectFromGUID(shipsGreen4GUID)
  shipsGreen5GUID = "1363d0"
  shipsGreen5 = getObjectFromGUID(shipsGreen5GUID)

  destinyGreenGUID = "03cb22"
  destinyGreen = getObjectFromGUID(destinyGreenGUID)

  playerTokenGreenGUID = "795bc6"
  playerTokenGreen = getObjectFromGUID(playerTokenGreenGUID)
  --White
  planetWhite1GUID = "af7369"
  planetWhite1 = getObjectFromGUID(planetWhite1GUID)
  planetWhite2GUID = "e631c3"
  planetWhite2 = getObjectFromGUID(planetWhite2GUID)
  planetWhite3GUID = "63325c"
  planetWhite3 = getObjectFromGUID(planetWhite3GUID)
  planetWhite4GUID = "fb78ec"
  planetWhite4 = getObjectFromGUID(planetWhite4GUID)
  planetWhite5GUID = "8aa2a3"
  planetWhite5 = getObjectFromGUID(planetWhite5GUID)

  shipsWhite1GUID = "0a76b8"
  shipsWhite1 = getObjectFromGUID(shipsWhite1GUID)
  shipsWhite2GUID = "895f2f"
  shipsWhite2 = getObjectFromGUID(shipsWhite2GUID)
  shipsWhite3GUID = "0f6c64"
  shipsWhite3 = getObjectFromGUID(shipsWhite3GUID)
  shipsWhite4GUID = "a2b780"
  shipsWhite4 = getObjectFromGUID(shipsWhite4GUID)
  shipsWhite5GUID = "4f5cc1"
  shipsWhite5 = getObjectFromGUID(shipsWhite5GUID)

  destinyWhiteGUID = "4d1cb0"
  destinyWhite = getObjectFromGUID(destinyWhiteGUID)

  playerTokenWhiteGUID = "05f033"
  playerTokenWhite = getObjectFromGUID(playerTokenWhiteGUID)

  playerAssets = {
      Brown = {
          destiny = destinyBlack,
          playerToken = playerTokenBlack,
          ships = {shipsBlack1, shipsBlack2, shipsBlack3, shipsBlack4, shipsBlack5},
          planets = {planetBlack1, planetBlack2, planetBlack3, planetBlack4, planetBlack5}
      },
      Orange = {
          destiny = destinyOrange,
          playerToken = playerTokenOrange,
          ships = {shipsOrange1, shipsOrange2, shipsOrange3, shipsOrange4, shipsOrange5},
          planets = {planetOrange1, planetOrange2, planetOrange3, planetOrange4, planetOrange5}
      },
      Red = {
          destiny = destinyRed,
          playerToken = playerTokenRed,
          ships = {shipsRed1, shipsRed2, shipsRed3, shipsRed4, shipsRed5},
          planets = {planetRed1, planetRed2, planetRed3, planetRed4, planetRed5}
      },
      Blue = {
          destiny = destinyBlue,
          playerToken = playerTokenBlue,
          ships = {shipsBlue1, shipsBlue2, shipsBlue3, shipsBlue4, shipsBlue5},
          planets = {planetBlue1, planetBlue2, planetBlue3, planetBlue4, planetBlue5}
      },
      Yellow = {
          destiny = destinyYellow,
          playerToken = playerTokenYellow,
          ships = {shipsYellow1, shipsYellow2, shipsYellow3, shipsYellow4, shipsYellow5},
          planets = {planetYellow1, planetYellow2, planetYellow3, planetYellow4, planetYellow5}
      },
      Purple = {
          destiny = destinyPurple,
          playerToken = playerTokenPurple,
          ships = {shipsPurple1, shipsPurple2, shipsPurple3, shipsPurple4, shipsPurple5},
          planets = {planetPurple1, planetPurple2, planetPurple3, planetPurple4, planetPurple5}
      },
      Green = {
          destiny = destinyGreen,
          playerToken = playerTokenGreen,
          ships = {shipsGreen1, shipsGreen2, shipsGreen3, shipsGreen4, shipsGreen5},
          planets = {planetGreen1, planetGreen2, planetGreen3, planetGreen4, planetGreen5}
      },
      White = {
          destiny = destinyWhite,
          playerToken = playerTokenWhite,
          ships = {shipsWhite1, shipsWhite2, shipsWhite3, shipsWhite4, shipsWhite5},
          planets = {planetWhite1, planetWhite2, planetWhite3, planetWhite4, planetWhite5}
      }
  }

  --Card decks
  destinyDeckGUID = "f7873a"
  destinyDeck = getObjectFromGUID(destinyDeckGUID)
  cosmicDeckGUID = "3e74bb"
  cosmicDeck = getObjectFromGUID(cosmicDeckGUID)
  largeGroupDeckGUID = "e4c77e"
  largeGroupDeck = getObjectFromGUID(largeGroupDeckGUID)
  techDeckGUID = "075e32"
  techDeck = getObjectFromGUID(techDeckGUID)
  incursionRewardsDeckGUID = "47039c"
  incursionRewardsDeck = getObjectFromGUID(incursionRewardsDeckGUID)
  dominionRewardsDeckGUID = "3af2bb"
  dominionRewardsDeck = getObjectFromGUID(dominionRewardsDeckGUID)
  hazardsDeckGUID = "ff51f9"
  hazardsDeck = getObjectFromGUID(hazardsDeckGUID)
  spaceStationsDeckGUID = "973f84"
  spaceStationsDeck = getObjectFromGUID(spaceStationsDeckGUID)
  flaresDeckGUID = "85b471"
  flaresDeck = getObjectFromGUID(flaresDeckGUID)

  aliensBeginnerGUID = "0ef326"
  aliensBeginner = getObjectFromGUID(aliensBeginnerGUID)
  aliensIntermediateGUID = "b26d5b"
  aliensIntermediate = getObjectFromGUID(aliensIntermediateGUID)
  aliensExpertGUID = "93b912"
  aliensExpert = getObjectFromGUID(aliensExpertGUID)

  aliensEonsBeginnerGUID = "0dbbd7"
  aliensEonsBeginner = getObjectFromGUID(aliensEonsBeginnerGUID)
  aliensEonsIntermediateGUID = "df4998"
  aliensEonsIntermediate = getObjectFromGUID(aliensEonsIntermediateGUID)
  aliensEonsExpertGUID = "c10c48"
  aliensEonsExpert = getObjectFromGUID(aliensEonsExpertGUID)

  aliensStormBeginnerGUID = "120d77"
  aliensStormBeginner = getObjectFromGUID(aliensStormBeginnerGUID)
  aliensStormIntermediateGUID = "686148"
  aliensStormIntermediate = getObjectFromGUID(aliensStormIntermediateGUID)
  aliensStormExpertGUID = "560490"
  aliensStormExpert = getObjectFromGUID(aliensStormExpertGUID)

  aliensConflictBeginnerGUID = "686968"
  aliensConflictBeginner = getObjectFromGUID(aliensConflictBeginnerGUID)
  aliensConflictIntermediateGUID = "71d5c2"
  aliensConflictIntermediate = getObjectFromGUID(aliensConflictIntermediateGUID)
  aliensConflictExpertGUID = "d8b465"
  aliensConflictExpert = getObjectFromGUID(aliensConflictExpertGUID)

  aliensAllianceBeginnerGUID = "ce4da2"
  aliensAllianceBeginner = getObjectFromGUID(aliensAllianceBeginnerGUID)
  aliensAllianceIntermediateGUID = "833e39"
  aliensAllianceIntermediate = getObjectFromGUID(aliensAllianceIntermediateGUID)
  aliensAllianceExpertGUID = "4c92cd"
  aliensAllianceExpert = getObjectFromGUID(aliensAllianceExpertGUID)

  aliensDominionBeginnerGUID = "60a83a"
  aliensDominionBeginner = getObjectFromGUID(aliensDominionBeginnerGUID)
  aliensDominionIntermediateGUID = "5b2161"
  aliensDominionIntermediate = getObjectFromGUID(aliensDominionIntermediateGUID)
  aliensDominionExpertGUID = "a2fae2"
  aliensDominionExpert = getObjectFromGUID(aliensDominionExpertGUID)

  aliensIncursionBeginnerGUID = "98bc4c"
  aliensIncursionBeginner = getObjectFromGUID(aliensIncursionBeginnerGUID)
  aliensIncursionIntermediateGUID = "f5d112"
  aliensIncursionIntermediate = getObjectFromGUID(aliensIncursionIntermediateGUID)
  aliensIncursionExpertGUID = "46e569"
  aliensIncursionExpert = getObjectFromGUID(aliensIncursionExpertGUID)

  aliens = {
      Base = {
          Beginner = aliensBeginner,
          Intermediate = aliensIntermediate,
          Expert = aliensExpert
      },
      Incursion = {
          Beginner = aliensIncursionBeginner,
          Intermediate = aliensIncursionIntermediate,
          Expert = aliensIncursionExpert
      },
      Conflict = {
          Beginner = aliensConflictBeginner,
          Intermediate = aliensConflictIntermediate,
          Expert = aliensConflictExpert
      },
      Alliance = {
          Beginner = aliensAllianceBeginner,
          Intermediate = aliensAllianceIntermediate,
          Expert = aliensAllianceExpert
      },
      Storm = {
          Beginner = aliensStormBeginner,
          Intermediate = aliensStormIntermediate,
          Expert = aliensStormExpert
      },
      Dominion = {
          Beginner = aliensDominionBeginner,
          Intermediate = aliensDominionIntermediate,
          Expert = aliensDominionExpert
      },
      Eons = {
          Beginner = aliensEonsBeginner,
          Intermediate = aliensEonsIntermediate,
          Expert = aliensEonsExpert
      }
  }

  aliensChoices = {
      Base = {
          Beginner = false,
          Intermediate = false,
          Expert = false
      },
      Incursion = {
          Beginner = false,
          Intermediate = false,
          Expert = false
      },
      Conflict = {
          Beginner = false,
          Intermediate = false,
          Expert = false
      },
      Alliance = {
          Beginner = false,
          Intermediate = false,
          Expert = false
      },
      Storm = {
          Beginner = false,
          Intermediate = false,
          Expert = false
      },
      Dominion = {
          Beginner = false,
          Intermediate = false,
          Expert = false
      },
      Eons = {
          Beginner = false,
          Intermediate = false,
          Expert = false
      }
  }


  --Hazards
  hazardsTokenGUID = "a10b0d"
  hazardsToken = getObjectFromGUID(hazardsTokenGUID)

  --Tech
  techLunarCannonGUID = "e38478"
  techLunarCannon = getObjectFromGUID(techLunarCannonGUID)
  techGenesisPlanetGUID = "a4706e"
  techGenesisPlanet = getObjectFromGUID(techGenesisPlanetGUID)
  techPrometheusGUID = "3ff0d6"
  techPrometheus = getObjectFromGUID(techPrometheusGUID)

  --Space Stations
  spaceStationsArrayGUID = "b2a0b3"
  spaceStationsArray = getObjectFromGUID(spaceStationsArrayGUID)
  spaceStationsOutpostGUID = "9665df"
  spaceStationsOutpost = getObjectFromGUID(spaceStationsOutpostGUID)
  spaceStationsPlatformGUID = "7262d8"
  spaceStationsPlatform = getObjectFromGUID(spaceStationsPlatformGUID)
  spaceStationsRelayGUID = "b42d75"
  spaceStationsRelay = getObjectFromGUID(spaceStationsRelayGUID)
  spaceStationsLaserGUID = "1ee0b2"
  spaceStationsLaser = getObjectFromGUID(spaceStationsLaserGUID)
  spaceStationsEnergyGeneratorGUID = "25b390"
  spaceStationsEnergyGenerator = getObjectFromGUID(spaceStationsEnergyGeneratorGUID)
  spaceStationsCloakGUID = "212daa"
  spaceStationsCloak = getObjectFromGUID(spaceStationsCloakGUID)
  spaceStationsMatrixGUID = "d7dc39"
  spaceStationsMatrix = getObjectFromGUID(spaceStationsMatrixGUID)
  spaceStationsPodsGUID = "c6ffe7"
  spaceStationsPods = getObjectFromGUID(spaceStationsPodsGUID)
  spaceStationsShieldGeneratorGUID = "36506c"
  spaceStationsShieldGenerator = getObjectFromGUID(spaceStationsShieldGeneratorGUID)

  aliensBagGUID = 'f52bcc'
  aliensBag = getObjectFromGUID(aliensBagGUID)


  --Deck zones
  aliensZoneGUID = 'f2e3f4'
  aliensZone = getObjectFromGUID(aliensZoneGUID)
  aliensDiscardZoneGUID = '28d251'
  aliensDiscardZone = getObjectFromGUID(aliensDiscardZoneGUID)

  alienZoneBlackGUID = '884c86'
  alienZoneBlack = getObjectFromGUID(alienZoneBlackGUID)
  alienZoneOrangeGUID = '24d15c'
  alienZoneOrange = getObjectFromGUID(alienZoneOrangeGUID)
  alienZoneRedGUID = '98e2e1'
  alienZoneRed = getObjectFromGUID(alienZoneRedGUID)
  alienZoneBlueGUID = 'f943d7'
  alienZoneBlue = getObjectFromGUID(alienZoneBlueGUID)
  alienZoneYellowGUID = 'e0583d'
  alienZoneYellow = getObjectFromGUID(alienZoneYellowGUID)
  alienZonePurpleGUID = 'c5fafc'
  alienZonePurple = getObjectFromGUID(alienZonePurpleGUID)
  alienZoneGreenGUID = 'a033aa'
  alienZoneGreen = getObjectFromGUID(alienZoneGreenGUID)
  alienZoneWhiteGUID = '6ac402'
  alienZoneWhite = getObjectFromGUID(alienZoneWhiteGUID)

  alienZones = {
      Brown = alienZoneBlack, -- Sic!
      Orange = alienZoneOrange,
      Red = alienZoneRed,
      Blue = alienZoneBlue,
      Yellow = alienZoneYellow,
      Purple = alienZonePurple,
      Green = alienZoneGreen,
      White = alienZoneWhite
  }

  cosmicDiscardZoneGUID = '926d4f'
  cosmicDiscardZone = getObjectFromGUID(cosmicDiscardZoneGUID)
  rewardsDiscardZoneGUID = '4c2310'
  rewardsDiscardZone = getObjectFromGUID(rewardsDiscardZoneGUID)
  hazardsDiscardZoneGUID = 'b49808'
  hazardsDiscardZone = getObjectFromGUID(hazardsDiscardZoneGUID)
  destinyDiscardZoneGUID = '146b13'
  destinyDiscardZone = getObjectFromGUID(destinyDiscardZoneGUID)
  techDiscardZoneGUID = '4f674c'
  techDiscardZone = getObjectFromGUID(techDiscardZoneGUID)

  rewardsZoneGUID = "a64419"
  rewardsZone = getObjectFromGUID(rewardsZoneGUID)

  --Checks to see if automated game setup has run by checking presence of Player Count and Set Up Token.
  --If either Player Count or Set Up Token is present, automated game setup will start.
  --Once automated game setup has finished, Player Count and Set Up Token are removed to prevent it running again.
  if aliensToken ~=nil then

      -- Creates setup configuration buttons.
      aliensBoard.createButton(
          {click_function='continueAliens', function_owner=Global, label='Continue',
          position={0.0 ,0.15,-1.0}, rotation={0,0,0}, width=4000, height=700, font_size=500,
          scale={0.2,0.2,0.2}, tooltip='Click to continue setup using selected aliens.'}
      )

      aliensBoard.createButton(
          {click_function='none', function_owner=Global, label='Select Skill Levels',
          position={0.0,0.15,-0.6}, rotation={0,0,0}, width=0, height=0, font_size=275,
          scale={0.2,0.2,0.2}, font_color = {1,1,1}, tooltip=''}
      )

      local x0=0.35

      local i=0
      for difficultyName, _ in pairs(aliens.Base) do
          params = {
              click_function='toggle'..difficultyName,
              function_owner=Global,
              label=difficultyName,
              position={0.7*(i-1)+x0,0.15,-0.4},
              rotation={0,0,0},
              height=425,
              width=1600,
              font_size=275,
              scale={0.2,0.2,0.2},
              tooltip='Select '..string.lower(difficultyName)..' aliens'
          }
          aliensBoard.createButton(params)
          i = i+1
      end

      local i = 0
      for setName, setAliens in pairs(aliens) do
          local j = 0
          params = {
              click_function='toggle'..setName,
              function_owner=Global,
              label=setName,
              position={-2*0.7+x0,0.15,-0.2+i*0.2},
              rotation={0,0,0},
              height=425,
              width=1600,
              font_size=275,
              scale={0.2,0.2,0.2},
              tooltip='Select '..string.lower(setName)..' aliens'
          }
          aliensBoard.createButton(params)
          for difficultyName, _ in pairs(setAliens) do
              params = {
                  click_function = 'toggle'..setName..difficultyName,
                  function_owner = Global,
                  label = '[ ]',
                  position = {(j-1)*0.7+x0, 0.15, -0.2+i*0.2},
                  rotation = {0,0,0},
                  width = 1600,
                  height = 425,
                  font_size = 180,
                  scale = {0.2,0.2,0.2},
                  tooltip = 'Include '..string.lower(setName)..' '..string.lower(difficultyName)..' aliens.'
              }
              aliensBoard.createButton(params)
              j = j+1
          end
          i = i+1
      end
  end




  if playerCountToken ~=nil then

      --Creates player count buttons.
      playerCountBoard.createButton(
          {click_function='players3', function_owner=Global, label='3 Players',
          position={0.0 ,0.15,-0.5}, rotation={0,0,0}, width=2600, height=425, font_size=350,
          scale={0.2,0.2,0.2}, tooltip='Set Up a 3 Player Game.'}
      )

      playerCountBoard.createButton(
          {click_function='players4', function_owner=Global, label='4 Players',
          position={0.0 ,0.15,-0.3}, rotation={0,0,0}, width=2600, height=425, font_size=350,
          scale={0.2,0.2,0.2}, tooltip='Set Up a 4 Player Game.'}
      )

      playerCountBoard.createButton(
          {click_function='players5', function_owner=Global, label='5 Players',
          position={0.0 ,0.15,-0.1}, rotation={0,0,0}, width=2600, height=425, font_size=350,
          scale={0.2,0.2,0.2}, tooltip='Set Up a 5 Player Game.'}
      )

      playerCountBoard.createButton(
          {click_function='players6', function_owner=Global, label='6 Players',
          position={0.0 ,0.15,0.1}, rotation={0,0,0}, width=2600, height=425, font_size=350,
          scale={0.2,0.2,0.2}, tooltip='Set Up a 6 Player Game.'}
      )

      playerCountBoard.createButton(
          {click_function='players7', function_owner=Global, label='7 Players',
          position={0.0 ,0.15,0.3}, rotation={0,0,0}, width=2600, height=425, font_size=350,
          scale={0.2,0.2,0.2}, tooltip='Set Up a 7 Player Game.'}
      )

      playerCountBoard.createButton(
          {click_function='players8', function_owner=Global, label='8 Players',
          position={0.0 ,0.15,0.5}, rotation={0,0,0}, width=2600, height=425, font_size=350,
          scale={0.2,0.2,0.2}, tooltip='Set Up an 8 Player Game.'}
      )

  end

  if setUpToken ~=nil then

      -- Creates setup configuration buttons.
      setUpBoard.createButton(
          {click_function='setUpGame', function_owner=Global, label='Set Up Game',
          position={0.0 ,0.15,-0.5}, rotation={0,0,0}, width=4000, height=700, font_size=500,
          scale={0.2,0.2,0.2}, tooltip='Click to set up with preferred options.'}
      )

      setUpBoard.createButton(
          {click_function='none', function_owner=Global, label='Select Add-ons',
          position={0.0,0.15,-0.1}, rotation={0,0,0}, width=0, height=0, font_size=275,
          scale={0.2,0.2,0.2}, font_color = {1,1,1}, tooltip=''}
      )

      setUpBoard.createButton(
          {click_function='toggleTech', function_owner=Global, label='Tech [ ]',
          position={-0.0,0.15,0.1}, rotation={0,0,0}, width=4000, height=425, font_size=180,
          scale={0.2,0.2,0.2}, tooltip='Include tech deck. Collect and research new tech to overpower your opponents. See Cosmic Encounter rulebook.'}
      )

      setUpBoard.createButton(
          {click_function='toggleIncursionRewards', function_owner=Global, label='Incursion Rewards [ ]',
          position={-0.44,0.15,0.3}, rotation={0,0,0}, width=1900, height=425, font_size=180,
          scale={0.2,0.2,0.2}, tooltip='Include Cosmic Incursion rewards deck. Be rewarded with powerful cards for when forging defensive alliances. See Cosmic Incursion rulebook.'}
      )

      setUpBoard.createButton(
          {click_function='toggleDominionRewards', function_owner=Global, label='Dominion Rewards [ ]',
          position={0.44,0.15,0.3}, rotation={0,0,0}, width=1900, height=425, font_size=180,
          scale={0.2,0.2,0.2}, tooltip='Include Cosmic Dominion rewards deck. Be rewarded with even wilder cards when forging defensive alliances. See Cosmic Dominion rulebook.'}
      )

      setUpBoard.createButton(
          {click_function='toggleHazards', function_owner=Global, label='Hazards [ ]',
          position={0.0,0.15,0.5}, rotation={0,0,0}, width=4000, height=425, font_size=180,
          scale={0.2,0.2,0.2}, tooltip='Include hazards deck. Encounter unexpected hazards when drawing from the destiny deck. See Cosmic Conflict rulebook.'}
      )

      setUpBoard.createButton(
          {click_function='toggleSpaceStations', function_owner=Global, label='Space Stations [ ]',
          position={0.0,0.15,0.7}, rotation={0,0,0}, width=4000, height=425, font_size=180,
          scale={0.2,0.2,0.2}, tooltip='Include space stations. Reinforce a colony with a space station to gain a unique power. See Cosmic Storm rulebook.'}
      )

      setUpBoard.createButton(
          {click_function='toggleFlares', function_owner=Global, label='Flares [ ]',
          position={0.0,0.15,0.9}, rotation={0,0,0}, width=4000, height=425, font_size=180,
          scale={0.2,0.2,0.2}, tooltip='Include flare cards. Unleash new alien powers by adding flares to the cosmic deck. See Cosmic Encounter rulebook.'}
      )

  end

  if gameStartToken ~=nil then

      -- Creates game start button
      gameStartBoard.createButton(
          {click_function='startGame', function_owner=Global, label='Start Game',
          position={0.0 ,0.15,0.0}, rotation={0,0,0}, width=4000, height=1000, font_size=700,
          scale={0.2,0.2,0.2}, tooltip='Click to play.'}
      )
  end

end

--Aliens set up functions
--Toggles for all difficulties
function toggleBeginner()
  if selectBeginner ~=true then
      selectBeginner = true
      if aliensChoices.Base.Beginner ~= true then
          toggleBaseBeginner()
      end
      if aliensChoices.Incursion.Beginner ~= true then
          toggleIncursionBeginner()
      end
      if aliensChoices.Conflict.Beginner ~= true then
          toggleConflictBeginner()
      end
      if aliensChoices.Alliance.Beginner ~= true then
          toggleAllianceBeginner()
      end
      if aliensChoices.Storm.Beginner ~= true then
          toggleStormBeginner()
      end
      if aliensChoices.Dominion.Beginner ~= true then
          toggleDominionBeginner()
      end
      if aliensChoices.Eons.Beginner ~= true then
          toggleEonsBeginner()
      end
  else
      selectBeginner = false
      if aliensChoices.Base.Beginner == true then
          toggleBaseBeginner()
      end
      if aliensChoices.Incursion.Beginner == true then
          toggleIncursionBeginner()
      end
      if aliensChoices.Conflict.Beginner == true then
          toggleConflictBeginner()
      end
      if aliensChoices.Alliance.Beginner == true then
          toggleAllianceBeginner()
      end
      if aliensChoices.Storm.Beginner == true then
          toggleStormBeginner()
      end
      if aliensChoices.Dominion.Beginner == true then
          toggleDominionBeginner()
      end
      if aliensChoices.Eons.Beginner == true then
          toggleEonsBeginner()
      end
  end
end

function toggleIntermediate()
  if selectIntermediate ~=true then
      selectIntermediate = true
      if aliensChoices.Base.Intermediate ~= true then
          toggleBaseIntermediate()
      end
      if aliensChoices.Incursion.Intermediate ~= true then
          toggleIncursionIntermediate()
      end
      if aliensChoices.Conflict.Intermediate ~= true then
          toggleConflictIntermediate()
      end
      if aliensChoices.Alliance.Intermediate ~= true then
          toggleAllianceIntermediate()
      end
      if aliensChoices.Storm.Intermediate ~= true then
          toggleStormIntermediate()
      end
      if aliensChoices.Dominion.Intermediate ~= true then
          toggleDominionIntermediate()
      end
      if aliensChoices.Eons.Intermediate ~= true then
          toggleEonsIntermediate()
      end
  else
      selectIntermediate = false
      if aliensChoices.Base.Intermediate == true then
          toggleBaseIntermediate()
      end
      if aliensChoices.Incursion.Intermediate == true then
          toggleIncursionIntermediate()
      end
      if aliensChoices.Conflict.Intermediate == true then
          toggleConflictIntermediate()
      end
      if aliensChoices.Alliance.Intermediate == true then
          toggleAllianceIntermediate()
      end
      if aliensChoices.Storm.Intermediate == true then
          toggleStormIntermediate()
      end
      if aliensChoices.Dominion.Intermediate == true then
          toggleDominionIntermediate()
      end
      if aliensChoices.Eons.Intermediate == true then
          toggleEonsIntermediate()
      end
  end
end

function toggleExpert()
  if selectExpert ~=true then
      selectExpert = true
      if aliensChoices.Base.Expert ~= true then
          toggleBaseExpert()
      end
      if aliensChoices.Incursion.Expert ~= true then
          toggleIncursionExpert()
      end
      if aliensChoices.Conflict.Expert ~= true then
          toggleConflictExpert()
      end
      if aliensChoices.Alliance.Expert ~= true then
          toggleAllianceExpert()
      end
      if aliensChoices.Storm.Expert ~= true then
          toggleStormExpert()
      end
      if aliensChoices.Dominion.Expert ~= true then
          toggleDominionExpert()
      end
      if aliensChoices.Eons.Expert ~= true then
          toggleEonsExpert()
      end
  else
      selectExpert = false
      if aliensChoices.Base.Expert == true then
          toggleBaseExpert()
      end
      if aliensChoices.Incursion.Expert == true then
          toggleIncursionExpert()
      end
      if aliensChoices.Conflict.Expert == true then
          toggleConflictExpert()
      end
      if aliensChoices.Alliance.Expert == true then
          toggleAllianceExpert()
      end
      if aliensChoices.Storm.Expert == true then
          toggleStormExpert()
      end
      if aliensChoices.Dominion.Expert == true then
          toggleDominionExpert()
      end
      if aliensChoices.Eons.Expert == true then
          toggleEonsExpert()
      end
  end
end


--Toggles for each expansion
function toggleBase()
  if selectBase ~=true then
      selectBase = true
      if aliensChoices.Base.Beginner ~= true then
          toggleBaseBeginner()
      end
      if aliensChoices.Base.Intermediate ~= true then
          toggleBaseIntermediate()
      end
      if aliensChoices.Base.Expert ~= true then
          toggleBaseExpert()
      end
  else
      selectBase = false
      if aliensChoices.Base.Beginner == true then
          toggleBaseBeginner()
      end
      if aliensChoices.Base.Intermediate == true then
          toggleBaseIntermediate()
      end
      if aliensChoices.Base.Expert == true then
          toggleBaseExpert()
      end
  end
end

function toggleIncursion()
  if selectIncursion ~=true then
      selectIncursion = true
      if aliensChoices.Incursion.Beginner ~= true then
          toggleIncursionBeginner()
      end
      if aliensChoices.Incursion.Intermediate ~= true then
          toggleIncursionIntermediate()
      end
      if aliensChoices.Incursion.Expert ~= true then
          toggleIncursionExpert()
      end
  else
      selectIncursion = false
      if aliensChoices.Incursion.Beginner == true then
          toggleIncursionBeginner()
      end
      if aliensChoices.Incursion.Intermediate == true then
          toggleIncursionIntermediate()
      end
      if aliensChoices.Incursion.Expert == true then
          toggleIncursionExpert()
      end
  end
end

function toggleConflict()
  if selectConflict ~=true then
      selectConflict = true
      if aliensChoices.Conflict.Beginner ~= true then
          toggleConflictBeginner()
      end
      if aliensChoices.Conflict.Intermediate ~= true then
          toggleConflictIntermediate()
      end
      if aliensChoices.Conflict.Expert ~= true then
          toggleConflictExpert()
      end
  else
      selectConflict = false
      if aliensChoices.Conflict.Beginner == true then
          toggleConflictBeginner()
      end
      if aliensChoices.Conflict.Intermediate == true then
          toggleConflictIntermediate()
      end
      if aliensChoices.Conflict.Expert == true then
          toggleConflictExpert()
      end
  end
end

function toggleAlliance()
  if selectAlliance ~=true then
      selectAlliance = true
      if aliensChoices.Alliance.Beginner ~= true then
          toggleAllianceBeginner()
      end
      if aliensChoices.Alliance.Intermediate ~= true then
          toggleAllianceIntermediate()
      end
      if aliensChoices.Alliance.Expert ~= true then
          toggleAllianceExpert()
      end
  else
      selectAlliance = false
      if aliensChoices.Alliance.Beginner == true then
          toggleAllianceBeginner()
      end
      if aliensChoices.Alliance.Intermediate == true then
          toggleAllianceIntermediate()
      end
      if aliensChoices.Alliance.Expert == true then
          toggleAllianceExpert()
      end
  end
end

function toggleStorm()
  if selectStorm ~=true then
      selectStorm = true
      if aliensChoices.Storm.Beginner ~= true then
          toggleStormBeginner()
      end
      if aliensChoices.Storm.Intermediate ~= true then
          toggleStormIntermediate()
      end
      if aliensChoices.Storm.Expert ~= true then
          toggleStormExpert()
      end
  else
      selectStorm = false
      if aliensChoices.Storm.Beginner == true then
          toggleStormBeginner()
      end
      if aliensChoices.Storm.Intermediate == true then
          toggleStormIntermediate()
      end
      if aliensChoices.Storm.Expert == true then
          toggleStormExpert()
      end
  end
end

function toggleDominion()
  if selectDominion ~=true then
      selectDominion = true
      if aliensChoices.Dominion.Beginner ~= true then
          toggleDominionBeginner()
      end
      if aliensChoices.Dominion.Intermediate ~= true then
          toggleDominionIntermediate()
      end
      if aliensChoices.Dominion.Expert ~= true then
          toggleDominionExpert()
      end
  else
      selectDominion = false
      if aliensChoices.Dominion.Beginner == true then
          toggleDominionBeginner()
      end
      if aliensChoices.Dominion.Intermediate == true then
          toggleDominionIntermediate()
      end
      if aliensChoices.Dominion.Expert == true then
          toggleDominionExpert()
      end
  end
end

function toggleEons()
  if selectEons ~=true then
      selectEons = true
      if aliensChoices.Eons.Beginner ~= true then
          toggleEonsBeginner()
      end
      if aliensChoices.Eons.Intermediate ~= true then
          toggleEonsIntermediate()
      end
      if aliensChoices.Eons.Expert ~= true then
          toggleEonsExpert()
      end
  else
      selectEons = false
      if aliensChoices.Eons.Beginner == true then
          toggleEonsBeginner()
      end
      if aliensChoices.Eons.Intermediate == true then
          toggleEonsIntermediate()
      end
      if aliensChoices.Eons.Expert == true then
          toggleEonsExpert()
      end
  end
end


--Toggles for each difficultiy of each expansion
function toggleBaseBeginner()
  if aliensChoices.Base.Beginner ~= true then
      aliensBoard.editButton({index = 6, label ='[X]'})
      aliensChoices.Base.Beginner = true
  else
      aliensBoard.editButton({index = 6, label ='[ ]'})
      aliensChoices.Base.Beginner = false
  end
end

function toggleBaseIntermediate()
  if aliensChoices.Base.Intermediate ~= true then
      aliensBoard.editButton({index = 7, label ='[X]'})
      aliensChoices.Base.Intermediate = true
  else
      aliensBoard.editButton({index = 7, label ='[ ]'})
      aliensChoices.Base.Intermediate = false
  end
end

function toggleBaseExpert()
  if aliensChoices.Base.Expert ~= true then
      aliensBoard.editButton({index = 8, label ='[X]'})
      aliensChoices.Base.Expert = true
  else
      aliensBoard.editButton({index = 8, label ='[ ]'})
      aliensChoices.Base.Expert = false
  end
end

function toggleIncursionBeginner()
  if aliensChoices.Incursion.Beginner ~= true then
      aliensBoard.editButton({index = 10, label ='[X]'})
      aliensChoices.Incursion.Beginner = true
  else
      aliensBoard.editButton({index = 10, label ='[ ]'})
      aliensChoices.Incursion.Beginner = false
  end
end

function toggleIncursionIntermediate()
  if aliensChoices.Incursion.Intermediate ~= true then
      aliensBoard.editButton({index = 11, label ='[X]'})
      aliensChoices.Incursion.Intermediate = true
  else
      aliensBoard.editButton({index = 11, label ='[ ]'})
      aliensChoices.Incursion.Intermediate = false
  end
end

function toggleIncursionExpert()
  if aliensChoices.Incursion.Expert ~= true then
      aliensBoard.editButton({index = 12, label ='[X]'})
      aliensChoices.Incursion.Expert = true
  else
      aliensBoard.editButton({index = 12, label ='[ ]'})
      aliensChoices.Incursion.Expert = false
  end
end

function toggleConflictBeginner()
  if aliensChoices.Conflict.Beginner ~= true then
      aliensBoard.editButton({index = 14, label ='[X]'})
      aliensChoices.Conflict.Beginner = true
  else
      aliensBoard.editButton({index = 14, label ='[ ]'})
      aliensChoices.Conflict.Beginner = false
  end
end

function toggleConflictIntermediate()
  if aliensChoices.Conflict.Intermediate ~= true then
      aliensBoard.editButton({index = 15, label ='[X]'})
      aliensChoices.Conflict.Intermediate = true
  else
      aliensBoard.editButton({index = 15, label ='[ ]'})
      aliensChoices.Conflict.Intermediate = false
  end
end

function toggleConflictExpert()
  if aliensChoices.Conflict.Expert ~= true then
      aliensBoard.editButton({index = 16, label ='[X]'})
      aliensChoices.Conflict.Expert = true
  else
      aliensBoard.editButton({index = 16, label ='[ ]'})
      aliensChoices.Conflict.Expert = false
  end
end

function toggleAllianceBeginner()
  if aliensChoices.Alliance.Beginner ~= true then
      aliensBoard.editButton({index = 18, label ='[X]'})
      aliensChoices.Alliance.Beginner = true
  else
      aliensBoard.editButton({index = 18, label ='[ ]'})
      aliensChoices.Alliance.Beginner = false
  end
end

function toggleAllianceIntermediate()
  if aliensChoices.Alliance.Intermediate ~= true then
      aliensBoard.editButton({index = 19, label ='[X]'})
      aliensChoices.Alliance.Intermediate = true
  else
      aliensBoard.editButton({index = 19, label ='[ ]'})
      aliensChoices.Alliance.Intermediate = false
  end
end

function toggleAllianceExpert()
  if aliensChoices.Alliance.Expert ~= true then
      aliensBoard.editButton({index = 20, label ='[X]'})
      aliensChoices.Alliance.Expert = true
  else
      aliensBoard.editButton({index = 20, label ='[ ]'})
      aliensChoices.Alliance.Expert = false
  end
end

function toggleStormBeginner()
  if aliensChoices.Storm.Beginner ~= true then
      aliensBoard.editButton({index = 22, label ='[X]'})
      aliensChoices.Storm.Beginner = true
  else
      aliensBoard.editButton({index = 22, label ='[ ]'})
      aliensChoices.Storm.Beginner = false
  end
end

function toggleStormIntermediate()
  if aliensChoices.Storm.Intermediate ~= true then
      aliensBoard.editButton({index = 23, label ='[X]'})
      aliensChoices.Storm.Intermediate = true
  else
      aliensBoard.editButton({index = 23, label ='[ ]'})
      aliensChoices.Storm.Intermediate = false
  end
end

function toggleStormExpert()
  if aliensChoices.Storm.Expert ~= true then
      aliensBoard.editButton({index = 24, label ='[X]'})
      aliensChoices.Storm.Expert = true
  else
      aliensBoard.editButton({index = 24, label ='[ ]'})
      aliensChoices.Storm.Expert = false
  end
end

function toggleDominionBeginner()
  if aliensChoices.Dominion.Beginner ~= true then
      aliensBoard.editButton({index = 26, label ='[X]'})
      aliensChoices.Dominion.Beginner = true
  else
      aliensBoard.editButton({index = 26, label ='[ ]'})
      aliensChoices.Dominion.Beginner = false
  end
end

function toggleDominionIntermediate()
  if aliensChoices.Dominion.Intermediate ~= true then
      aliensBoard.editButton({index = 27, label ='[X]'})
      aliensChoices.Dominion.Intermediate = true
  else
      aliensBoard.editButton({index = 27, label ='[ ]'})
      aliensChoices.Dominion.Intermediate = false
  end
end

function toggleDominionExpert()
  if aliensChoices.Dominion.Expert ~= true then
      aliensBoard.editButton({index = 28, label ='[X]'})
      aliensChoices.Dominion.Expert = true
  else
      aliensBoard.editButton({index = 28, label ='[ ]'})
      aliensChoices.Dominion.Expert = false
  end
end

function toggleEonsBeginner()
  if aliensChoices.Eons.Beginner ~= true then
      aliensBoard.editButton({index = 30, label ='[X]'})
      aliensChoices.Eons.Beginner = true
  else
      aliensBoard.editButton({index = 30, label ='[ ]'})
      aliensChoices.Eons.Beginner = false
  end
end

function toggleEonsIntermediate()
  if aliensChoices.Eons.Intermediate ~= true then
      aliensBoard.editButton({index = 31, label ='[X]'})
      aliensChoices.Eons.Intermediate = true
  else
      aliensBoard.editButton({index = 31, label ='[ ]'})
      aliensChoices.Eons.Intermediate = false
  end
end

function toggleEonsExpert()
  if aliensChoices.Eons.Expert ~= true then
      aliensBoard.editButton({index = 32, label ='[X]'})
      aliensChoices.Eons.Expert = true
  else
      aliensBoard.editButton({index = 32, label ='[ ]'})
      aliensChoices.Eons.Expert = false
  end
end

function continueAliens()

  --Checks whether one or more alien skill + version combination has been selected
  --If false sends a warning and stops setup process
  --If true setup process continues
  local anyAlienAndVersionSelected = false
  for _, versionChoices in pairs(aliensChoices) do
      for _, choice in pairs(versionChoices) do
          if choice == true then
              anyAlienAndVersionSelected = true
              break
          end
      end
  end

  if anyAlienAndVersionSelected ~= true then
      broadcastToAll('Choose at least one set of aliens.',{1,1,1})
      return
  end

  --Starts setup process and clears setup components
  broadcastToAll('Setting Up Aliens.\nPlease wait.',{1,1,1})
  aliensBoard.clearButtons()
  gameBox.putObject(aliensToken)
  gameBox.putObject(aliensBoard)
  startLuaCoroutine(Global,'buildAliens')
end

function buildAliens()

  --Determines selected sets of aliens to include
  --Decks for sets of aliens that are not enabled are moved to the game box
  --Decks for sets of aliens that have been enabled are combined and moved to a scripted zone

  local pos = aliensZone.getPosition()
  for version, versionChoices in pairs(aliensChoices) do
      for skill, choice in pairs(versionChoices) do
          if choice ~= true then
              gameBox.putObject(aliens[version][skill])
          else
              pos.y = pos.y + 1
              aliens[version][skill].setPosition(pos)
          end
      end
  end

  for k=1,60 do
      coroutine.yield(0)
  end
  return 1
end


--Player count button functions
function players3()
  playerCount = 3
  startLuaCoroutine(Global,'checkSeats')
end

function players4()
  playerCount = 4
  startLuaCoroutine(Global,'checkSeats')
end

function players5()
  playerCount = 5
  startLuaCoroutine(Global,'checkSeats')
end

function players6()
  playerCount = 6
  startLuaCoroutine(Global,'checkSeats')
end

function players7()
  playerCount = 7
  startLuaCoroutine(Global,'checkSeats')
end

function players8()
  playerCount = 8
  startLuaCoroutine(Global,'checkSeats')
end

function checkSeats()
  seatedPlayerCount = 0
  colorChoices = {}
  for _, colorName in ipairs(ref_colorOrder) do
      if Player[colorName].seated == true then
          seatedPlayerCount = seatedPlayerCount + 1
          colorChoices[colorName] = true
      else
          colorChoices[colorName] = false
      end
  end

  --Fill remaining seats
  for _, colorName in ipairs(ref_colorOrder) do
      if seatedPlayerCount == playerCount then
          break
      end
      if colorChoices[colorName] == false then
          broadcastToAll(colorName..' has been assigned to an unseated player.',{1,1,1})
          colorChoices[colorName] = true
          seatedPlayerCount = seatedPlayerCount + 1
      end
  end

  setupPlayers()

  return 1
end

function setupPlayers()

  --Checks player count and tidies away unused player pieces
  broadcastToAll('Loading Options.\nPlease wait.',{1,1,1})
  playerCountBoard.clearButtons()
  gameBox.putObject(playerCountToken)
  gameBox.putObject(playerCountBoard)

  for _, colorName in ipairs(ref_colorOrder) do
      if colorChoices[colorName] == true then
          destinyDeck.putObject(playerAssets[colorName]['destiny'])
      else
          gameBox.putObject(playerAssets[colorName]['destiny'])
          gameBox.putObject(playerAssets[colorName]['playerToken'])
          for _, ship in ipairs(playerAssets[colorName]['ships']) do
              gameBox.putObject(ship)
          end
          for _, planet in ipairs(playerAssets[colorName]['planets']) do
              gameBox.putObject(planet)
          end
      end
  end

  --Remove large group cards for small groups
  if playerCount < 7 then
      gameBox.putObject(largeGroupDeck)
  else
      destinyDeck.putObject(destinyGreen)
      cosmicDeck.putObject(largeGroupDeck)
  end
end



--Set up button functions

function toggleTech()
  if setupTech ~= true then
      setUpBoard.editButton({index = 2, label ='Tech [X]'})
      setupTech = true
  else
      setUpBoard.editButton({index = 2, label ='Tech [ ]'})
      setupTech = false
  end
end

function toggleIncursionRewards()
  if setupIncursionRewards ~= true then
      setUpBoard.editButton({index = 3, label ='Incursion Rewards [X]'})
      setupIncursionRewards = true
  else
      setUpBoard.editButton({index = 3, label ='Incursion Rewards [ ]'})
      setupIncursionRewards = false
  end
end

function toggleDominionRewards()
  if setupDominionRewards ~= true then
      setUpBoard.editButton({index = 4, label ='Dominion Rewards [X]'})
      setupDominionRewards = true
  else
      setUpBoard.editButton({index = 4, label ='Dominion Rewards [ ]'})
      setupDominionRewards = false
  end
end

function toggleHazards()
  if setupHazards ~= true then
      setUpBoard.editButton({index = 5, label ='Hazards [X]'})
      setupHazards = true
  else
      setUpBoard.editButton({index = 5, label ='Hazards [ ]'})
      setupHazards = false
  end
end

function toggleSpaceStations()
  if setupSpaceStations ~= true then
      setUpBoard.editButton({index = 6, label ='Space Stations [X]'})
      setupSpaceStations = true
  else
      setUpBoard.editButton({index = 6, label ='Space Stations [ ]'})
      setupSpaceStations = false
  end
end

function toggleFlares()
  if setupFlares ~= true then
      setUpBoard.editButton({index = 7, label ='Flares [X]'})
      setupFlares = true
  else
      setUpBoard.editButton({index = 7, label ='Flares [ ]'})
      setupFlares = false
  end
end

function setUpGame()

  --Starts setup process and clears setup components
  setUpBoard.clearButtons()
  gameBox.putObject(setUpToken)
  gameBox.putObject(setUpBoard)



  --Determines whether or not tech has been enabled
  --If not enabled tech deck and tech objects are moved to game box
  --If enabled tech deck is shuffled
  if setupTech ~= true then
      gameBox.putObject(techDeck)
      gameBox.putObject(techLunarCannon)
      gameBox.putObject(techGenesisPlanet)
      gameBox.putObject(techPrometheus)
  else
      techDeck.shuffle()
  end

  --Determines whether or not rewards have been enabled
  --If not enabled rewards deck is moved to game box
  --If enabled rewards deck is shuffled
  if setupIncursionRewards ~= true and setupDominionRewards ~= true then
      gameBox.putObject(incursionRewardsDeck)
      gameBox.putObject(dominionRewardsDeck)
  else
      startLuaCoroutine(Global,'setUpRewards')
  end

  --Determines whether or not hazards have been enabled
  --If not enabled hazards deck and hazards token are moved to game box
  --If enabled hazards deck is shuffled
  if setupHazards ~= true then
      gameBox.putObject(hazardsDeck)
      gameBox.putObject(hazardsToken)
  else
      hazardsDeck.shuffle()
  end

  --Determines whether or not space stations have been enabled
  --If not enabled space stations deck and space stations are moved to game box
  --If enabled space station deck is shuffled
  if setupSpaceStations ~= true then
      gameBox.putObject(spaceStationsDeck)
      gameBox.putObject(spaceStationsArray)
      gameBox.putObject(spaceStationsOutpost)
      gameBox.putObject(spaceStationsPlatform)
      gameBox.putObject(spaceStationsRelay)
      gameBox.putObject(spaceStationsLaser)
      gameBox.putObject(spaceStationsEnergyGenerator)
      gameBox.putObject(spaceStationsCloak)
      gameBox.putObject(spaceStationsMatrix)
      gameBox.putObject(spaceStationsPods)
      gameBox.putObject(spaceStationsShieldGenerator)
  else
      spaceStationsDeck.shuffle()
  end

  --Determines whether or not flares have been enabled
  --If not enabled flares deck is moved to game box
  if setupFlares ~= true then
      gameBox.putObject(flaresDeck)
  end
  startLuaCoroutine(Global,'setUpAliens')
end

function setUpAliens()

  --Shuffles aliens deck
  for k=1,60 do
      coroutine.yield(0)
  end
  for _, obj in pairs(aliensZone.getObjects()) do
    obj.shuffle()
  end

  --Deals 2 alien cards to each player
  broadcastToAll('Dealing Aliens.\nPlease wait.',{1,1,1})
  for k=1,90 do
      coroutine.yield(0)
  end
  for _, obj in pairs(aliensZone.getObjects()) do
      for _, colorName in ipairs(ref_colorOrder) do
          if colorChoices[colorName] == true then
              obj.deal(2,colorName)
          end
      end
  end
  return 1
end

function setUpRewards()
  if setupIncursionRewards ~= true then
      gameBox.putObject(incursionRewardsDeck)
  end

  for k=1,30 do
      coroutine.yield(0)
  end

  if setupDominionRewards ~= true then
      gameBox.putObject(dominionRewardsDeck)
  else
      local pos = rewardsZone.getPosition()
      pos.y = pos.y + 4
      dominionRewardsDeck.setPosition(pos)
  end

  for k=1,120 do
      coroutine.yield(0)
  end

  for _, obj in pairs(rewardsZone.getObjects()) do
    obj.shuffle()
  end

  return 1
end



function startGame()
  --Counts number of objects present in player alien zones and captures alien names for flares draw
  local count = 0

  alienNames = {}

  for _, colorName in ipairs(ref_colorOrder) do
      if colorChoices[colorName] == true then
          for k, v in pairs(alienZones[colorName].getObjects()) do
              alienNames[colorName] = (v.getName())
              count = count+1
          end
      end
  end

  --Checks to see if all players have placed an alien card in their alien zone
  --If false stops final setup and sends a warning
  --If true final setup continues
  --Currently script only checks number of objects in zone and is unable to distinguish between alien cards and other objects
  --Some zones have been raised to a height of 4.06 in TTS so that table isn't counted as an object
  if count ~= playerCount then
      broadcastToAll('Players not ready.\nPlace chosen alien to the right of your home colonies.')
      return

  --Starts final setup process and clears game start components
  else
      gameStartBoard.clearButtons()
      gameBox.putObject(gameStartToken)
      gameBox.putObject(gameStartBoard)

      -- Fetches items for any players with relevant alien
      objectsInAliensBag = aliensBag.getObjects()

      for _, colorName in ipairs(ref_colorOrder) do
          if colorChoices[colorName] == true then
              alienName = alienNames[colorName]
              alienZone = alienZones[colorName]
              for i, bag in ipairs(objectsInAliensBag) do
                  if bag.name == alienName..' Bag' then
                      local pos = alienZone.getPosition()
                      pos.y = pos.y + 4
                      aliensBag.takeObject({
                          position=pos, smooth=false, guid=bag.guid
                      })
                      break
                  end
              end
          end
      end
      startLuaCoroutine(Global,'finalSetup')
  end
end




function finalSetup()

  broadcastToAll('Discarding unselected aliens.\nPlease wait.',{1,1,1})
  for k=1,30 do
      coroutine.yield(0)
  end

  --Discards unwanted aliens from player hands and identifies them for flares draw.
  discardAliens = {}
  for _, colorName in ipairs(ref_colorOrder) do
      if colorChoices[colorName] == true then
          for _, obj in ipairs(Player[colorName].getHandObjects()) do
              discardAliens[colorName] = obj.getName()
              aliensDiscardZone.putObject(obj)
              local pos = aliensDiscardZone.getPosition()
              pos.y = pos.y + 4
              obj.setPosition(pos)
              obj.setRotation({0,90,0})
          end
      end
  end

  for k=1,30 do
      coroutine.yield(0)
  end

  -- If flares are enabled draws relevant flare cards and adds them to cosmic deck.
  if setupFlares == true then
      broadcastToAll('Gathering flares.\nPlease wait.',{1,1,1})
      cardsInFlaresDeck = flaresDeck.getObjects()

      for _, colorName in ipairs(ref_colorOrder) do
          if colorChoices[colorName] == true then
              for i, card in ipairs(cardsInFlaresDeck) do
                  if card.name == discardAliens[colorName]..' Flare' then
                      local pos = cosmicDeck.getPosition()
                      pos.y = pos.y + 4
                      local rot = cosmicDeck.getRotation()
                      flaresDeck.takeObject({
                          position=pos, rotation=rot, smooth=false, guid=card.guid
                      })
                      break
                  end
              end

              for k=1,5 do
                  coroutine.yield(0)
              end

              for i, card in ipairs(cardsInFlaresDeck) do
                  if card.name == alienNames[colorName]..' Flare' then
                      local pos = cosmicDeck.getPosition()
                      pos.y = pos.y + 4
                      local rot = cosmicDeck.getRotation()
                      flaresDeck.takeObject({
                          position=pos, rotation=rot, smooth=false, guid=card.guid
                      })
                      break
                  end
              end

              for k=1,5 do
                  coroutine.yield(0)
              end
          end
      end

      if playerCount == 3 then
          for k=1,30 do
              coroutine.yield(0)
          end

          flaresDeck.shuffle()

          for k=1,30 do
              coroutine.yield(0)
          end

          players3Flares = flaresDeck.cut(4)

          for k=1,5 do
              coroutine.yield(0)
          end

          local pos = cosmicDeck.getPosition()
          pos.y = pos.y + 4

          players3Flares[2].setPosition(pos)
          players3Flares[2].setRotation(cosmicDeck.getRotation())
      end

      if playerCount == 4 then
          for k=1,30 do
              coroutine.yield(0)
          end

          flaresDeck.shuffle()

          for k=1,30 do
              coroutine.yield(0)
          end

          players4Flares = flaresDeck.cut(2)

          for k=1,30 do
              coroutine.yield(0)
          end

          local pos = cosmicDeck.getPosition()
          pos.y = pos.y + 4

          players4Flares[2].setPosition(pos)
          players4Flares[2].setRotation(cosmicDeck.getRotation())

      end
  end

  for k=1,120 do
      coroutine.yield(0)
  end

  --Shuffles cosmic and destiny decks
  cosmicDeck.shuffle()
  destinyDeck.shuffle()

  --Deals player hands from cosmic deck after decks shuffled and aliens discarded
  broadcastToAll('Dealing hands.\nPlease wait.',{1,1,1})
  for k=1,120 do
      coroutine.yield(0)
  end

  for _, colorName in ipairs(ref_colorOrder) do
      if colorChoices[colorName] == true then
          cosmicDeck.deal(8,colorName)
      end
  end

  --Deals tech cards to each player if enabled
  if setupTech == true then
      for k=1,30 do
          coroutine.yield(0)
      end
      for _, colorName in ipairs(ref_colorOrder) do
          if colorChoices[colorName] == true then
              techDeck.deal(2,colorName)
          end
      end
  end

  --Deals space station to each player if enabled
  if setupSpaceStations == true then
      for k=1,30 do
          coroutine.yield(0)
      end
      for _, colorName in ipairs(ref_colorOrder) do
          if colorChoices[colorName] == true then
              spaceStationsDeck.deal(2,colorName)
          end
      end
  end
  return 1
end










--Part of original CE code
--Planet highlighting with hyperspace gate being held
--Activates the highlighting
function onObjectPickUp(_, obj)
  if obj == obj_gate then
      startLuaCoroutine(Global, "planetHighlight_routine")
  end
end
--Runs the highlight of the first planet pointed at by the gate
function planetHighlight_routine()
  local startingHeldColor = obj_gate.held_by_color
  while obj_gate.held_by_color~=nil and obj_gate.held_by_color==startingHeldColor do
      --Find objects in front of tool
      local backDir = obj_gate.getTransformForward()
      local objList = Physics.cast({
          origin=obj_gate.positionToWorld({0.041,0,-3.974}),
          direction={-backDir.x, 0, -backDir.z},
          type=3,
          size={0.1,50,0.1},
          --debug=true
      })
      --Remove objects from that list that aren't planets
      local refine_func = function(o)
          return tableContains(ref_planetGUID, o.hit_object.getGUID())
      end
      local planetList = refineTableBy(objList, refine_func)
      --Activate/deactivate highlight (while object is held)
      --print(#planetList)
      if #planetList > 0 then
          --Activate new highlight
          highlightTarget = planetList[1].hit_object
          highlightTarget.highlightOn({1,0,0})
          --Deactivate old highlight
          if highlightTarget~=highlightTarget_old and highlightTarget_old~= nil then
              highlightTarget_old.highlightOff()
          end
          --Track highlight target for next loop
          highlightTarget_old = highlightTarget
      else
          if highlightTarget_old ~= nil then
              highlightTarget_old.highlightOff()
          end
      end
      wait(0.1)
  end
  --Trigger highlight deactivation
  if highlightTarget ~= nil then
      highlightTarget.highlightOn({1,0,0}, 2)
  end
  --Clear out values
  highlightTarget = nil
  highlightTarget_old = nil
  return 1
end


--Part of original CE code
--Ship counter displays
--Repeats itself ,counting the ships at each location
function shipCounter_routine()
  --Loop over all planets over the course of a second
  for i, zoneGUID in ipairs(ref_planetScriptZoneGUID) do
      local zone = getObjectFromGUID(zoneGUID)
      if zone ~= nil then
          --Establish lish of ships in this zone
          local shipList = getShipList(zone)
          --for k, v in pairs(shipList) do print(k, "  ",v) end --debug
          --Establish display object
          local display = getObjectFromGUID(ref_shipCountDisplayGUID[i])
          if display ~= nil then
              if redrawDisplay(shipList, display) then
                  --Clear and draw new buttons
                  display.clearButtons()
                  createDisplayButtons(display, shipList)
              else
                  --Update buttons already display
                  updateDisplayButtons(display, shipList)
              end
          end
      end
      wait(0.025)
  end
  startLuaCoroutine(Global, "shipCounter_routine")
  return 1
end
--Creates shipList, which lists the ships i nthe zone
function getShipList(zone)
  local sort_func = function(o) return o.tag=="Chip" end
  local zoneObjList = zone.getObjects()
  local chipList = refineTableBy(zoneObjList, sort_func)
  local shipList = {}
  for _, ship in ipairs(chipList) do
      local shipTint = ship.getColorTint()
      local shipTintName = tintToColorName(shipTint)
      local count = math.abs(ship.getQuantity())
      if shipList[shipTintName] == nil then
          shipList[shipTintName] = count
      else
          shipList[shipTintName] = shipList[shipTintName] + count
      end
  end
  return shipList
end
--Indicates if the # of ships type has changed and requires a redraw
function redrawDisplay(shipList, display)
  local displayButtons = display.getButtons()
  local typeCount_now = 0
  if displayButtons~=nil then typeCount_now=#displayButtons end
  local typeCount_new = tableCount(shipList)

  if typeCount_now == typeCount_new then
      return false
  else
      return true
  end
end


--Part of original CE code
--Utility functions
--Coroutine delay, in seconds
function wait(time)
  local start = os.time()
  repeat coroutine.yield(0) until os.time() > start + time
end
--Refines a table, only returning entries that match func's requirement
--Example func: function(o) return o.name=="Entry's Name" end
function refineTableBy(t, func)
  if func==nil then error("No func supplied to refineTableBy") end
  local refinedTable = {}
  for _, v in ipairs(t) do
      if func(v) then
          table.insert(refinedTable, v)
      end
  end
  return refinedTable
end
--Check if a table contains a given entry
--Returns true or false, if true it returns the table's key/index
function tableContains(t, target)
  for k, v in pairs(t) do
      if v == target then
          return true, k
      end
  end
  return false
end
--Counts the number of entries in any table type
function tableCount(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end
--Determines color name based off of tint
function tintToColorName(tint)
  local range = 0.1 --how forgiving the accuracy is
  local ref_colorName = {
      ["White"]={r=1, g=1, b=1},
      ["Brown"]={r=0.153, g=0.153, b=0.153},
      ["Red"]={r=0.856, g=0.1, b=0.094},
      ["Orange"]={r=0.856, g=0.392, b=0.113},
      ["Yellow"]={r=0.905, g=0.898, b=0.172},
      ["Green"]={r=0.192, g=0.702, b=0.169},
      ["Teal"]={r=0.129, g=0.694, b=0.607},
      ["Blue"]={r=0.118, g=0.53, b=1},
      ["Purple"]={r=0.627, g=0.125, b=0.941},
      ["Pink"]={r=0.96, g=0.439, b=0.807},
  }
  for colorName, color in pairs(ref_colorName) do
      local r, g, b = false, false, false
      if math.abs(color.r - tint.r) <= range then r=true end
      if math.abs(color.g - tint.g) <= range then g=true end
      if math.abs(color.b - tint.b) <= range then b=true end
      if r and g and b then
          return colorName
      end
  end
  print("Color name not found.")
  return nil
end
--Used to rotate a set of coordinates by an angle
function rotateButtonAroundCenter(pos, angle)
  local angle = math.rad(angle)
  local x = (pos.x or pos[1]) * math.cos(angle) + (pos.z or pos[3]) * math.sin(angle)
local y = (pos.y or pos[2])--
local z = (pos.x or pos[1]) * math.sin(angle) + (pos.z or pos[3]) * math.cos(angle)
return {x=x, y=y, z=z, x, y, z}
end
--Orders the ship list (for use with ipairs, for consistancy)
function getShipList_ordered(shipList)
  shipList_ordered = {}
  for _, colorName in ipairs(ref_colorOrder) do
      if shipList[colorName] ~= nil then
          table.insert(shipList_ordered, {color=colorName, count=shipList[colorName]})
      end
  end
  return shipList_ordered
end
--Creates button or buttons on display
function createDisplayButtons(display, shipList)
  --Put ships into ordered list
  local shipList_ordered = getShipList_ordered(shipList)
  local shipCount = #shipList_ordered
  --Create buttons based on number of ships
  if shipCount == 0 then
      return
  elseif shipCount == 1 then
      display.createButton({
          label=shipList_ordered[1].count, click_function="none",
          position={0,0.29,0}, height=0, width=0, font_size=800,
          font_color=stringColorToRGB(shipList_ordered[1].color)
      })
  else
      --2
      local goalPos, font_size = {0.4,0.29,0}, 500
      --3-4
      if shipCount >= 3 then
          goalPos, font_size = {0,0.29,-0.45}, 400
      end
      --5-8
      if shipCount >= 5 then
          goalPos, font_size = {0,0.29,-0.55}, 300
      end
      local angleStep = 360/shipCount
      for i, data in ipairs(shipList_ordered) do
          local pos = rotateButtonAroundCenter(goalPos, angleStep*i)
          display.createButton({
              label=data.count, click_function="none",
              position=pos, height=0, width=0, font_size=font_size,
              font_color=stringColorToRGB(data.color)
          })
      end
  end
end
--Edit button or buttons on display
function updateDisplayButtons(display, shipList)
  --Put ships into ordered list
  local shipList_ordered = getShipList_ordered(shipList)
  for i, data in ipairs(shipList_ordered) do
      display.editButton({index=i-1, label=data.count})
  end
end


--Part of original CE code
--Data tables
--Interactable disabled items 27c74b = room, d7c235 = table
ref_noninteractable = {
  "d98e62","231021","45d183","5527d8","86af80", "2242a7",
  "5bccf0", "1eeb03", "81e3bc",
  --Black (these colors are for display panels)
  "161f94","317453","5a9a8a","79b95d","cd799a",
  --Orange
  "ff1ba5","0fa1e0","96d2b8","5d6d8f","7b84e2",
  --Red
  "1c9609","0d5cf6","4259af","3100f3","bf648b",
  --Blue
  "35b9ea","3472bd","03af8e","b564fa","2ae48b",
  --Yellow
  "fef089","6e040c","d0ea63","c77ffb","f217cd",
  --Purple
  "d14a94","9b84e5","7ddb7c","3fd3b1","4d444a",
  --Green
  "841768","21e3c1","48f278","1e8d37","5f1c59",
  --White
  "1bff32","436013","a0e23e","d0f2c4","280fdf",
}
--Planets (usused, but keeping for later use if needed)
ref_planetGUID = {
  --Black
  "47c8bd","ae7107","2e92de","59514b","0e5bdf",
  --Orange
  "e83ea8","ad3ae9","f31934","479ed0","6d5d93",
  --Red
  "f7a8a8","e15716","ce7bec","409a10","bd7d84",
  --Blue
  "1e20d7","3f3122","111138","10d6d4","2e1f42",
  --Yellow
  "af511f","cc520a","ad7542","f3abce","a443ae",
  --Purple
  "bb0770","b55714","e7299b","900eae","8647c4",
  --Green
  "a7c668","52880c","b94ba7","30b3a5","42b8cd",
  --White
  "af7369","e631c3","63325c","fb78ec","8aa2a3",
}
--Display for putting numbers onto
ref_shipCountDisplayGUID = {
  --Black
  "ff28e4","d2ad1e","8fe3c2","163511","db0a54",
  --Orange
  "551b0a","96527d","850e2f","79af97","922d68",
  --Red
  "67cdc4","5bd5c6","423f38","dc3df8","d88d2e",
  --Blue
  "66107c","9be08d","5ffdaf","ed2d1b","62ec0b",
  --Yellow
  "02a661","1e34f2","487ca2","130d90","5320f0",
  --Purple
  "59e941","bb747a","f7c754","74b922","91a579",
  --Green
  "86262a","39c531","99d6ea","4914d1","cae184",
  --White
  "9cf22a","e8718a","9d3db3","85c253","98adff",
}
--Script zones over each planet placement
ref_planetScriptZoneGUID = {
  --Black
  "c322a4","e9f55e","4305e7","5d50d9","7bf59d",
  --Orange
  "ce4418","f7ab4f","f002ba","5dd590","77f0b4",
  --Red
  "850ec6","c2583c","4c32bc","e8b4a9","b788c6",
  --Blue
  "e8646f","9b1bab","4ddfb7","4b5b7f","87c849",
  --Yellow
  "01142e","910150","2c59d0","f6ac10","a12e28",
  --Purple
  "d8fbc0","c5e9a7","3014f6","c77e54","c821e8",
  --Green
  "634d2e","bba4fc","e569ee","68c5e1","7b97cf",
  --White
  "27c4f9","e35379","642559","9ebcbb","a5f4c7",
}
--Colors in game order
ref_colorOrder = {
  "Brown","Orange","Red","Blue","Yellow","Purple","Green","White",
}
