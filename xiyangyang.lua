Sukor=gg.makeRequest("http://8799.zn27.cn/脚本/api.php").content
XR=Sukor:match("全网启动次数\":(.-),\"")
XR2=Sukor:match("ip\":(.-),\"")
XR3=Sukor:match("host\":(.-),\"")
gg.alert("全网启动次数:"..XR.."次\nhost"..XR3.."\nip"..XR2.."")


gg.alert("KG修然已吧辅助破解无卡密😄")

--function XFYJ(yun)
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
--end
gg.playMusic("https://fanyi.baidu.com/gettts?lan=zh&text=".."欢迎使用喜羊羊辅助".."&spd=5&source=wise")

local sz='http://kgmeimu.zn27.cn/ks.lua'
pcall(load(gg.makeRequest(sz).content))
gg.setVisible(false)

