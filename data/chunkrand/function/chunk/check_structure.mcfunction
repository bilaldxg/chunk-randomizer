# Macro args: bx, bz. Structure pieces never reach further than ~112 blocks
# from the structure's start, so anything within #structure_radius of the
# nearest stronghold / fortress start is treated as possibly containing it.
scoreboard players set #found chunkrand 0
$execute if dimension minecraft:overworld positioned $(bx) 0 $(bz) positioned ~8 ~ ~8 store success score #found chunkrand store result score #dist chunkrand run locate structure minecraft:stronghold
$execute if dimension minecraft:the_nether positioned $(bx) 0 $(bz) positioned ~8 ~ ~8 store success score #found chunkrand store result score #dist chunkrand run locate structure minecraft:fortress
execute if score #found chunkrand matches 1 if score #dist chunkrand <= #structure_radius chunkrand run data modify storage chunkrand:tmp c.filter set value "replaceable_near_structure"
