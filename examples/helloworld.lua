local package = {}
package.__index = package
package.Name = "HelloWorld"
package.ClassName = "HelloWorld"
function package:init()
	return setmetatable({},package)
end
function package:print()
	print('Hello world!')
end
return package
