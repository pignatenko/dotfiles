core_settings = {}

local settings = require("lib/settings")
function core_settings.run()
	settings.apply(settings.GLOBAL)
	settings.createFtDetectFallback()
end

return core_settings
