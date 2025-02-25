-- forbiddenspiral
-- v1.0

local mp = require('mp')
local options = require('mp.options')

local o = {
  n = 12,
  st = 5,
  ed = 95
}
local position = 'start'

options.read_options(o)

local function sleep()
  local tm = mp.get_time()
  while mp.get_time() - tm < 1 do end
end

local function set_screenshot_sequence()
  local percent = 0

  if position == 'start' then
    percent = math.ceil(mp.get_property_number('percent-pos'))
    o.st = percent
    position = 'end'
    mp.osd_message('Start: ' .. percent .. '%')
  elseif position == 'end' then
    percent = math.ceil(mp.get_property_number('percent-pos'))
    o.ed = percent
    position = 'start'
    mp.osd_message('End: ' .. percent .. '%')
  end
end

local function take_screenshot_sequence()
  local n = o.n
  local st = o.st
  local ed = o.ed
  local step = (ed - st) / (n)
  local percent = st

  while percent < ed do
    mp.commandv('seek', percent, 'absolute-percent')
    sleep()
    mp.commandv('screenshot')
    percent = percent + step
  end
end

mp.add_key_binding('ctrl+shift+s', 'set-better-sequence', set_screenshot_sequence)
mp.add_key_binding('ctrl+shift+t', 'take-better-sequence', take_screenshot_sequence)
