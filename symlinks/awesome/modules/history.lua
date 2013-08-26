local history = {}

local home = os.getenv('HOME')
local output = io.popen('ls -la ' .. home, 'r')
output = output:read("*all")
print(output)
