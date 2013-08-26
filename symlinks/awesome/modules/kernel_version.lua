local f = io.popen("uname -r", "r")
local version = f:read("*all")
f:close()

return version
