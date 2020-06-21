module("luci.controller.autorewan",package.seeall)
function index()
entry({"admin","system","autorewan"},cbi("autorewan"),_("Scheduled Rewan"),88)
end
