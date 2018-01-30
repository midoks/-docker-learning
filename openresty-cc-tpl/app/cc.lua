
-- 防止CC攻击


local ip = ngx.var.binary_remote_addr
local limit = ngx.shared.limit
local req, _ =limit:get(ip)

if req then
    if req > 20 then
        ngx.exit(503)
    else
        limit:incr(ip, 1)
    end
else
    limit:set(ip, 1, 10)
end
 
local jsjump = ngx.shared.jsjump
local uri = ngx.var.request_uri
local jspara,flags = jsjump:get(ip)
local args = ngx.req.get_uri_args()

if jspara then
    if flags then
        ngx.exec("@cc")
    else
        local p_jskey=''
        if args["jskey"] and type(args["jskey"])=='table' then
                 p_jskey=args["jskey"][table.getn(args["jskey"])]
        else
                 p_jskey=args["jskey"]
        end

        if p_jskey and p_jskey == tostring(jspara)  then
            jsjump:set(ip, jspara, 3600, 1)
            ngx.exec("@cc")
        else
            local url=''
            if ngx.var.args then
                   url=ngx.var.scheme.."://"..ngx.var.host..uri.."&jskey="..jspara
            else
                   url=ngx.var.scheme.."://"..ngx.var.host..uri.."?jskey="..jspara
            end
            local jscode="window.location.href='"..url.."';"
            ngx.say(jscode)
        end
    end
else
	math.randomseed( os.time() );
    local random = math.random(100000,999999)
    jsjump:set(ip, random,60)
    local url = ''
    if ngx.var.args then
        url = ngx.var.scheme.."://"..ngx.var.host..uri.."&jskey="..random
    else
        url = ngx.var.scheme.."://"..ngx.var.host..uri.."?jskey="..random
    end
    local jscode="window.location.href='"..url.."';"
    ngx.say(jscode)
end