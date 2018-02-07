local config = require "resty.short.config"
local functions = require "resty.short.functions"

local func = functions:new()


local short_string = string.sub(ngx.var.uri, -#config['start_url'])

ngx.header['req_url'] = short_string
ngx.header.content_type = 'text/html'

local long_url, err = functions.get_long_url(short_string)
if err then
	functions.show_err(err)
end
ngx.redirect(long_url)
