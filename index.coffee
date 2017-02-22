{Phaser} = this

cacheKeys = [
  "binary"
  "bitmapData"
  "bitmapFont"
  "canvas"
  "image"
  "json"
  "physics"
  "renderTexture"
  "shader"
  "sound"
  "text"
  "texture"
  "tilemap"
  "video"
  "xml"
]

noop = ->

groupEnd   = console.groupEnd?.bind(console) or noop
groupStart = (console.groupCollapsed or console.group or console.log).bind console
table      = (console.table or console.log).bind console

Phaser.Utils.Debug::cache = ->
  {_cache} = @game.cache

  for name in cacheKeys
    cache = _cache[name]
    {length} = Object.keys cache
    if length > 0
      groupStart "Cache: #{name} (#{length})"
      table cache
      groupEnd()
    else
      console.log "Cache: #{name} is empty"

  return
