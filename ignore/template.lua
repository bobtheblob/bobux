local package = {}
package.__index = package
function package:init()
	return setmetatable({},package)
end
return package
