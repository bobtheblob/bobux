local package = {}
package.__index = package
package.Name = "template"
package.ClassName = "template"
function package:init()
	return setmetatable({},package)
end
return package
