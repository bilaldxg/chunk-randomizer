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
   walks into it, including chunks you already built in.

## How it works

- A chunk stays normal until a player steps into it. On that tick it gets one
  random block from the pool in `data/chunkrand/function/blocks.mcfunction`
  and is filled from the bottom of the world to the top with
  `/fill ... replace #chunkrand:replaceable`. You can watch the chunk you walk
  into change while the chunks around it still look normal.
- The blocks inside every player in that chunk are cleared to air, so nobody
  gets stuck in the new block (for example when swimming and the water turns
  solid).
- The pack remembers finished chunks (per dimension) in the command storage
  `chunkrand:done`, so each chunk is randomized only once. Your builds are safe
  after that.
- In the overworld and the nether, it runs `/locate` for the nearest stronghold
  or fortress. If the chunk is within `#structure_radius` blocks of it, the
  chunk uses `#chunkrand:replaceable_near_structure`, which skips the
  structure's blocks.
- Portals (`end_portal`, `end_gateway`, `nether_portal`) are never replaced,
  so the End stays playable.

## Settings

Change these with `/scoreboard players set <name> chunkrand <value>`. They
stay set across `/reload`.

| Name | Default | Meaning |
|---|---|---|
| `#enabled` | `1` | `0` pauses the pack |
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

`tools/generate.py` regenerates the block tags and the fill function. When a new Minecraft version adds blocks, update
`tools/all_blocks.txt` and rerun:

```sh
python3 tools/generate.py
```
