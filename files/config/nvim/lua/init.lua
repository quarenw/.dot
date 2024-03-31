require("core.plugins")
require("core.plugin_config")

Home=os.getenv( "HOME" )
Local_path= Home .. "/.dot/local/nvimrc.lua;"
package.path = Local_path .. package.path
require("local_nvim")
