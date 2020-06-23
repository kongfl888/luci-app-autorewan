require("luci.sys")

m=Map("autorewan",translate("Scheduled Rewan"),translate("Scheduled rewan Setting. <a href=\"https://github.com/kongfl888/luci-app-autorewan\">Github</a>"))

s=m:section(TypedSection,"main","")
s.addremove=false
s.anonymous=true

enable=s:option(Flag,"enable",translate("Enable"))
enable.rmempty = false
enable.default=0

hour=s:option(Value,"hour",translate("Hour"))
hour.datatype = "range(0,23)"
hour.rmempty = false

pass=s:option(Value,"minute",translate("Minute"))
pass.datatype = "range(0,59)"
pass.rmempty = false

monday=s:option(Flag,"monday",translate("Monday"))
monday.rmempty = false
monday.default=1

tuesday=s:option(Flag,"tuesday",translate("Tuesday"))
tuesday.rmempty = false
tuesday.default=1

wednesday=s:option(Flag,"wednesday",translate("Wednesday"))
wednesday.rmempty = false
wednesday.default=1

thursday=s:option(Flag,"thursday",translate("Thursday"))
thursday.rmempty = false
thursday.default=1

friday=s:option(Flag,"friday",translate("Friday"))
friday.rmempty = false
friday.default=1

saturday=s:option(Flag,"saturday",translate("Saturday"))
saturday.rmempty = false
saturday.default=1

sunday=s:option(Flag,"sunday",translate("Sunday"))
sunday.rmempty = false
sunday.default=1

renetwork=s:option(Flag,"renetwork",translate("By calling network restart"))
renetwork.rmempty = false
renetwork.default=1


local apply =luci.http.formvalue("cbi.apply")
if apply then
    luci.sys.call("/etc/init.d/autorewan restart")
end

return m
