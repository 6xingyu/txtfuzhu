function Main0()
SN = gg.choice({
	 "开启防闪",
}, nil, "点击防闪")
if SN==1 then
	 HS2()
end
FX=0
end
function HS2()
	 gg.clearResults()
	 gg.setRanges(262207)
	 gg.searchNumber("842084353", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 jg=gg.getResults(100)
	 sl=gg.getResultCount()
	 if sl>100 then sl=100 end
	 for i = 1, sl do
	 	 dzy=jg[i].address
	 	 gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = 999999999}})
	 end
	 gg.toast("防闪注入成功")
	 gg.clearResults()
end

Main0()
j={}
xgz={}
ZY='Main'
gg.toast('喜羊羊')
gg.clearResults()  sj={}  xgz={} gg.toast("欢迎进入")  function search(ss,lx,nc,dz1,dz2)  if ss~=nil then if lx~=nil then  if nc==nil then nc=32 end  gg.setRanges(nc)  if dz1==nil then dz1="-1" end  if dz2==nil then dz1="0" end  gg.searchNumber(ss,lx,false,gg.SIGN_EQUAL,dz1,dz2)  sl=gg.getResultCount()  if sl~=0 then  sj=gg.getResults(sl)  gg.toast("🌨️搜索到 "..sl.." 个结果🌨️")  gg.clearResults()  else  gg.toast("🌩未搜索到结果🌩")  end  else  gg.toast("☁无搜索值类型☁")  end  else  gg.toast("🌜无需搜索值🌛")  end  end  function py1(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value==value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("👻共偏移 "..#sj.." 个数据👻")  else  gg.toast("👀没有搜索数据👀")  end  end  function py2(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value~=value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("🪐️共偏移 "..#sj.." 个数据🪐️")  else  gg.toast("🌞没有搜索数据🌞")  end  end  function xg1(value,lx,py,dj)  if #sj~=nil then  z={}  for i=1,#sj do  z[i]={}  z[i].address=sj[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("👁️共修改 "..#z.." 个数据👁️")  else  gg.toast("🐲没有搜索数据🐲")  end  end  function xg2(bz,value,lx,py,dj)  if #bz~=nil then  z={}  for i=1,#bz do  z[i]={}  z[i].address=bz[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("🌪共修改 "..#z.." 个数据🌪")  else  gg.toast("🌥️没有搜索数据🌥️")  end  end  function bc(bz)  if sj~=nil then  _ENV[bz]=sj  else  gg.toast("☔无数据☔")  end  end 

function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList('^/data/*.so*$')
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == 'w' then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub('^.*/', '')
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
					t = {}
					for _ in pairs(S) do
						if not ti.x64 then
							S[_].value = S[_].value & 0xFFFFFFFF
						end
						t[#t + 1] = {}
						t[#t].address = S[_].value + Offset[i]
						t[#t].flags = _t
					end
				end
			end
			_S = t[#t].address
		end
		return _S
	end
	local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
	return _A
end


function editData(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."开启失败")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."开启成功")else gg.toast(qmnbn.."开启失败")end end end

D=gg.TYPE_DWORD  E=gg.TYPE_DOUBLE  F=gg.TYPE_FLOAT W=gg.TYPE_WORD B=gg.TYPE_BYTE X=gg.TYPE_XOR Q=gg.TYPE_QWORD

function readValue(address, flags) return gg.getValues({{address = address, flags = flags}})[1]["value"]end
function search(ss,lx,nc,dz1,dz2) if ss~=nil then if lx~=nil then  if nc==nil then nc=32 end  gg.setRanges(nc)  if dz1==nil then dz1="-1" end  if dz2==nil then dz1="0" end  gg.searchNumber(ss,lx,false,gg.SIGN_EQUAL,dz1,dz2)  sl=gg.getResultCount()  if sl~=0 then  sj=gg.getResults(sl)  gg.toast("搜索到 "..sl.." 个结果")  gg.clearResults()  else  gg.toast("未搜索到结果")  end  else  gg.toast("无搜索值类型")  end  else  gg.toast("无需搜索值")  end  end  function py1(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value==value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function py2(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value~=value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end
function xg1(value,lx,py,dj) if #sj~=nil then z={} for i=1,#sj do z[i]={} z[i].address=sj[i].address+py z[i].flags=lx if value == nil then value = readValue(z[i].address, lx) end z[i].value= value z[i].freeze = dj and true or false end if dj == true or dj == false then gg.addListItems(z) else gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end
function xg2(bz,value,lx,py,dj)  if #bz~=nil then  z={}  for i=1,#bz do  z[i]={}  z[i].address=bz[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("共修改 "..#z.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function bc(bz)  if sj~=nil then  _ENV[bz]=sj  else  gg.toast("无数据")  end  end  

function split(szFullString, szSeparator)   local nFindStartIndex = 1   local nSplitIndex = 1   local nSplitArray = {}   while true do   local nFindLastIndex = string.find  (szFullString, szSeparator, nFindStartIndex)   if not nFindLastIndex then   nSplitArray[nSplitIndex] =   string.sub(szFullString, nFindStartIndex, string.len  (szFullString))   break end   nSplitArray[nSplitIndex] = string.sub  (szFullString, nFindStartIndex, nFindLastIndex - 1)   nFindStartIndex = nFindLastIndex + string.len  (szSeparator)   nSplitIndex = nSplitIndex + 1 end return   nSplitArray end   function xgxc(szpy, qmxg)   for x = 1, #(qmxg) do   xgpy = szpy + qmxg[x]["offset"]   xglx = qmxg[x]["type"]   xgsz = qmxg[x]["value"]   xgdj = qmxg[x]["freeze"]   if xgdj == nil or xgdj == "" then   gg.setValues({[1]   = {address = xgpy, flags = xglx, value = xgsz}})   else   gg.addListItems({[1]   = {address = xgpy, flags = xglx,   freeze = xgdj, value = xgsz}}) end   xgsl = xgsl + 1 xgjg = true end end   function xqmnb(qmnb)   gg.clearResults()   gg.setRanges(qmnb[1]["memory"])   gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])  gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else           sl = gg.getResults(999999)   sz = gg.getResultCount()           xgsl = 0 if sz > 999999 then   sz = 999999 end for i = 1, sz do   pdsz = true for v = 4, #(qmnb) do if   pdsz == true then   pysz = {} pysz[1]   = {} pysz[1].address   = sl[i].address + qmnb[v]["offset"] pysz[1].flags   = qmnb[v]["type"]   szpy = gg.getValues(pysz)   pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd   = split(pdpd, ";") tzszpd   = szpd[1] pyszpd = szpd[2]   if tzszpd == pyszpd then   pdjg = true pdsz = true else   pdjg = false pdsz = false end end end if   pdjg == true then szpy   = sl[i].address xgxc(szpy, qmxg) end end   if xgjg == true then   gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据")   else   gg.toast(qmnb[2]["name"] .. "开启失败")   end   end   end   end 

function Fs3Fs4(Fs1, Fs2, Fs3, Fs4, Fs5) gg.clearResults() gg.setRanges(Fs2) gg.setVisible(false) gg.searchNumber(Fs3[1][1], Fs3[1][3]) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Fs3[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Fs3 do local tmp = {} local offset = Fs3[k][2] - base local num = Fs3[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = Fs3[k][3] end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast(Fs1..'\n搜索到{'..#data..'}条数据') local t = {} local base = Fs3[1][2] if Fs5 == '' and Fs5 > 0 and Fs5 < #data then Fs5 = Fs5 else Fs5 = #data end for i=1, Fs5 do for k, w in ipairs(Fs4) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = w[3] t[#t].value = w[1] if (w[4] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast(Fs1..'️\n已修改{'..#t..'}条数据') else gg.toast(Fs1..'\n数据搜索失败', false) return false end else gg.toast(Fs1..'\n数据修改失败', false) return false end end
function search(ss,lx,nc,dz1,dz2) if ss~=nil then if lx~=nil then if nc==nil then nc=32 end gg.setRanges(nc) if dz1==nil then dz1="-1" end if dz2==nil then dz1="0" end gg.searchNumber(ss,lx,false,536870912,dz1,dz2) sl=gg.getResultCount() if sl~=0 then sj=gg.getResults(sl) gg.toast("搜索到 "..sl.." 个结果") gg.clearResults() else gg.toast("未搜索到结果") end else gg.toast("无搜索值类型") end else gg.toast("无需搜索值") end end function py1(value,lx,py) if #sj~=nil then z1={} z2={} for i=1,#sj do z1[i]={} z1[i].address=sj[i].address+py z1[i].flags=lx end z1=gg.getValues(z1) for i=1,#sj do if z1[i].value==value then z2[#z2+1]={} z2[#z2]=sj[i] end end sj=z2 z1={} z2={} gg.toast("共偏移 "..#sj.." 个数据") else gg.toast("没有搜索数据") end end function py2(value,lx,py) if #sj~=nil then z1={} z2={} for i=1,#sj do z1[i]={} z1[i].address=sj[i].address+py z1[i].flags=lx end z1=gg.getValues(z1) for i=1,#sj do if z1[i].value~=value then z2[#z2+1]={} z2[#z2]=sj[i] end end sj=z2 z1={} z2={} gg.toast("共偏移 "..#sj.." 个数据") else gg.toast("没有搜索数据") end end 
function xg1(value,lx,py,dj) if #sj~=nil then z={} for i=1,#sj do z[i]={} z[i].address=sj[i].address+py z[i].flags=lx z[i].value=value if dj==true then z[i].freeze=true end end if dj==true then gg.addListItems(z) else gg.clearList() gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end 
function xg2(bz,value,lx,py,dj) if #bz~=nil then z={} for i=1,#bz do z[i]={} z[i].address=bz[i].address+py z[i].flags=lx z[i].value=value if dj==true then z[i].freeze=true end end if dj==true then gg.addListItems(z) else gg.clearList() gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end function bc(bz) if sj~=nil then _ENV[bz]=sj else gg.toast("无数据") end end function BaAdd(add) t=gg.getValues({[1]={address=add,flags=4}}) return t[1].value&0xFFFFFFFF end function set(dz,xg,lx,dj) if dj=="true" then gg.addListItems({{address=dz,flags=lx,value=xg,freeze=true}}) else gg.setValues({{address=dz,flags=lx,value=xg}}) end gg.toast("修改成功") end
--!!!以上为偏移配置 不懂勿动!!!

function Main2()
ZY='Main'
NB = gg.choice({
  "防闪退1",
  "防闪退2",
  "返回脚本",
  }, nil,os.date "喜羊羊辅助\n北京时间\n%Y年%m月%d日%H时%M分")
if NB == 1 then HS2() end
if NB == 2 then HS21() end
if NB == 3 then ty11c() end
end
function HS2()
	 gg.clearResults()
	 gg.setRanges(16)
	 gg.searchNumber("842084353", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("842084353", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 jg=gg.getResults(100)
	 sl=gg.getResultCount()
	 for i = 1, sl do
	 	 dzy=jg[i].address
	 	 gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = -1}})
	 end
	 gg.toast("开启成功，Sꫀꪀs🗽定制")
	 gg.clearResults()
end

function HS21()
	 gg.clearResults()
	 gg.setRanges(262207)
	 gg.searchNumber("842084353", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
	 jg=gg.getResults(100)
	 sl=gg.getResultCount()
	 if sl>100 then sl=100 end
	 for i = 1, sl do
	 	 dzy=jg[i].address
	 	 gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = 999999999}})
	 end
	 gg.toast("开启成功")
	 gg.clearResults()
end

function ty11c()
Main()
end


function Main()
ZY='Main'
YU = gg.choice({
  "🍓防闪🍓",
  "🍓比赛功能（危险）🍓",
  "🍓地铁刷号（危险）🍓",
  "🍓地铁改段位（中危）🍓",
  "👀确定要退出嘛👀",
  }, nil,os.date "感谢你们用喜羊羊\n北京时间\n%Y年%m月%d日%H时%M分")
if YU == 1 then Main2() end
if YU == 2 then bbhn1() end
if YU == 3 then bbhn() end
if YU == 4 then Main222() end
if YU == 5 then tc() end
end


function tc()
print(os.date"退出时间%Y年%m月%d日%H时%M分🍓欢迎下次光临🍓")
os.exit()
end

function bbhn()
ZY='bbhn'
NB = gg.choice({
  "🍓地铁金币区🍓",
  "🍓人物皮肤🍓",
  "🍓跑卡双倍🍓",
  "🍓刷宝物区🍓",
  "🍓可自改刷号区🍓",
  "🍓返回主页🍓",
 }, nil,os.date "🍓欢迎使用🍓\n北京时间\n%Y年%m月%d日%H时%M分\n喜羊羊")
if NB == 1 then hb() end
if NB == 2 then pf() end
if NB == 3 then pk() end
if NB == 4 then ffghhh() end
if NB == 5 then jkmn() end
if NB == 6 then fhcdm() end

end

function fhcdm()
Main()
end

function tc()
print(os.date"退出时间\n%Y年%m月%d日%H时%M分\nQQ群536825899\n🍓喜羊羊🍓")
os.exit()
end

function ffghhh()
ZY = 'zgbw'
lq=gg.choice({
'🍓抽取次数520🍓',
'🍓自定义抽取宝物🍓',
'🍓返回🍓'},nil,'')
if lq==nil then else end
if lq==1 then cs666() end
if lq==2 then bw666() end
if lq==3 then bnl666() end
end


function cs666()
local tb1 = {{2324,0}, {1,-4},{1,4},} 	
local tb2 = {{0,0x148},{0,0x13C},{-521,0x138},}
local dataType = 4
gg.setRanges(32)
 SearchWrite(tb1,tb2, dataType)
end


function bw666()
search(21,4,32)
py1(1,4,0x4)
py1(1,4,-0x4)
py1(1,4,0x24)
py1(1,4,0x2C)
py1(1,4,0x44)
py1(1,4,0x3C)
py1(1,4,0x54)
py1(1,4,0x5C)
xg1(0,4,0x18)
xg1(0,4,0xC)
xg1(0,4,0x70)
xg1(0,4,0x64)
xg1(1314,4,0x8)
xg1(gg.prompt({"宝物代码:\n1面具\n2骷髅耳环\n3花球\n4发条\n5纹章\n6星星项链\n7机器手表\n8金色耳环\n9黄冠\n10头盔\n11狼牙项链\n12纯金手表\n13金箍\n14乾坤圈\n15水手瞄\n16积木\n17灵符\n18铠甲\n19令牌\n20龙蛋\n21南瓜\n22月兔\n23武狮头\n24手链\n25圣诞帽\n26夹克\n27红色战衣\n28灯笼\n29折扇\n30卫衣\n31校服\n32相机\n33耳机\n34眼镜\n"},{[1]=""},{[1]="number"})[1],4,0x60)
gg.toast("修改成功")
end
function Exit()
  print("喜羊羊官方群536825899")
  os.exit()
end

function bnl666()
bbhn()
end


function hb()
ZY='hb'
  QW = gg.choice({
  "🍓金币修改🍓",
  "🍓钥匙修改（1000就可以）🍓",
  "🍓宝物钥匙🍓",
  "🍓返回上页🍓",
 }, nil,os.date "北京时间\n%Y年%m月%d日%H时%M分\n喜羊羊官方群536825899")
 if QW == 1 then jb() end
 if QW == 2 then yc() end
 if QW == 3 then fc() end
 if QW == 4 then hb1() end
end

function jb()
search(65536,4,32)
py1(1,4,0xC)
py1(1,4,0x20)
xg1(0,4,0x14,true)
xg1(0,4,0x8,true)
xg1(gg.prompt({'推荐3千万'}, {[1] = '30000000'}, {[1] = 'number'})[1],4,0x4,true)
gg.alert(os.date'修改时间\n%Y年%m月%d日%H时%M分\n修改成功请任意购买一样东西')
end
function yc()
search(65536,4,32)
py1(1,4,0x20)
py1(1,4,0x34)
xg1(0,4,0x28,true)
xg1(0,4,0x1C,true)
xg1(gg.prompt({'钥匙现在容易封号\n改完请任意购买一样东西'}, {[1] = '10000'}, {[1] = 'number'})[1],4,0x18,true)
gg.alert(os.date'修改时间\n%Y年%m月%d日%H时%M分\n修改成功请把游戏后台划掉')
end

function fc()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(0,4,0x1BC,true)
xg1(0,4,0x1C8,true)
xg1(gg.prompt({'推荐1000钥匙'}, {[1] = '1000'}, {[1] = 'number'})[1],4,0x1B8,true)
gg.alert(os.date'修改时间\n%Y年%m月%d日%H时%M分\n修改成功')
end

function hb1()
Main()
end

function pf()
ZY='pf'
  PF = gg.choice({
  "🍓刷人物🍓",
  "🍓刷滑板🍓",
  "🍓刷背饰🍓",
  "🍓返回上页🍓",
 }, nil,os.date "QQ群536825899：北京时间%Y年%m月%d日%H时%M分\nQQ群536825899\n喜羊羊")

if PF == 1 then rw() end
if PF == 2 then gha() end
if PF == 3 then gjk() end
if PF == 4 then pf1() end
end

function rw()
search(1188,4,32)
py1(366,4,0x68)
py1(200,4,-0x20)
xg1(0,4,0x4)
xg1(0,4,0x784)
xg1(0,4,0x964)
xg1(0,4,0xA04)
xg1(0,4,0xAA4)
xg1(0,4,0xB44)
xg1(0,4,0xBE4)
xg1(0,4,0xC84)
xg1(0,4,0xD24)
xg1(0,4,0xDC4)
xg1(0,4,0xE64)
xg1(0,4,0xF04)
xg1(0,4,0xFA4)
xg1(0,4,0x1044)
xg1(0,4,0x1184)
xg1(0,4,0x1224)
xg1(0,4,0x12C4)
xg1(0,4,0x1364)
xg1(0,4,0x1404)
xg1(0,4,0x14A4)
xg1(0,4,0x1544)
xg1(0,4,0x15E4)
xg1(0,4,0x1684)
xg1(0,4,0x1724)
xg1(0,4,0x17C4)
xg1(0,4,0x1864)
xg1(0,4,0x1904)
xg1(0,4,0x19A4)
xg1(0,4,0x1A44)
xg1(0,4,0x1AE4)
xg1(0,4,0x1B84)
xg1(0,4,0x1C24)
xg1(0,4,0x1D64)
xg1(0,4,0x1E04)
xg1(0,4,0x1EA4)
xg1(0,4,0x1F44)
xg1(0,4,0x1FE4)
xg1(0,4,0x2084)
xg1(0,4,0x2124)
xg1(0,4,0x21C4)
xg1(0,4,0x2264)
xg1(0,4,0x2304)
xg1(0,4,0x23A4)
xg1(0,4,0x2444)
xg1(0,4,0x24E4)
xg1(0,4,0x2584)
xg1(0,4,0x2624)
xg1(0,4,0x26C4)
xg1(0,4,0x2764)
xg1(0,4,0x2804)
xg1(0,4,0x4B04)
xg1(0,4,0x4BA4)
xg1(0,4,0x4C44)
xg1(0,4,0x4CE4)
xg1(0,4,0x4D84)
xg1(0,4,0x4E24)
xg1(0,4,0x4EC4)
xg1(0,4,0x4F64)
xg1(0,4,0x5004)
xg1(0,4,0x6684)
xg1(0,4,0x6724)--喵千金显示
search(2522,4,32)
py1(95000,4,0x18)
py1(2523,4,0x38)
xg1(0,4,0x3C)
xg1(0,4,0xDC)
xg1(0,4,0x17C)
xg1(0,4,0x21C)
xg1(0,4,0x2BC)
xg1(0,4,0x35C)
xg1(0,4,0x3FC)
xg1(0,4,0x49C)
xg1(0,4,0x53C)
xg1(0,4,0x5DC)
xg1(0,4,0x67C)
xg1(0,4,0x71C)
xg1(0,4,0x7BC)
xg1(0,4,0x85C)
xg1(0,4,0x8FC)
xg1(0,4,0x99C)
xg1(0,4,0xA3C)
xg1(0,4,0xADC)
xg1(0,4,0xB7C)
xg1(0,4,0xC1C)
xg1(0,4,0xD5C)
xg1(0,4,0xDFC)
xg1(0,4,0xE9C)
xg1(0,4,0xF3C)
xg1(0,4,0xFDC)
xg1(0,4,0x111C)
xg1(0,4,0x11BC)
xg1(0,4,0x125C)
xg1(0,4,0x12FC)
xg1(0,4,0x139C)
xg1(0,4,0x143C)
xg1(0,4,0x14DC)
xg1(0,4,0x161C)
xg1(0,4,0x16BC)
xg1(0,4,0x175C)
xg1(0,4,0x189C)
xg1(0,4,0x193C)
xg1(0,4,0x19DC)
xg1(0,4,0x1A7C)
xg1(0,4,0x1B1C)
xg1(0,4,0x1BBC)
xg1(0,4,0x1C5C)
xg1(0,4,0x1CFC)
xg1(0,4,0x1D9C)
xg1(0,4,0x1E3C)
xg1(0,4,0x1EDC)
xg1(0,4,0x201C)
xg1(0,4,0x20BC)
xg1(0,4,0x215C)
xg1(0,4,0x21FC)
search(3293,4,32)
py1(95000,4,0x18)
py1(3294,4,0x38)
xg1(0,4,0x3C)
xg1(0,4,0xDC)
xg1(0,4,0x17C)
xg1(0,4,0x21C)
xg1(0,4,0x2BC)
xg1(0,4,0x35C)
xg1(0,4,0x3FC)
xg1(0,4,0x49C)
xg1(0,4,0x53C)
xg1(0,4,0x5DC)
xg1(0,4,0x67C)
xg1(0,4,0x71C)
xg1(0,4,0x7BC)
xg1(0,4,0x85C)
xg1(0,4,0x8FC)
xg1(0,4,0x99C)
xg1(0,4,0xA3C)
xg1(0,4,0xADC)
xg1(0,4,0xB7C)
xg1(0,4,0xC1C)
xg1(0,4,0xCBC)
xg1(0,4,0xD5C)
xg1(0,4,0xDFC)
xg1(0,4,0xE9C)
xg1(0,4,0xF3C)
xg1(0,4,0xFDC)
xg1(0,4,0x107C)
xg1(0,4,0x111C)
xg1(0,4,0x11BC)
xg1(0,4,0x125C)
xg1(0,4,0x12FC)
xg1(0,4,0x139C)
xg1(0,4,0x143C)
xg1(0,4,0x14DC)
xg1(0,4,0x157C)
xg1(0,4,0x161C)
xg1(0,4,0x16BC)
xg1(0,4,0x175C)
xg1(0,4,0x17FC)
xg1(0,4,0x189C)
xg1(0,4,0x193C)
xg1(0,4,0x19DC)
xg1(0,4,0x1A7C)
xg1(0,4,0x1C5C)--番薯仔显示
gg.toast('👿正在开启金币购买👿')

search(95000,4,32)
py1(107,4,0x78)
py1(107,4,0x80)
xg1(2,4,0xAC)
xg1(2,4,-0x94)
xg1(2,4,0x244C)

search(160000,4,32)
py1(41,4,-0x20)
py1(41,4,-0x28)
xg1(2,4,-0x1674)
xg1(2,4,-0x1714)
xg1(2,4,-0x17B4)
xg1(2,4,-0x1854)

search(95000,4,32)
py1(95,4,-0x28)
py1(95,4,-0x20)
xg1(2,4,0xC)

search(160000,4,32)
py1(41,4,-0x28)
py1(41,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(116,4,-0x28)
py1(116,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(140,4,-0x28)
py1(140,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(132,4,-0x28)
py1(132,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(128,4,-0x28)
py1(128,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(122,4,-0x28)
py1(122,4,-0x20)
xg1(2,4,0xC)

search(2347,4,32)
py1(63,4,-0x8)
py1(63,4,-0x10)
xg1(2,4,0x24)

search(2846,4,32)
py1(85,4,-0x8)
py1(85,4,-0x10)
xg1(2,4,0x24)

search(95000,4,32)
py1(102,4,-0x28)
py1(102,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(92,4,-0x28)
py1(92,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(81,4,-0x28)
py1(81,4,-0x20)
xg1(2,4,0xC)

search(1188,4,32)
py1(35,4,-0x40)
py1(35,4,-0x48)
xg1(3,4,-0x14)

search(12000,4,32)
py1(10,4,-0x28)
py1(10,4,-0x20)
xg1(2,4,0xC)

search(2604,4,32)
py1(73,4,-0x8)
py1(73,4,-0x10)
xg1(2,4,0x24)

search(95000,4,32)
py1(56,4,-0x28)
py1(56,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(134,4,-0x28)
py1(134,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)
py1(83,4,-0x20)
py1(83,4,-0x28)
xg1(2,4,0xC)

search(95000,4,32)
py1(71,4,-0x20)
py1(71,4,-0x28)
xg1(2,4,0xC)

search(95000,4,32)
py1(122,4,-0x20)
py1(122,4,-0x28)
xg1(2,4,0xC)

search(95000,4,32)--喵千金金币购买
py1(166,4,-0x28)
py1(166,4,-0x20)
xg1(2,4,0xC)

search(95000,4,32)--幻觉金币购买
py1(167,4,-0x1C)
xg1(0,4,0x24)--幻觉显示
xg1(2,4,0xC)
gg.toast('开启完成')
end
function gha()
search(50000,4,32)
py1(320,4,-0x14)
py1(321,4,0x2C)
xg1(0,4,0x30)
xg1(0,4,0x140)
xg1(0,4,0x250)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x4F8)
xg1(0,4,0x580)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x828)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBF0)
xg1(0,4,0xC68)
xg1(0,4,0xD78)
xg1(0,4,0xE88)
xg1(0,4,0xF10)
xg1(0,4,0xF98)
xg1(0,4,0x1020)
xg1(0,4,0x10A8)
xg1(0,4,0x1130)
xg1(0,4,0x11B8)
xg1(0,4,0x1240)
xg1(0,4,0x12C8)
xg1(0,4,0x1350)
xg1(0,4,0x1460)
xg1(0,4,0x14E8)
xg1(0,4,0x1570)
xg1(0,4,0x15F8)
xg1(0,4,0x1680)
xg1(0,4,0x1708)
search(50000,4,32)
py1(2123,4,0x2C)
py1(2122,4,-0x14)
xg1(0,4,0x30)
xg1(0,4,0xB8)
xg1(0,4,0x140)
xg1(0,4,0x1C8)
xg1(0,4,0x250)
xg1(0,4,0x2D8)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x4F8)
xg1(0,4,0x580)
xg1(0,4,0x608)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x828)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBE0)
xg1(0,4,0xC68)
xg1(0,4,0xCF0)
xg1(0,4,0xD78)
xg1(0,4,0xE00)
xg1(0,4,0xE88)
xg1(0,4,0xF10)
xg1(0,4,0xF98)
xg1(0,4,0x1020)
xg1(0,4,0x10A8)
xg1(0,4,0x11B8)
xg1(0,4,0x1240)
xg1(0,4,0x12C8)
xg1(0,4,0x13D8)
xg1(0,4,0x1460)
search(50000,4,32)
py1(2870,4,0x2C)
py1(2867,4,-0x14)
xg1(0,4,0x30)
xg1(0,4,0x138)
xg1(0,4,0x140)
xg1(0,4,0x1C8)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x470)
xg1(0,4,0x4F8)
xg1(0,4,0x580)
xg1(0,4,0x608)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBE0)
xg1(0,4,0xC68)
xg1(0,4,0xCF0)
xg1(0,4,0xD78)
xg1(0,4,0xE00)
xg1(0,4,0xE88)
xg1(0,4,0xF10)
xg1(0,4,0xF98)
xg1(0,4,0x1020)
xg1(0,4,0x10A8)
xg1(0,4,0x1130)
xg1(0,4,0x11B8)
xg1(0,4,0x1240)
xg1(0,4,0x12C8)
xg1(0,4,0x1350)
xg1(0,4,0x13D8)
xg1(0,4,0x1460)
search(50000,4,32)
py1(3350,4,0x2C)
py1(3349,4,-0x14)
xg1(0,4,0x30)
xg1(0,4,0x138)
xg1(0,4,0x140)
xg1(0,4,0x1C8)
xg1(0,4,0x250)
xg1(0,4,0x2D8)
xg1(0,4,0x360)
xg1(0,4,0x3E8)
xg1(0,4,0x470)
xg1(0,4,0x4F8)
xg1(0,4,0x608)
xg1(0,4,0x690)
xg1(0,4,0x718)
xg1(0,4,0x7A0)
xg1(0,4,0x828)
xg1(0,4,0x8B0)
xg1(0,4,0x938)
xg1(0,4,0x9C0)
xg1(0,4,0xA48)
xg1(0,4,0xAD0)
xg1(0,4,0xB58)
xg1(0,4,0xBE0)
xg1(0,4,0xC68)
xg1(0,4,0xCF0)
xg1(0,4,0xD78)
search(50000,4,32)
py1(832,4,0x2C)
py1(841,4,-0x14)
xg1(0,4,0x30)
search(50000,4,32)
py1(3301,4,0x2C)
py1(3300,4,-0x14)
xg1(0,4,0x30)
search(50000,4,32)
py1(142,4,-0x24)
py1(142,4,-0x1C)
xg1(0,4,0x30)
search(50000,4,32)--原子瓦
py1(3399,4,0x2C)
py1(3398,4,-0x14)
xg1(0,4,0x30)
search(50000,4,32)
py1(157,4,-0x24)
py1(157,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(100,4,-0x24)
py1(100,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(103,4,-0x24)
py1(103,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(137,4,-0x24)
py1(137,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(136,4,-0x24)
py1(136,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(64,4,-0x24)
py1(64,4,-0x1C)
xg1(2,4,0x1C)
search(3171,4,32)
py1(115,4,-0x8)
py1(115,4,-0x10)
xg1(2,4,0x30)
search(2856,4,32)
py1(89,4,-0x8)
py1(89,4,-0x10)
xg1(2,4,0x30)
search(50000,4,32)
py1(121,4,-0x24)
py1(121,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(116,4,-0x24)
py1(116,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(113,4,-0x24)
py1(113,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(96,4,-0x24)
py1(96,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(98,4,-0x24)
py1(98,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(108,4,-0x24)
py1(108,4,-0x1C)
xg1(2,4,0x1C)
search(3001,4,32)
py1(105,4,-0x10)
py1(105,4,-0x8)
xg1(2,4,0x30)
search(5000,4,32)
py1(66,4,-0x24)
py1(66,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(33,4,-0x24)
py1(33,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(6,4,-0x24)
py1(6,4,-0x1C)
xg1(2,4,0x1C)
search(85000,4,32)
py1(11,4,-0x24)
py1(11,4,-0x1C)
xg1(2,4,0x1C)
search(1869,4,32)
py1(45,4,-0x8)
py1(45,4,-0x10)
xg1(2,4,0x30)
search(2868,4,32)
py1(94,4,-0x8)
py1(94,4,-0x10)
xg1(2,4,0x30)
search(2318,4,32)
py1(62,4,-0x8)
py1(62,4,-0x10)
xg1(2,4,0x30)
search(50000,4,32)
py1(134,4,-0x24)
py1(134,4,-0x1C)
xg1(2,4,0x1C)
search(2856,4,32)
py1(1,4,16)
py1(80,4,20)
py1(1,4,24)
xg1(2,4,48)
search(2588,4,32)
py1(1,4,16)
py1(50000,4,20)
py1(1,4,24)
xg1(2,4,48)
search(50000,4,32)
py1(85,4,-0x24)
py1(85,4,-0x1C)
xg1(2,4,0x1C)
search(50000,4,32)
py1(75,4,-0x24)
py1(75,1,-0x1C)
xg1(2,1,0x1C)
search(50000,4,32)--萌妹飞车
py1(3428,4,0x2C)
py1(3427,4,-0x14)
xg1(2,4,0x1C)
search(50000,4,32)
py1(160,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(137,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(45,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(53,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(6,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(80,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(94,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(132,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(133,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(164,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(135,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(136,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(138,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(50000,4,32)
py1(139,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(1,4,32)
py1(141,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(1,4,32)
py1(159,4,-0x1C)
xg1(2,4,0x1C)
xg1(0,4,0x30)
search(1,4,32)
py1(168,4,-0x28)
py1(168,4,-0x20)
xg1(0,4,0x24)
xg1(0,4,0x4)
xg1(0,4,-0x8)
xg1(1,4,-0xC)
search(1,4,32)
py1(167,4,-0x28)
py1(167,4,-0x20)
xg1(0,4,0x24)
xg1(0,4,0x4)
xg1(0,4,-0x8)
xg1(2,4,0xC)
xg1(1,4,-0xC)
gg.alert(os.date'滑板修改成功\n修改时间%Y年%m月%d日%H时%M分\n🍓修改成功🍓全部已开启\n666')
end

function gjk()
search(3223,4,32)
py1(3229,4,0x40)
py1(3239,4,0x80)
xg1(0,4,0x114)--风车
xg1(0,4,0x154)--气球
xg1(0,4,0x1D4)--花环
xg1(0,4,0x254)
xg1(0,4,0x294)
xg1(0,4,0x2D4)
xg1(0,4,0x314)
xg1(0,4,0x354)
xg1(0,4,0x394)
xg1(0,4,0x3D4)
search(3223,4,32)
py1(3229,4,0x40)
py1(3239,4,0x80)
xg1(1,4,0xC)
xg1(0,4,0x8)
xg1(1,4,0x4c)
xg1(0,4,0x48)
xg1(1,4,0x8C)
xg1(0,4,0x88)
xg1(1,4,0xCC)
xg1(0,4,0xC8)
xg1(1,4,0x10C)
xg1(0,4,0x108)
xg1(1,4,0x14C)
xg1(0,4,0x148)
xg1(1,4,0x18C)
xg1(0,4,0x188)
xg1(1,4,0x1CC)
xg1(0,4,0x1C8)
xg1(1,4,0x20C)
xg1(0,4,0x208)
xg1(1,4,0x24C)
xg1(0,4,0x248)
xg1(1,4,0x28C)
xg1(0,4,0x288)
xg1(1,4,0x2CC)
xg1(0,4,0x2C8)
xg1(1,4,0x30C)
xg1(0,4,0x308)
xg1(1,4,0x34C)
xg1(0,4,0x348)
xg1(1,4,0x38C)
xg1(0,4,0x388)
xg1(1,4,0x3CC)
xg1(0,4,0x3C8)
gg.alert(os.date'背饰修改成功\n修改时间%Y年%m月%d日%H时%M分\n🍓修改成功🍓全部已开启\n666')
end

function pf1()
bbhn()
end

function bbhn1()
ZY='bbhn1'
NB=gg.choice({
  "🍓比赛🍓",
  "🍓多功能脚本🍓",
  "🍓普通跑酷🍓",
  "🍓返回主页🍓",
}, nil,os.date "喜羊羊官方群聊536825899官方加入\n北京时间%Y年%m月%d日%H时%M分\n️‍QQ群536825899\n´🍓🍓`")
if NB == 1 then Main42() end
if NB == 2 then dyu() end
if NB == 3 then dyu1() end
if NB == 4 then fhcnm() end
end

function dyu1()
ZY='dyu1'
NB=gg.choice({
  "🍓无尽爆分🍓",
  "🍓自定义道具🍓",
  "🍓返回上页🍓",
}, nil,os.date "喜羊羊官方群536825899\n666")
if NB == 1 then baofenmain() end
if NB == 2 then zdydj() end
if NB == 3 then dyu3() end
end

function baofenmain()
local a=gg.choice({'开启功能(局内开启）','关闭功能(结算前使用)'},nil,os.date'分数上传不了，要关闭之后再结算！！！')
if a ==1 then 
baofenexit()
end
if a ==2 then 
baofen()
end
end

function zyxfs()
jishuqi=2
gg.clearResults()
gg.setRanges(16)
gg.searchNumber('1094268983',4)
local k=gg.getResults(1)
gg.addListItems({{address=k[1].address-0x8,flags=4,value=-1,freeze=true}})
Main()
end

function baofenexit()
gg.ss=gg.searchNumber
gg.clearResults()
gg.clearList()
gg.setRanges(4)
gg.ss('0.01999999955F;50.0F;0.99999988079F;1.0F;0.33333334327F;0.02999999933F',16)
gg.ss('1.0',16)
local B=gg.getResults(1)
gg.addListItems({{address=B[1].address,flags=16,value=-9999,freeze=true}})
end

function baofen()
local B=gg.getResults(1)
gg.addListItems({{address=B[1].address,flags=16,value=1,freeze=false}})
gg.clearResults()
gg.clearList()
end

function zdydj()
search(256,4,32)
py1(1,4,-72)
py1(1,4,-12)
xg1(gg.prompt({'火速输入道具代码6\n取消会报错6'}, {[1] = ''}, {[1] = 'number'})[1], 4,-92,true)
gg.toast('喜提自定义道具')
end

function dyu3()
bbhn1()
end

function fhcnm()
Main()
end

function Main42()
ZY = 'Main42'
lq=gg.choice({'瞬移菜单 -〔变态功能〕',
'道具菜单 -〔普通〕',
'其他菜单 -〔普通〕',
'返回上页'},nil,'')
if lq==nil then else
if lq==1 then A() end
if lq==2 then B() end
if lq==3 then C() end
if lq==4 then D11() end
end end

function D11()
bbhn1()
end

function A()
ZY = 'A'
lq=gg.choice({'﹝大厅﹞一键开启️',
'﹝大厅﹞一键恢复',
'穿墙加速(打人机时开启)',
'恢复',
'人物减慢',
'恢复',
'进程恢复❌',
'匹配时间恢复❌',
'人物加速恢复❌',
'返回主菜单'},nil,'QQ群536825899\n•ᴗ•')
if lq==nil then else
if lq==1 then yjkq1() end
if lq==2 then yjkq2() end
if lq==3 then yjkq3() end
if lq==4 then yjkq4() end
if lq==5 then yjkq5() end
if lq==6 then yjkq6() end
if lq==7 then yjkq7() end
if lq==8 then yjkq8() end
if lq==9 then yjkq9() end
if lq==10 then fhcd10() end
end end

function yjkq1()
search(200,16,32)
py1(25,16,-4)
py1(40,16,4)
py1(20,16,-8)
py1(0.5,16,-20)
py1(1.5,16,-28)
py1(10,16,-72)
py1(15,16,352)
xg1(854254,4,20,true)
xg1(1143703790,4,24,true)
xg1(1,4,32,true)          
xg1(666,16,36,true)
xg1(1,4,40,true)
gg.toast('防检测已开启')
gg.toast('全体开启成功！')
end

function yjkq2()
search(200,16,32)
py1(25,16,-4)
py1(40,16,4)
py1(20,16,-8)
py1(0.5,16,-20)
py1(1.5,16,-28)
py1(10,16,-72)
py1(15,16,352)
xg1(nil,4,20,false)
xg1(nil,4,20)
xg1(nil,4,24,false)
xg1(nil,4,24)
xg1(1,4,32,false)          
xg1(nil,16,36,false)
xg1(nil,16,36)
xg1(1,4,40,false)
gg.toast('防检测已恢复')
gg.toast('全体关闭成功！')
end

function yjkq3()
search(5.5,16,32)
py1(4.5,16,-16)
py1(9.0,16,-8)
xg1(110,16,-344,true)
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1.19,16,-28,true)
gg.toast("穿墙加速开启成功！")
end

function yjkq4()
search(5.5,16,32)
py1(4.5,16,-16)
py1(9.0,16,-8)
xg1(20,16,-344,false)
xg1(20,16,-344)
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1,16,-28,false)
xg1(1,16,-28)
gg.toast("穿墙加速恢复成功！")
end


function yjkq5()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(0.99,16,-28,true)
gg.toast('人物减慢开启成功！')
end


function yjkq6()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1,16,-28,true)
xg1(1,16,-28)
gg.toast('人物减慢已恢复！')
end

function yjkq7()
search(6420,4,4)
py1(513,4,-8)
py1(12,4,-12)
py1(60,4,244)
xg1(1,16,224,true)
gg.toast('进程加速已恢复！')
end


function yjkq8()
search(300,16,32)
py1(160,16,-4)
py1(60,16,4)
py1(10,16,-8)
xg1(0,4,-1184,false) 
xg1(666,4,-1184)
xg1(30,4,-1180,false)
xg1(30,4,-1180) 
search(300,16,32)
py1(160,16,-4)
py1(60,16,4)
py1(10,16,-8)
xg1(0,4,-1184,false) 
xg1(666,4,-1184)
xg1(30,4,-1180,false)
xg1(30,4,-1180) 
gg.toast('匹配时间6亿秒已恢复！')
end

function yjkq9()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1,16,-28,false)
xg1(1,16,-28)
gg.toast('人物加速已恢复！')
end

function fhcd10()
Main()
end

function B()
ZY = 'B'
lq=gg.choice({
'🍓滑板功能🍓',
'🍓冻结功能🍓',
'🍓道具槽功能🍓',
'返回主页'},nil,'提示：\n道具槽功能说明：\n请在所需要道具为空的情况下，开启修改！\n为空修改之后，再去捡到一个道具即可！\n注意！ 如需要其他道具，请恢复你之前所修改的！令此时的道具为空！之后再捡')
if lq==nil then else
if lq==1 then Bn() end
if lq==2 then B0() end
if lq==3 then B1() end
if lq==4 then Main() end
end end

function Bn()
ZY = 'Bn'
lq=gg.choice({
'🍓一滑板一能量已失效推荐使用下面那个↓🍓',
'🍓滑板无限时长[开局使用]🍓',
'🍓过时间检测🍓',
'🍓返回道具菜单'},nil,'道具赛内开局就使用！🍓')
if lq==nil then else
if lq==1 then hb3() end
if lq==2 then hb4() end
if lq==3 then djy33() end
if lq==4 then fhcd1() end
end end

function hb3()
search(1300,16)
py1(1000,16,24)  
py1(300,16,72)
xg1(1.27786509e-39,16,56,true)
xg1(1023202.6875,16,60,true)
xg1(1000000,16,72,true)
gg.toast('🍓已将一能量一滑板保存至列表🍓')
end

function djy33()
search(16842756,4,4)
py1(1,4,-0x16,842,753)
py1(2,4,-0x16,842,754)
xg1(1,16,-0x1,048,641,540,true)
gg.toast('🍓已开启有封号风险🍓')
end

function hb4()
search(1300,16)
py1(1000,16,24)  
py1(300,16,72)
xg1(1.27786509e-39,16,80,true)
xg1(1023202.6875,16,84,true)
xg1(1000000,16,96,true)
gg.toast('🍓滑板无限时长已开启🍓')
end

function fhcd1()
B()
end

function B0()
ZY = 'B0'
lq=gg.choice({'🍓冻结道具1🍓️',
'🍓恢复🍓',
'🍓冻结道具2🍓️',
'🍓恢复🍓',
'🍓返回道具菜单🍓'},nil,'')
if lq==nil then else
if lq==1 then djgn1() end
if lq==2 then djgnhf1() end
if lq==3 then djgn2() end
if lq==4 then djgnfh2() end
if lq==5 then fhcd2() end
end end

function djgn1()
search(114,4,32)
py1(7209033,4,-12)
py1(6881398,4,-8)
xg1(nil,4,-40,true)
gg.toast('🍓道具1已冻结🍓')
end

function djgnhf1()
search(114,4,32)
py1(7209033,4,-12)
py1(6881398,4,-8)
xg1(nil,4,-40,false)
gg.toast('🍓道具1已恢复🍓')
end

function djgn2()
search(114,4,32)
py1(7209033,4,-12)
py1(6881398,4,-8)
xg1(nil,4,-36,true)
gg.toast('🍓道具2已冻结🍓')
end

function djgnfh2()
search(114,4,32)
py1(7209033,4,-12)
py1(6881398,4,-8)
xg1(nil,4,-36,false)
gg.toast('🍓道具2已恢复🍓')
end

function fhcd2()
B()
end

function B1()
ZY = 'B1'
search(256,4,32)
py1(1,4,-72)
py1(1,4,-12)
xg1(gg.prompt({'输入你想要的道具代码\n取消将错误后退出脚本'}, {[1] = ''}, {[1] = 'number'})[1], 4,-92,true)
gg.toast('以将自定义道具保存至列表')
end

function fhcd4()
B()
end

function C()
ZY = 'C'
lq=gg.choice({'微加速',
'恢复',
'超级跳跃',
'恢复',
'下滑瞬移',
'恢复',
'瞬移第一',
'恢复',
'左右穿墙',
'恢复',
'人物冻结',
'恢复',
'全局无视[开局请下滑开启]',
'恢复',
'无视侧撞[火车、墙壁的侧面]',
'恢复',
'开局冲刺[2.6秒自动恢复，每局一次]',
'返回主页'},nil,'必看！\n------------------------\n①微加速必须在1分21秒后跑到第一名，否则太早就会检测！！\n------------------------\n②瞬移功能大约在1分30秒后开启，必须正处于路程的中后期,这个功能不确定，自己把握！\n------------------------\n③开局冲刺在开局3、2、1倒计时结束后立即开启\n④全局无视开启后，需要下滑！！进行二次开启')
if lq==nil then else
if lq==1 then gn1() end
if lq==2 then gn2() end
if lq==3 then gn3() end
if lq==4 then gn4() end
if lq==5 then gn5() end
if lq==6 then gn6() end
if lq==7 then gn7() end
if lq==8 then gn8() end
if lq==9 then gn9() end
if lq==10 then gn10() end
if lq==11 then gn11() end
if lq==12 then gn12() end
if lq==13 then gn13() end
if lq==14 then gn14() end
if lq==15 then gn15() end
if lq==16 then gn16() end
if lq==17 then gn17() end
if lq==18 then fhcd5() end
end end

function gn1()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1.00030004978,16,-28,true)
gg.toast('微加速开启成功！')
end

function gn2()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1,16,-28,false)
xg1(1,16,-28)
gg.toast('微加速已恢复！')
end

function gn3()
search(4.5,16,32)
py1(15.0,16,-88)
py1(9.0,16,8)
xg1(400,16,-332,true)
gg.toast('超级跳跃已开启！')
end

function gn4()
search(4.5,16,32)
py1(15.0,16,-88)
py1(9.0,16,8)
xg1(20,16,-332,false)
xg1(20,16,-332)
gg.toast('超级跳跃已恢复！')
end

function gn5()
search(-8388608,4,32)
py1(-1082130432,4,-16)
py1(2139095040,4,-8)
xg1(120,16,-64,true)
gg.toast('下滑瞬移已开启！')
end

function gn6()
search(-8388608,4,32)
py1(-1082130432,4,-16)
py1(2139095040,4,-8)
xg1(0,16,-64,false)
xg1(0,16,-64)
gg.toast('下滑瞬移已恢复！')
end

function gn7()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1.5,16,-28,true)
gg.toast('瞬移成功！')
end

function gn8()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1,16,-28,false)
xg1(1,16,-28)
gg.toast('瞬移已恢复！')
end

function gn9()
search(-8388608,4,32)
py1(-1082130432,4,-16)
py1(2139095040,4,-8)
xg1(2.7,16,-48,true)
gg.toast('左右穿墙已开启！')
end

function gn10()
search(-8388608,4,32)
py1(-1082130432,4,-16)
py1(2139095040,4,-8)
xg1(1,16,-48,false)
xg1(1,16,-48)
gg.toast('左右穿墙已恢复！')
end

function gn11()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(0,16,-28,true)
gg.toast('人物冻结开启成功！')
end

function gn12()
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1,16,-28,false)
xg1(1,16,-28)
gg.toast('人物冻结已恢复！')
end

function gn13()
search(4.5,16)
py1(5.5,16,16)
xg1(9191,16,0,true)
xg1(9192,16,16,true)
gg.toast('全局无视火车开启成功！')
end

function gn14()
search(4.5,16)
py1(5.5,16,16)
xg1(4.5,16,0,false)
xg1(5.5,16,16,false)
xg1(4.5,16,0)
xg1(5.5,16,16)
gg.toast('全局无视已恢复')
end

function gn15()
search(9.0,16,32)
py1(1.5,16,-476)
py1(0.5,16,-468)
xg1(-1,4,-80,true)
gg.toast('无视侧撞已开启！')
end

function gn16()
search(9.0,16,32)
py1(1.5,16,-476)
py1(0.5,16,-468)
xg1(0,4,-80,false)
xg1(0,4,-80)
gg.toast('无视侧撞已恢复！')
end

function gn17()
search(5.5,16,32)
py1(4.5,16,-16)
py1(9.0,16,-8)
xg1(110,16,-344,true)
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1.06,16,-28,true)
gg.toast('冲刺开启成功！')
gg.sleep(260)
search(-8388608,4,32)
py1(1065353216,4,-92)
py1(-1082130432,4,-60)
xg1(1,16,-28,false)
xg1(1,16,-28)
search(5.5,16,32)
py1(4.5,16,-16)
py1(9.0,16,-8)
xg1(20,16,-344,false)
xg1(20,16,-344)
gg.toast('冲刺完毕！已恢复')
end

function fhcd5()
Main()
end

function TC11()
Main()
end

function pk()
ZY='pk'
  SN = gg.choice({
  "炫跑卡",
  "终极版炫跑卡",
  "双倍金币",
  "自定义等级",
  "返回上页",
 }, nil,os.date "北京时间%Y年%m月%d日%H时%M分\nSꫀꪀs🗽定制️")
if SN == 1 then xp() end
if SN == 2 then ycxp() end
if SN == 3 then sbjb() end
if SN == 4 then zddj() end
if SN == 5 then pk1() end
end
 
function xp()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(0,4,0x5C)
xg1(0,4,0x50)
xg1(gg.prompt({'等级1~6️'}, {[1] = '6'}, {[1] = 'number'})[1],4,0x4C)
gg.alert(os.date'修改时间%Y年%m月%d日%H时%M分️\n修改成功')
end

function ycxp()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(0,4,0x5C)
xg1(0,4,0x50)
xg1(999,4,0x4C)
gg.alert(os.date':) 修改时间:) \n;) %Y年%m月%d日%H时%M分;) \n:( 修改成  功:( ')
end


function sbjb()
search(2283,4,32)
py1(1,4,0x68)
py1(1,4,0x70)
xg1(65537,4,-0x414)
gg.alert(os.date':D 修改时间:D \n:P %Y年%m月%d日%H时%M分:P \n:| 修改成功:| ')
end

function zddj()
search(2343,4,32)
py1(2342,4,0x10)
xg1(gg.prompt({'️不要改太大\n否则进不去游戏️'}, {[1] = ''}, {[1] = 'number'})[1],4,-0x5DC)
gg.alert('💨修改成功💨')
end


function pk1()
Main()
end

function dyu()
 SN = gg.multiChoice({
"无敌金刚不败",
"无敌穿透",
"恢复",
"技能无限时长",
"滑板无限时长",
"高跳",
"恢复",
"飞天",
"恢复",
"全局微加速",
"恢复",
"全局极速",
"恢复",
"锁定高度",
"恢复",
"爱的魔力转圈圈",
"恢复",
"二段跳",
"多段跳 需要有节奏的跳",
"恢复",
"下滑瞬移",
"恢复",
"秒变道",
"恢复",
}, nil, "")
if SN == nil then else
if SN[1] == true then a() end
if SN[2] == true then b() end
if SN[3] == true then c() end
if SN[4] == true then d() end
if SN[5] == true then e() end
if SN[6] == true then f() end
if SN[7] == true then g() end
if SN[8] == true then h() end
if SN[9] == true then i() end
if SN[10] == true then j() end
if SN[11] == true then k() end
if SN[12] == true then l() end
if SN[13] == true then m() end
if SN[14] == true then n() end
if SN[15] == true then o() end
if SN[16] == true then p() end
if SN[17] == true then q() end
if SN[18] == true then r() end
if SN[19] == true then s() end
if SN[20] == true then t() end
if SN[21] == true then u() end
if SN[22] == true then v() end
if SN[23] == true then w() end
if SN[24] == true then x() end
if SN[25] == true then y() end
if SN[26] == true then z() end
if SN[27] == true then aa() end
if SN[28] == true then bb() end
if SN[29] == true then Exit() end
end  end

function a()
qmnb = {
{["memory"] = 32},
{["name"] = "无敌"},
{["value"] = 4.5, ["type"] = 16},
{["lv"] = 5.5, ["offset"] = 16, ["type"] = 16},
}
qmxg = {
{["value"] = 999, ["offset"] = 28, ["type"] = 16,["freeze"] = true},
}
xqmnb(qmnb)
end

function b()
qmnb = {
{["memory"] = 32},
{["name"] = "穿透"},
{["value"] = 4.5, ["type"] = 16},
{["lv"] = 5.5, ["offset"] = 16, ["type"] = 16},
}
qmxg = {
{["value"] = 9191, ["offset"] = 0, ["type"] = 16},
{["value"] = 9192, ["offset"] = 16, ["type"] = 16},
}
xqmnb(qmnb)
end

function c()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复穿透"},
{["value"] = 9191.0, ["type"] = 16},
{["lv"] = 9192.0, ["offset"] = 16, ["type"] = 16},
}
qmxg = {
{["value"] = 4.5, ["offset"] = 0, ["type"] = 16},
{["value"] = 5.5, ["offset"] = 16, ["type"] = 16},
}
xqmnb(qmnb)
end

function d()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("30;30;30;25::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("30;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("999999999", gg.TYPE_FLOAT)
gg.toast("成功")
end

function e()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1000;250;30", FLOAT, false, gg.SIGN_EQUAL, 0, -1)
if gg.getResultCount() == 0 then
gg.toast("开启失败")
else
gg.searchNumber("30",FLOAT , false, gg.SIGN_EQUAL, 0, -1)
jg=gg.getResults(100)--设置冻结前100个代码
sl=gg.getResultCount() 
for i = 1, sl do
dzy=jg[i].address
gg.addListItems({[1] = {address = dzy,flags = FLOAT,freeze = true,value = "999999999"}})
end
gg.toast("成功")
gg.clearResults()
end
end

function f()
qmnb = {
{["memory"] = 32},
{["name"] = "高跳"},
{["value"] = 1.5, ["type"] = 16},
{["lv"] = 0.5, ["offset"] = 8, ["type"] = 16},
}
qmxg = {
{["value"] = 156, ["offset"] = -20, ["type"] = 16,["freeze"] = true},
{["value"] = 39, ["offset"] = 136, ["type"] = 16,["freeze"] = true},
}
xqmnb(qmnb)
end

function g()
qmnb = {
{["memory"] = 32},
{["name"] = "高跳恢复"},
{["value"] = 1.5, ["type"] = 16},
{["lv"] = 0.5, ["offset"] = 8, ["type"] = 16},
}
qmxg = {
{["value"] = 40, ["offset"] = -20, ["type"] = 16,["freeze"] = true},
{["value"] = 20, ["offset"] = 136, ["type"] = 16,["freeze"] = true},
}
xqmnb(qmnb)
end

function h()
qmnb = {
{["memory"] = 4},
{["name"] = "飞天"},
{["value"] = 1060439284, ["type"] = 4},
{["lv"] = 1077936128, ["offset"] = 24, ["type"] = 4},
}
qmxg = {
{["value"] = 1120403456, ["offset"] = 20, ["type"] = 4},
}
xqmnb(qmnb)
end

function i()
qmnb = {
{["memory"] = 4},
{["name"] = "飞天恢复"},
{["value"] = 1060439284, ["type"] = 4},
{["lv"] = 1077936128, ["offset"] = 24, ["type"] = 4},
}
qmxg = {
{["value"] = 1045220557, ["offset"] = 20, ["type"] = 4},
}
xqmnb(qmnb)
end

function j()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("1;0.33333334327;0.03::", FLOAT, false, gg.SIGN_EQUAL, 0, -1)
if gg.getResultCount() == 0 then
gg.toast("开启失败")
else
gg.searchNumber("1",FLOAT , false, gg.SIGN_EQUAL, 0, -1)
jg=gg.getResults(100)
sl=gg.getResultCount() 
for i = 1, sl do
dzy=jg[i].address
gg.addListItems({[1] = {address = dzy,flags = FLOAT,freeze = true,value = "9"}})
end
gg.toast("成功")
gg.clearResults()
end
end

function k()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("9;0.33333334327;0.03::", FLOAT, false, gg.SIGN_EQUAL, 0, -1)
if gg.getResultCount() == 0 then
gg.toast("开启失败")
else
gg.searchNumber("9",FLOAT , false, gg.SIGN_EQUAL, 0, -1)
jg=gg.getResults(100)
sl=gg.getResultCount() 
for i = 1, sl do
dzy=jg[i].address
gg.addListItems({[1] = {address = dzy,flags = FLOAT,freeze = true,value = "1"}})
end
gg.toast("成功")
gg.clearResults()
end
end

function l()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("1;0.33333334327;0.03::", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(100)
gg.editAll("60",gg.TYPE_FLOAT)
gg.toast("成功")
end

function m()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("60;0.33333334327;0.03::", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("60", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(100)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function n()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("20;25;200;40::", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("200", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(50)
gg.editAll("0",gg.TYPE_FLOAT)
gg.toast("成功")
end

function o()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("20;25;0;40::", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("0", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(50)
gg.editAll("200",gg.TYPE_FLOAT)
gg.toast("成功")
end

function p()
qmnb = {
{["memory"] = 32},
{["name"] = "转圈圈"},
{["value"] = 20.0, ["type"] = 16},
{["lv"] = 20.0, ["offset"] = 4, ["type"] = 16},
{["lv"] = 1.0, ["offset"] = 20, ["type"] = 16},
{["lv"] = 45.0, ["offset"] = 24, ["type"] = 16},
}
qmxg = {
{["value"] = 166, ["offset"] = 20, ["type"] = 16,["freeze"] = true},
{["value"] = 99999, ["offset"] = 24, ["type"] = 16,["freeze"] = true},
}
xqmnb(qmnb)
end

function q()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复转圈圈"},
{["value"] = 20.0, ["type"] = 16},
{["lv"] = 20.0, ["offset"] = 4, ["type"] = 16},
{["lv"] = 166.0, ["offset"] = 20, ["type"] = 16},
{["lv"] = 99999.0, ["offset"] = 24, ["type"] = 16},
}
qmxg = {
{["value"] = 1, ["offset"] = 20, ["type"] = 16,["freeze"] = true},
{["value"] = 45, ["offset"] = 24, ["type"] = 16,["freeze"] = true},
}
xqmnb(qmnb)
end

function r()
qmnb = {
{["memory"] = 32},
{["name"] = "二段跳"},
{["value"] = 5.5, ["type"] = 16},
{["lv"] = 4.5, ["offset"] = -16, ["type"] = 16},
}
qmxg = {
{["value"] = 1, ["offset"] = -276, ["type"] = 16,},
}
xqmnb(qmnb)
end

function s()
qmnb = {
{["memory"] = 32},
{["name"] = "多段跳"},
{["value"] = 5.5, ["type"] = 16},
{["lv"] = 4.5, ["offset"] = -16, ["type"] = 16},
}
qmxg = {
{["value"] = 0, ["offset"] = -276, ["type"] = 16,["freeze"] = true},
}
xqmnb(qmnb)
end

function u()
qmnb = {
{["memory"] = 32},
{["name"] = "下滑瞬移"},
{["value"] = -8388608, ["type"] = 4},
{["lv"] = -1082130432, ["offset"] = -16, ["type"] = 4},
{["lv"] = 2139095040, ["offset"] = -8, ["type"] = 4},
}
qmxg = {
{["value"] = 99999, ["offset"] = -64, ["type"] = 16},
}
xqmnb(qmnb)
end

function v()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复瞬移"},
{["value"] = -8388608, ["type"] = 4},
{["lv"] = -1082130432, ["offset"] = -16, ["type"] = 4},
{["lv"] = 2139095040, ["offset"] = -8, ["type"] = 4},
}
qmxg = {
{["value"] = 0, ["offset"] = -64, ["type"] = 16},
}
xqmnb(qmnb)
end

function w()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("9.04809338e-38;1::", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(100)
gg.editAll("999",gg.TYPE_FLOAT)
gg.toast("成功")
end

function x()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("9.04809338e-38;999::", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("999", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(100)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function jkmn()
ZY='jkmn'
lq=gg.choice({
'️️其他区️',
'️自定义区️',
'返回主菜单'},nil,'Sꫀꪀs🗽定制')
if lq==nil then else
if lq==1 then Main34() end
if lq==2 then Main35() end
if lq==3 then Main36() end
end end

function Main34()
ZY='Main34'
lq=gg.choice({
'️🍓开启旧版头像框🍓',
'🍓付费皮肤改金币🍓',
'🍓双倍金币🍓',
'🍓炫跑卡🍓',
'🍓黄色金币🍓',
'🍓蓝色钥匙🍓',
'🍓自定义头像框🍓',
'🍓历史跑分数(危)🍓',
'🍓历史段位改王者(危)🍓',
'🍓自定义等级🍓',
'返回主页'},nil,'①历史改王者可能不稳定要在排位进去出来再重启游戏即可\n②历史跑分修改完重启游戏即可')
if lq==nil then else
if lq==1 then h1() end
if lq==2 then h2() end
if lq==3 then h3() end
if lq==4 then h4() end
if lq==5 then h5() end
if lq==6 then h6() end
if lq==7 then h7() end
if lq==8 then h8() end
if lq==9 then h9() end
if lq==10 then h10() end
if lq==11 then h11() end
end end

function h1()
search(2297,4,32)
py1(2287,4,0x10)
py1(2283,4,0x1c)
xg1(-1,4,-0x78)
xg1(-1,4,-0x7c)
xg1(-1,4,-0x80)
xg1(-1,4,-0x84)
xg1(43,4,-0x70)
gg.alert('修改成功')--开启用语
end


function h2()
search(2851,4,32)
py1(18,4,0x20)
py1(3,4,-0x18)
xg1(2,4,0x3c)
search(2542,4,32)
py1(2543,4,0x4)
py1(18,4,0x24)
xg1(2,4,0x40)
search(3222,4,32)
py1(30,4,-0x34)
py1(4,4,-0x44)
xg1(2,4,-0x18)
search(3168,4,32)
py1(60,4,-0x34)
py1(4,4,-0x44)
xg1(2,4,-0x18)
gg.alert('已开启')
end





function h3()
search(2266,4,32)
py1(1,4,0x14)
py1(1,4,0x1C)
xg1(65537,4,0x188)
gg.alert("修改成功")
end


function h4()
search(2296,4,32)
py1(1,4,0x58)
py1(1,4,0x60)
xg1(0,4,0x4C)
xg1(0,4,0x40)
search(2296,4,32)
py1(1,4,0x58)
py1(1,4,0x60)
xg1(gg.prompt({'请输入内容'}, {[1] = '6'}, {[1] = 'number'})[1],4,0x3C)
gg.alert('修改成功')
end


function h5()
search(2266,4,32)
py1(1,4,-0x144)
py1(1,4,-0x14C)
xg1(0,4,-0x144,true)
xg1(0,4,-0x150,true)
xg1(gg.prompt({'请输入内容'}, {[1] = '20000000'}, {[1] = 'number'})[1],4,-0x154,true)--这个是自定义函数
gg.alert("修改成功,请重新刷新界面")
end

function h6()
search(2266,4,32)
py1(1,4,-0x130)
py1(1,4,-0x138)
xg1(0,4,-0x130,true)
xg1(0,4,-0x13C,true)
xg1(gg.prompt({'请输入内容'}, {[1] = '10000'}, {[1] = 'number'})[1],4,-0x140,true)
gg.alert('修改成功，请重新刷新界面')
end




function h7()
search(2297,4,32)
py1(2287,4,0x10)
py1(2283,4,0x1c)
xg1(gg.prompt({'头像框1～55'}, {[1] = ''}, {[1] = 'number'})[1],4,-0x70)
gg.alert('修改成功')
end


function h8()
search(2266,4,32)
py1(1,4,-0x11C)
py1(1,4,-0x124)
xg1(0,4,-0x108)
xg1(0,4,-0x114)
xg1(gg.prompt({'输入内容'}, {[1] = ''}, {[1] = 'number'})[1],4,-0x118)
gg.alert("修改成功")
end


function h9()
search(1500,4,32)
py1(1,4,-0x10)
py1(1,4,-0x18)
xg1(6,4,-0x14,true)
gg.alert('修改成功')
end



function h10()
search(2266,4,32)
py1(1,4,-0x124)
py1(1,4,-0x11C)
xg1(gg.prompt({'请输入内容'}, {[1] = ''}, {[1] = 'number'})[1],4,-0x5C)
gg.alert('修改成功')
end


function h11()
Main()
end


function Main35()
ZY='Main35'
SB = gg.choice({
   "必须开我(不开必拉闸)",
   "自定义宝物",
   "自定义人物",
   "自定义滑板",
   "自定义头像",
   "返回上页",
},nil,os.date "必须先开启第一个否则拉闸\n%Y年%m月%d日%H时%M分\n点竞技场宝石商城购买\n进入输代码界面不要犹豫否则闪退")
if SB == 1 then bw1() end
if SB == 2 then bw2() end
if SB == 3 then bw3() end
if SB == 4 then bw4() end
if SB == 5 then bw6() end
if SB == 6 then bw5() end
end

function bw6()
search(2308,4,32)
py1(2310,4,0x10)
py1(2283,4,0x1c)
xg1(gg.prompt({'头像框1～55'}, {[1] = ''}, {[1] = 'number'})[1],4,-0x70)
gg.alert('修改成功')
end

function bw1()
search(120,4,32)
py1(1,4,0x24)
py1(1,4,0x2C)
xg1(0,4,0x2C,true)
xg1(0,4,0x20,true)
xg1(-100,4,0x1C,true)
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
xg1(0,4,-0x10,true)
xg1(0,4,-0x1C,true)
xg1(0,4,0xC,true)
xg1(0,4,0x18,true)
xg1(0,4,0x24,true)
xg1(0,4,0x30,true)
xg1(0,4,0x3C,true)
xg1(0,4,0x48,true)
xg1(0,4,0x50,true)
xg1(0,4,0x5C,true)
gg.toast('已解锁自定义(666)')
end

function bw2()
search(3000,4,32)
py1(1,4,0x90)
py1(1,4,0x88)
py1(7,4,0x8C)
xg1(21,4,-0x20)
xg1(gg.prompt({'宝物代码是1~34'}, {[1] = ''}, {[1] = 'number'})[1],4,0x4C,true)
gg.toast('修改完成️')
end

function bw3()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(10,4,-0x20)
xg1(gg.prompt({'人物代码1~169️'}, {[1] = ''}, {[1] = 'number'})[1],4,0x8)
gg.alert('修改完成')
end

function bw4()
search(3000,4,32)
py1(1,4,0x1C8)
py1(1,4,0x1D0)
py1(7,4,0x8C)
xg1(12,4,-0x20)
xg1(gg.prompt({'隐藏4个滑板代码^o^\n👉45👈\n👉60👈\n👉62👈\n👉94👈把这几个刷完也是刷不满的，要注意看是缺哪一个'}, {[1] = '45'}, {[1] = 'number'})[1],4,0x20,true)
gg.alert('修改完成')
end

function bw5()
Main()
end

function Main36()
Main()
end

function Main222()
a=gg.prompt(

{
"🍓段位等级[不改请留空,1~6]🍓",
"🍓段位星数[不改请留空,0~999]🍓",
"🍓段位分段[不改请留空,0~5]🍓",
"🍓必须开我🍓"




},


{"",
"",
""




},

{

"number",
"number",
"number",
"checkbox"



}






)

if a==nil then return end
if a[1]~="" then ab() end
if a[2]~="" then ac() end
if a[3]~="" then ad() end
if a[4]== true then 
os.exit(print("QQ群536825899")) end




end






function ab()
time=os.clock()
local t = {"libil2cpp.so", "Cd"}
local tt = {0x185290, 0x5C, 0x140, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x14, flags = 4, value = a[1],freeze= true}})

local t = {"libil2cpp.so", "Cd"}
local tt = {0x185560, 0x5C, 0x138, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x14, flags = 4, value = a[1],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x2FB4, 0x5C, 0x0, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x14, flags = 4, value = a[1],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3294, 0x5C, 0x128, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x14, flags = 4, value = a[1],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3804, 0x5C, 0x140, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x14, flags = 4, value = a[1],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3F5C, 0x5C, 0x120, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x14, flags = 4, value = a[1],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x58C8, 0x5C, 0x138, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x14, flags = 4, value = a[1],freeze= true}})
local time=string.sub(os.clock()-time,0,5)
gg.toast("段位等级修改成功,耗时"..time.."秒")
end





function ac()
time=os.clock()
local t = {"libil2cpp.so", "Cd"}
local tt = {0x185290, 0x5C, 0x140, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0xC, flags = 4, value = a[2],freeze= true}})

local t = {"libil2cpp.so", "Cd"}
local tt = {0x185560, 0x5C, 0x138, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0xC, flags = 4, value = a[2],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x2FB4, 0x5C, 0x0, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0xC, flags = 4, value = a[2],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3294, 0x5C, 0x128, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0xC, flags = 4, value = a[2],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3804, 0x5C, 0x140, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0xC, flags = 4, value = a[2],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3F5C, 0x5C, 0x120, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0xC, flags = 4, value = a[2],freeze= true}})

local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x58C8, 0x5C, 0x138, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0xC, flags = 4, value = a[2],freeze= true}})
local time=string.sub(os.clock()-time,0,5)
gg.toast("段位星数修改成功,耗时"..time.."秒")
end





function ad()
time=os.clock()
local t = {"libil2cpp.so", "Cd"}
local tt = {0x185290, 0x5C, 0x140, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x10, flags = 4, value = a[3],freeze= true}})
local t = {"libil2cpp.so", "Cd"}
local tt = {0x185560, 0x5C, 0x138, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x10, flags = 4, value = a[3],freeze= true}})
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x2FB4, 0x5C, 0x0, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x10, flags = 4, value = a[3],freeze= true}})
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3294, 0x5C, 0x128, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x10, flags = 4, value = a[3],freeze= true}})
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3804, 0x5C, 0x140, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x10, flags = 4, value = a[3],freeze= true}})
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x3F5C, 0x5C, 0x120, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x10, flags = 4, value = a[3],freeze= true}})
local t = {"libil2cpp.so:bss", "Cb"}
local tt = {0x58C8, 0x5C, 0x138, 0x8, 0x4C}
local ttt = S_Pointer(t, tt)
gg.addListItems({{address = ttt-0x10, flags = 4, value = a[3],freeze= true}})
local time=string.sub(os.clock()-time,0,5)
gg.toast("段位分段修改成功,耗时"..time.."秒")
end



while(true) do
if gg.isVisible(true) then
gg.setVisible(false)
_ENV[ZY]()
--Main()
end end

while(true) do
if gg.isVisible(true) then
gg.setVisible(false)
_ENV[ZY]()
end
end

