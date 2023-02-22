-- chartLoader

local chartLoader = {}

local function chartLoader.playChart(chartData, offset, isBF)
local ev1 = Instance.new("BindableEvent")
local self = {}
self.onNotePressed = ev1.Event
self.offset = offset
self.bf = isBF

local alive = true
local handler = task.spawn(function()
for index, section in pairs(chartData.song.notes) do

for index2, note in pairs(section.sectionNotes) do

task.spawn(function()
if ev[2] > 4 and self.bf == false then
return
end

if ev[2] > 4 and self.bf then
local b = table.clone(ev)
b[2]=b[2]-4
ev=b
end

if not alive then return end
wait((ev[1]/1000)-self.offset)
if not alive then return end

ev1:Fire(note)

end)

end

end
end)

self.cancel = function()
task.cancel(handler)
alive = false
return true
end

return self
end

return chartLoader
