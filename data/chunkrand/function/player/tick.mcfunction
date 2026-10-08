# Runs as and at every player. Finds the closest loaded chunks that have not
# been randomized yet and randomizes them, sharing #budget between players.
scoreboard players remove @s chunkrand.timer 1

execute store result score #pcx chunkrand run data get entity @s Pos[0]
execute store result score #pcz chunkrand run data get entity @s Pos[2]
scoreboard players operation #pcx chunkrand /= #16 chunkrand
scoreboard players operation #pcz chunkrand /= #16 chunkrand

# Only rescan when the player changed chunk, the last scan ran out of budget,
# or once a second to catch chunks that finished loading.
scoreboard players set #scan chunkrand 0
execute unless score @s chunkrand.timer matches 1.. run scoreboard players set #scan chunkrand 1
execute if score @s chunkrand.busy matches 1 run scoreboard players set #scan chunkrand 1
execute unless score @s chunkrand.lx = #pcx chunkrand run scoreboard players set #scan chunkrand 1
execute unless score @s chunkrand.lz = #pcz chunkrand run scoreboard players set #scan chunkrand 1
execute if score #scan chunkrand matches 0 run return 0
execute if score #budget chunkrand matches ..0 run return run scoreboard players set @s chunkrand.busy 1

scoreboard players operation @s chunkrand.lx = #pcx chunkrand
scoreboard players operation @s chunkrand.lz = #pcz chunkrand
scoreboard players set @s chunkrand.timer 20

data modify storage chunkrand:tmp c.dim set from entity @s Dimension
function chunkrand:scan/start

scoreboard players set @s chunkrand.busy 0
execute if score #budget chunkrand matches ..0 run scoreboard players set @s chunkrand.busy 1
