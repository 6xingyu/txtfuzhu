



ffvpn= "https://vpn.uibe.edu.cn/por/phone_index.csp?rnd=0.23178949332658605#https%3A%2F%2Fvpn.uibe.edu.cn%2F"
x=(tostring(gg.makeRequest(ffvpn)))
if x=="The user did not allow access to the Internet." then gg.alert("禁止访问❌") 
while true do os.exit() end
return false
else
if x:find("javax") or x:find("net")  or x:find("SSL") or x:find("peer") or x:find("Exception") or x:find("I/O")  then
while true do gg.alert("已开启防御式！数据异常❌请联系作者！") os.exit() end
return
end end
if yun==nil then else
pcall(load(gg.makeRequest(yun).content)) end
gg.playMusic("https://fanyi.baidu.com/gettts?lan=zh&text=".."辅助免费开放请勿售卖如发现售卖拉黑名单IP".."&spd=5&source=wise")


local xiuran='https://kgmeimu.zn27.cn/ks.lua'
pcall(load(gg.makeRequest(xiuran).content))
gg.setVisible(false)
