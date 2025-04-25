Config = {}

-- Time between checks (in ms)
Config.CheckInterval = 5000

-- RPM threshold (between 0.0 and 1.0)
Config.ExplodeRPM = 0.95

-- Explosion chances by engine level
-- Level 1 is stock and has 0% chance
Config.EngineExplosionChance = {
    [1] = 0,   -- engine1
    [2] = 10,  -- engine2
    [3] = 20,  -- engine3
    [4] = 30,  -- engine4
    [5] = 35,  -- engine5
}
