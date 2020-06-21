require("luci.sys")

m=Map("autorewan",translate("Scheduled Rewan"),translate("Scheduled rewan Setting"))

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

monday=s:option(Flag,"enable",translate("Monday"))
enable.rmempty = false
enable.default=1

tuesday=s:option(Flag,"enable",translate("Tuesday"))
enable.rmempty = false
enable.default=1

wednesday=s:option(Flag,"enable",translate("Wednesday"))
enable.rmempty = false
enable.default=1

thursday=s:option(Flag,"enable",translate("Thursday"))
enable.rmempty = false
enable.default=1

friday=s:option(Flag,"enable",translate("Friday"))
enable.rmempty = false
enable.default=1

saturday=s:option(Flag,"enable",translate("Saturday"))
enable.rmempty = false
enable.default=1

sunday=s:option(Flag,"enable",translate("Sunday"))
enable.rmempty = false
enable.default=1

renetwork=s:option(Flag,"enable",translate("By calling network restart"))
enable.rmempty = false
enable.default=1


local e=luci.http.formvalue("cbi.apply")
if e then
  io.popen("/etc/init.d/autorewan restart")
end

return m
