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

wait((ev[1]/1000)-self.offset)

if note[2] > 4 and self.bf == true then

ev1:Fire({ev[1],ev[2]-4,ev[3])

else

ev1:Fire(note)

end

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
