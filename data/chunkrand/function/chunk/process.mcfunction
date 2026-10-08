# Randomizes the chunk described by storage chunkrand:tmp c (dim, bx, bz).
function chunkrand:chunk/mark with storage chunkrand:tmp c

execute store result score #t chunkrand run data get storage chunkrand:tmp c.bx
execute store result storage chunkrand:tmp c.bx2 int 1 run scoreboard players add #t chunkrand 15
execute store result score #t chunkrand run data get storage chunkrand:tmp c.bz
execute store result storage chunkrand:tmp c.bz2 int 1 run scoreboard players add #t chunkrand 15

# Near a stronghold / nether fortress, keep the structure's blocks intact
data modify storage chunkrand:tmp c.filter set value "replaceable"
execute if dimension minecraft:overworld run function chunkrand:chunk/check_structure with storage chunkrand:tmp c
execute if dimension minecraft:the_nether run function chunkrand:chunk/check_structure with storage chunkrand:tmp c

execute store result score #r chunkrand run random value 0..999999
scoreboard players operation #r chunkrand %= #block_count chunkrand
execute store result storage chunkrand:tmp c.i int 1 run scoreboard players get #r chunkrand
function chunkrand:chunk/pick with storage chunkrand:tmp c

function chunkrand:chunk/fill with storage chunkrand:tmp c
function chunkrand:chunk/free_players with storage chunkrand:tmp c
