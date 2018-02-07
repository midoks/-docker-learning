
local redis = require "resty.redis"

local red = redis:new()
red:set_timeout(1000)
	
local ok, err = red:connect('127.0.0.1', 6379)

ngx.header.content_type = 'text/html'
if not ok then
	ngx.say('redis connect fail')
else
	ngx.say('redis connect ok')
end
