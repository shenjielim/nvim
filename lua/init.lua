-- Local declarations
plugin_path = 'plugin-configs/'
local pathOfThisFile = ... -- pathOfThisFile is now 'lib.foo.bar'
local folderOfThisFile = (...):match("(.-)[^%.]+$") -- returns 'lib.foo.'
-- status line config
require(folderOfThisFile .. plugin_path .. 'status-line/custom-gruvbox')
