require("core.plugins")
require("core.plugin_config")

home=os.getenv( "HOME" )
local_path= home .. "/.dot/local/nvimrc.lua;"
package.path = local_path .. package.path
require("local_nvim")
