# Runs as and at every player. Randomizes the chunk the player is standing in
# the first time anyone enters it.
execute store result score #t chunkrand run data get entity @s Pos[0]
scoreboard players operation #t chunkrand /= #16 chunkrand
execute store result storage chunkrand:tmp c.bx int 16 run scoreboard players get #t chunkrand
execute store result score #t chunkrand run data get entity @s Pos[2]
scoreboard players operation #t chunkrand /= #16 chunkrand
execute store result storage chunkrand:tmp c.bz int 16 run scoreboard players get #t chunkrand
data modify storage chunkrand:tmp c.dim set from entity @s Dimension
function chunkrand:chunk/check with storage chunkrand:tmp c
