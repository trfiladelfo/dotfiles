local f = io.open("/proc/version", "r")
local t = f:read("*all")
local version
local i = 0
for w in string.gmatch(t, "%S+") do
  i = i + 1
  if i == 3 then
    version = w
    break
  end
end
f:close()

return version
