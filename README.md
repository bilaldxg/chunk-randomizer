# Chunk Randomizer

A Minecraft Java Edition datapack that turns every chunk into a single random
block. The terrain keeps its shape, but every solid block, liquid, plant and
tree in a chunk becomes the same block, picked at random for each chunk. Air
stays air.

**Strongholds and nether fortresses stay normal.** In chunks near one, the
structure's blocks (stone bricks, iron bars, the end portal frame, nether
bricks, nether wart, spawners, chests, ...) are left alone. Only the
terrain around them is randomized.

Works on Minecraft **1.21.4 and newer**. The block tags are generated from the 26.1 block list.

## Install

1. Download this repository as a zip, or zip the folder so that `pack.mcmeta`
   and `data/` are at the top level of the zip.
2. Put it in `<world>/datapacks/`, or add it on the *Data Packs* screen when
   creating a world.
3. Use a **new world**. The pack rewrites every chunk the first time a player
   comes near it, including chunks you already built in.

## How it works

- Every tick, the pack looks at the loaded chunks around each player, closest
  first. Each chunk it hasn't seen yet gets one random block from the pool in
  `data/chunkrand/function/blocks.mcfunction` and is filled from the bottom of
  the world to the top with `/fill ... replace #chunkrand:replaceable`.
- The pack remembers finished chunks (per dimension) in the command storage
  `chunkrand:done`, so each chunk is randomized only once. Your builds are safe
  after that.
- In the overworld and the nether, it runs `/locate` for the nearest stronghold
  or fortress. If the chunk is within `#structure_radius` blocks of it, the
  chunk uses `#chunkrand:replaceable_near_structure`, which skips the
  structure's blocks.
- Portals (`end_portal`, `end_gateway`, `nether_portal`) are never replaced,
  so the End stays playable.

You might see the original terrain for a moment before a far-away chunk
changes. This happens because a datapack can only edit a chunk after the game
has generated it.

## Settings

Change these with `/scoreboard players set <name> chunkrand <value>`. They
stay set across `/reload`.

| Name | Default | Meaning |
|---|---|---|
| `#enabled` | `1` | `0` pauses the pack |
| `#radius` | `10` | How many chunks around each player get randomized (max 32). Match it to your view distance. |
| `#chunks_per_tick` | `2` | How many chunks the whole server randomizes per tick. Raise it if you fly fast with elytra; lower it if the server lags. |
| `#structure_radius` | `160` | How close to a stronghold or fortress (in blocks) a chunk must be for that structure's blocks to be kept |

Make sure the `commandModificationBlockLimit` game rule is at least 4096; the
default of 32768 is fine.

## Customizing the block pool

Edit `data/chunkrand/function/blocks.mcfunction`, then run `/reload`. Every
entry is equally likely. Block states work, for example
`"minecraft:oak_leaves[persistent=true]"`.

The default pool leaves some blocks out on purpose:
- Gravity blocks like sand, gravel and concrete powder: a whole chunk of them
  collapses into caves and causes heavy lag.
- Liquids.
- Blocks with block entities, like chests and furnaces: about 100,000 of them
  in one chunk would cause severe lag.
- Bedrock and other unbreakable blocks.

## Uninstall

Run `/function chunkrand:uninstall`, then `/datapack disable "file/<name>"`.

## Development

`tools/generate.py` regenerates the block tags, the scan rings and the fill
function. When a new Minecraft version adds blocks, update
`tools/all_blocks.txt` and rerun:

```sh
python3 tools/generate.py
```
