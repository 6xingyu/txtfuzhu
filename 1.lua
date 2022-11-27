function editData(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."开启失败")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."开启成功")else gg.toast(qmnbn.."开启失败")end end end

D=gg.TYPE_DWORD  E=gg.TYPE_DOUBLE  F=gg.TYPE_FLOAT W=gg.TYPE_WORD B=gg.TYPE_BYTE X=gg.TYPE_XOR Q=gg.TYPE_QWORD

function readValue(address, flags) return gg.getValues({{address = address, flags = flags}})[1]["value"]end
function search(ss,lx,nc,dz1,dz2) if ss~=nil then if lx~=nil then  if nc==nil then nc=32 end  gg.setRanges(nc)  if dz1==nil then dz1="-1" end  if dz2==nil then dz1="0" end  gg.searchNumber(ss,lx,false,gg.SIGN_EQUAL,dz1,dz2)  sl=gg.getResultCount()  if sl~=0 then  sj=gg.getResults(sl)  gg.toast("搜索到 "..sl.." 个结果")  gg.clearResults()  else  gg.toast("未搜索到结果")  end  else  gg.toast("无搜索值类型")  end  else  gg.toast("无需搜索值")  end  end  function py1(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value==value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function py2(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value~=value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end
function xg1(value,lx,py,dj) if #sj~=nil then z={} for i=1,#sj do z[i]={} z[i].address=sj[i].address+py z[i].flags=lx if value == nil then value = readValue(z[i].address, lx) end z[i].value= value z[i].freeze = dj and true or false end if dj == true or dj == false then gg.addListItems(z) else gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end
function xg2(bz,value,lx,py,dj)  if #bz~=nil then  z={}  for i=1,#bz do  z[i]={}  z[i].address=bz[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("共修改 "..#z.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function bc(bz)  if sj~=nil then  _ENV[bz]=sj  else  gg.toast("无数据")  end  end  


function split(szFullString, szSeparator)   local nFindStartIndex = 1   local nSplitIndex = 1   local nSplitArray = {}   while true do   local nFindLastIndex = string.find  (szFullString, szSeparator, nFindStartIndex)   if not nFindLastIndex then   nSplitArray[nSplitIndex] =   string.sub(szFullString, nFindStartIndex, string.len  (szFullString))   break end   nSplitArray[nSplitIndex] = string.sub  (szFullString, nFindStartIndex, nFindLastIndex - 1)   nFindStartIndex = nFindLastIndex + string.len  (szSeparator)   nSplitIndex = nSplitIndex + 1 end return   nSplitArray end   function xgxc(szpy, qmxg)   for x = 1, #(qmxg) do   xgpy = szpy + qmxg[x]["offset"]   xglx = qmxg[x]["type"]   xgsz = qmxg[x]["value"]   xgdj = qmxg[x]["freeze"]   if xgdj == nil or xgdj == "" then   gg.setValues({[1]   = {address = xgpy, flags = xglx, value = xgsz}})   else   gg.addListItems({[1]   = {address = xgpy, flags = xglx,   freeze = xgdj, value = xgsz}}) end   xgsl = xgsl + 1 xgjg = true end end   function xqmnb(qmnb)   gg.clearResults()   gg.setRanges(qmnb[1]["memory"])   gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])  gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else           sl = gg.getResults(999999)   sz = gg.getResultCount()           xgsl = 0 if sz > 999999 then   sz = 999999 end for i = 1, sz do   pdsz = true for v = 4, #(qmnb) do if   pdsz == true then   pysz = {} pysz[1]   = {} pysz[1].address   = sl[i].address + qmnb[v]["offset"] pysz[1].flags   = qmnb[v]["type"]   szpy = gg.getValues(pysz)   pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd   = split(pdpd, ";") tzszpd   = szpd[1] pyszpd = szpd[2]   if tzszpd == pyszpd then   pdjg = true pdsz = true else   pdjg = false pdsz = false end end end if   pdjg == true then szpy   = sl[i].address xgxc(szpy, qmxg) end end   if xgjg == true then   gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据")   else   gg.toast(qmnb[2]["name"] .. "开启失败")   end   end   end   end 

DWORD=gg.TYPE_DWORD  DOUBLE=gg.TYPE_DOUBLE  FLOAT=gg.TYPE_FLOAT WORD=gg.TYPE_WORD BYTE=gg.TYPE_BYTE XOR=gg.TYPE_XOR QWORD=gg.TYPE_QWORD


function Main0()
 SN = gg.choice({
"科技区",
"分数道具区",
"货币区",
"宝物区",
"秘典宝箱区",
"变大小区",
"退出",
	}, nil, os.date("喜羊羊群聊711643748提示你:当前时间:%Y年/️%m月/%d日%H:%M:%S"))
if SN==1 then Main1()end
if SN==2 then Main2()end
if SN==3 then Main3()end
if SN==4 then Main4()end
if SN==5 then Main5()end
if SN==6 then Main6()end
if SN==7 then Exit()end 
FX1=0
FX2=0
end

function Main1()
 SN = gg.multiChoice({
"必开防闪",
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
gg.clearResults()
gg.setRanges(gg.REGION_C_BSS)
gg.searchNumber("842084353", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("842084353", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(100)
gg.editAll("-1",gg.TYPE_DWORD)
gg.toast("成功")
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

function Main2()
 SN = gg.multiChoice({
"道具赛后期加速可配合飞天",
"恢复",
"下滑加速",
"恢复",
"分数赛开局撞墙即可",
"恢复",
"爆分配合飞天分数无法上传服务器",
"恢复",
"进道具赛开启无限滑板",
"进道具赛开启加速包",
"带三个机械手表 修改前卸下无尽宝物 修改后再带上 选择三次 然后重启游戏",
}, nil, "")
if SN == nil then else
if SN[1] == true then a1() end
if SN[2] == true then a2() end
if SN[3] == true then a3() end
if SN[4] == true then a4() end
if SN[5] == true then a5() end
if SN[6] == true then a6() end
if SN[7] == true then a7() end
if SN[8] == true then a8() end
if SN[9] == true then a9() end
if SN[10] == true then a10() end
if SN[11] == true then a11() end
if SN[12] == true then a12() end
if SN[13] == true then a13() end
if SN[14] == true then a14() end
if SN[15] == true then a15() end
if SN[16] == true then a16() end
if SN[17] == true then Exit() end
end end

function a1()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-1;0;0;1;0;0;0;0;1;0;0;-1;::45", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("1.000133",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a2()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-1;0;0;1.000133;0;0;0;0;1.0002;0;0;-1;::45", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1.000133", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;1;1;1;-1;0;-1::37", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("0", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("88",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a4()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;1;1;1;-1;88;-1::37", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("88", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("0",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a5()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-1;0;0;1;0;0;0;0;1;0;0;-1;::45", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("9.89110088348",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a6()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.89110088348", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("9.89110088348", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a7()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-1;0;0;1;0;0;0;0;1;0;0;-1;::45", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("1.03",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a8()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-1;0;0;1.03;0;0;0;0;1.03;0;0;-1;::45", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1.03", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(300)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function a9()
qmnb = {
{["memory"] = 32},
{["name"] = "无限滑板"},
{["value"] = 256, ["type"] = 4},
{["lv"] = -1, ["offset"] = -4, ["type"] = 4},
}
qmxg = {
--{["value"] = 1, ["offset"] = 260, ["type"] = 16},
{["value"] = 1, ["offset"] = -92, ["type"] = 4},
--{["value"] = 1, ["offset"] = 276, ["type"] = 16},
}
xqmnb(qmnb)
end

function a10()
qmnb = {
{["memory"] = 32},
{["name"] = "道具赛加速"},
{["value"] = 1300.0, ["type"] = 16},
{["lv"] = 1000.0, ["offset"] = 24, ["type"] = 16},
{["lv"] = 300.0, ["offset"] = 72, ["type"] = 16},
}
qmxg = {

{["value"] = 1.88247633e-40, ["offset"] = -16, ["type"] = 16},
{["value"] = 1466.39868164062, ["offset"] = -12, ["type"] = 16},---1300人物速度上限
{["value"] = 1450, ["offset"] = 0, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 8, ["type"] = 16},
{["value"] = 10131.189453125, ["offset"] = 12, ["type"] = 16},---1000
{["value"] = 10000, ["offset"] = 24, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 56, ["type"] = 16},
{["value"] = 10131.189453125, ["offset"] = 60, ["type"] = 16},---300十倍能量
{["value"] = 10000, ["offset"] = 72, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 80, ["type"] = 16},
{["value"] = 10131.189453125, ["offset"] = 84, ["type"] = 16},---6000滑板时长
{["value"] = 10000, ["offset"] = 96, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 104, ["type"] = 16},
{["value"] = 2532.79736328125, ["offset"] = 108, ["type"] = 16},---1950滑板速度上限
{["value"] = 2500, ["offset"] = 120, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 128, ["type"] = 16},
{["value"] = 7937.5947265625, ["offset"] = 132, ["type"] = 16},---800开局冲刺
{["value"] = 8000, ["offset"] = 144, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 152, ["type"] = 16},
{["value"] = 10131.189453125, ["offset"] = 156, ["type"] = 16},---500
{["value"] = 10000, ["offset"] = 168, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 224, ["type"] = 16},
{["value"] = 10131.189453125, ["offset"] = 228, ["type"] = 16},---10加速带速度上限
{["value"] = 10000, ["offset"] = 240, ["type"] = 16},

{["value"] = 1.88247633e-40, ["offset"] = 344, ["type"] = 16},
{["value"] = -808.19934082031, ["offset"] = 348, ["type"] = 16},---撞墙加速
{["value"] = -800, ["offset"] = 360, ["type"] = 16},
}
xqmnb(qmnb)
end

function a11()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 7, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =8, ["type"] = D,["freeze"] = false},
{["value"] = 111116,["offset"] =12, ["type"] = D,["freeze"] = false},
{["value"] = 11,["offset"] =20, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function Main3()
 SN = gg.multiChoice({
"开金币箱子获得十八亿钥匙",
"恢复",
"开金币箱子获得十八亿金币",
"恢复",
"开金币箱子获得十八亿滑板",
"恢复",
"开金币箱子获得十万金币",
"恢复",
"开金币箱子获得6666钥匙",
"恢复",
"一万钥匙",
"十八亿宝箱钥匙",
"一百八十万金币",
}, nil, "修改金币箱子时修改一项恢复一项")
if SN == nil then else
if SN[1] == true then b1() end
if SN[2] == true then b2() end
if SN[3] == true then b3() end
if SN[4] == true then b4() end
if SN[5] == true then b5() end
if SN[6] == true then b6() end
if SN[7] == true then b7() end
if SN[8] == true then b8() end
if SN[9] == true then b9() end
if SN[10] == true then b10() end
if SN[11] == true then b11() end
if SN[12] == true then b12() end
if SN[13] == true then b13() end
if SN[14] == true then b14() end
if SN[15] == true then b15() end
if SN[16] == true then b16() end
if SN[17] == true then Exit() end
end XGCK = -1 end

function b1()
qmnb = {
{["memory"] = 32},
{["name"] = "开金币箱子获得十八亿钥匙"},
{["value"] = 0.10000000149011612, ["type"] = 16},
{["lv"] = 1.401298464324817E-45, ["offset"] = 4, ["type"] = 16},
{["lv"] = 1.401298464324817E-45, ["offset"] = 8, ["type"] = 16},
}
qmxg = {
{["value"] = 3.71770984e29, ["offset"] = 0, ["type"] = 16},
{["value"] = 3.71770984e29, ["offset"] = 4, ["type"] = 16},
{["value"] = 3.71770984e29, ["offset"] = 8, ["type"] = 16},
}
xqmnb(qmnb)
end

function b2()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复"},
{["value"] = 1888888888, ["type"] = 4},
{["lv"] = 1888888888, ["offset"] = 4, ["type"] = 4},
{["lv"] = 1888888888, ["offset"] = 8, ["type"] = 4},
}
qmxg = {
{["value"] = 0.1, ["offset"] = 0, ["type"] = 16},
{["value"] = 1.401298464324817E-45, ["offset"] = 4, ["type"] = 16},
{["value"] = 1.401298464324817E-45, ["offset"] = 8, ["type"] = 16},
}
xqmnb(qmnb)
end

function b3()
qmnb = {
{["memory"] = 32},
{["name"] = "开金币箱子获得十八亿金币"},
{["value"] = 1008981770, ["type"] = 4},
{["lv"] = 100000, ["offset"] = 4, ["type"] = 4},
{["lv"] = 100000, ["offset"] = 8, ["type"] = 4},
}
qmxg = {
{["value"] = 1888888888, ["offset"] = 0, ["type"] = 4},
{["value"] = 1888888888, ["offset"] = 4, ["type"] = 4},
{["value"] = 1888888888, ["offset"] = 8, ["type"] = 4},
}
xqmnb(qmnb)
end

function b4()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复"},
{["value"] = 1888888888, ["type"] = 4},
{["lv"] = 1888888888, ["offset"] = 4, ["type"] = 4},
{["lv"] = 1888888888, ["offset"] = 8, ["type"] = 4},
}
qmxg = {
{["value"] = 1008981770, ["offset"] = 0, ["type"] = 4},
{["value"] = 100000, ["offset"] = 4, ["type"] = 4},
{["value"] = 100000, ["offset"] = 8, ["type"] = 4},
}
xqmnb(qmnb)
end

function b5()
qmnb = {
{["memory"] = 32},
{["name"] = "开金币箱子获得十八亿滑板"},
{["value"] = 1056964608, ["type"] = 4},
{["lv"] = 10, ["offset"] = 4, ["type"] = 4},
{["lv"] = 10, ["offset"] = 8, ["type"] = 4},
}
qmxg = {
{["value"] = 1888888888, ["offset"] = 0, ["type"] = 4},
{["value"] = 1888888888, ["offset"] = 4, ["type"] = 4},
{["value"] = 1888888888, ["offset"] = 8, ["type"] = 4},
}
xqmnb(qmnb)
end

function b6()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复"},
{["value"] = 1888888888, ["type"] = 4},
{["lv"] = 1888888888, ["offset"] = 4, ["type"] = 4},
{["lv"] = 1888888888, ["offset"] = 8, ["type"] = 4},
}
qmxg = {
{["value"] = 1056964608, ["offset"] = 0, ["type"] = 4},
{["value"] = 10, ["offset"] = 4, ["type"] = 4},
{["value"] = 10, ["offset"] = 8, ["type"] = 4},
}
xqmnb(qmnb)
end

function b7()
qmnb = {
{["memory"] = 32},
{["name"] = "开金币箱子获得十万金币"},
{["value"] = 1008981770, ["type"] = 4},
{["lv"] = 100000, ["offset"] = 4, ["type"] = 4},
{["lv"] = 100000, ["offset"] = 8, ["type"] = 4},
}
qmxg = {
{["value"] = 1988888888, ["offset"] = 0, ["type"] = 4},
}
xqmnb(qmnb)
end

function b8()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复"},
{["value"] = 1988888888, ["type"] = 4},
{["lv"] = 1988888888, ["offset"] = 0, ["type"] = 4},
}
qmxg = {
{["value"] = 1008981770, ["offset"] = 0, ["type"] = 4},
}
xqmnb(qmnb)
end

function b9()
qmnb = {
{["memory"] = 32},
{["name"] = "开金币箱子获得6666钥匙"},
{["value"] = 0.10000000149011612, ["type"] = 16},
{["lv"] = 1.401298464324817E-45, ["offset"] = 4, ["type"] = 16},
{["lv"] = 1.401298464324817E-45, ["offset"] = 8, ["type"] = 16},
}
qmxg = {
{["value"] = 1888888888, ["offset"] = 0, ["type"] = 4},
{["value"] = 6666, ["offset"] = 4, ["type"] = 4},
{["value"] = 6666, ["offset"] = 8, ["type"] = 4},
}
xqmnb(qmnb)
end

function b10()
qmnb = {
{["memory"] = 32},
{["name"] = "恢复"},
{["value"] = 1888888888, ["type"] = 4},
{["lv"] = 6666, ["offset"] = 4, ["type"] = 4},
{["lv"] = 6666, ["offset"] = 8, ["type"] = 4},
}
qmxg = {
{["value"] = 0.1, ["offset"] = 0, ["type"] = 16},
{["value"] = 1.401298464324817E-45, ["offset"] = 4, ["type"] = 16},
{["value"] = 1.401298464324817E-45, ["offset"] = 8, ["type"] = 16},
}
xqmnb(qmnb)
end

function b11()
qmnb = {
{["memory"] = 32},
{["name"] = "一万钥匙"},
{["value"] = 65536, ["type"] = 4},
{["lv"] = 1, ["offset"] = 12, ["type"] = 4},
{["lv"] = 1, ["offset"] = 20, ["type"] = 4},
}
qmxg = {
{["value"] = 152315, ["offset"] = 24, ["type"] = 4},
{["value"] = 162503, ["offset"] = 28, ["type"] = 4},
{["value"] = 10300, ["offset"] = 36, ["type"] = 4},
}
xqmnb(qmnb)
end

function b12()
qmnb = {
{["memory"] = 32},
{["name"] = "十八亿宝箱钥匙"},
{["value"] = 2201, ["type"] = 4},
{["lv"] = 1, ["offset"] = -4, ["type"] = 4},
{["lv"] = 1, ["offset"] = 12, ["type"] = 4},
}
qmxg = {
{["value"] = 1, ["offset"] = -112, ["type"] = 4},
{["value"] = 1888888889, ["offset"] = -108, ["type"] = 4},
{["value"] = 1888888888, ["offset"] = -100, ["type"] = 4},
}
xqmnb(qmnb)
end

function b13()
qmnb = {
{["memory"] = 32},
{["name"] = "一百八十万金币"},
{["value"] = 65536, ["type"] = 4},
{["lv"] = 1, ["offset"] = 12, ["type"] = 4},
{["lv"] = 1, ["offset"] = 20, ["type"] = 4},
}
qmxg = {
{["value"] = 590498, ["offset"] = 4, ["type"] = 4},
{["value"] = 1429722, ["offset"] = 8, ["type"] = 4},
{["value"] = 1888888, ["offset"] = 16, ["type"] = 4},
}
xqmnb(qmnb)
end

function Main4()
 SN=gg.choice({
"1小丑面具",
"2骷髅耳环",
"3紫色花球",
"4金属发条",
"5火焰纹章",
"6星星项链",
"7机械手表",
"8金色耳环",
"9黄金皇冠",
"10摩托头盔",
"11狼牙项链",
"12纯金手表",
"13金箍",
"14乾坤圈",
"15水手锚",
"16积木",
"17灵符",
"18黄金盔甲",
"19令牌",
"20龙蛋",
"21南瓜",
"22月兔",
"23舞狮头",
"24甜心手链",
"25圣诞帽",
"26夹克",
"27红色战衣",
"28火红灯笼",
"29美人折扇",
"30卫衣",
"31校服",
"32相机",
"33耳机",
"34眼镜",
}, nil, "修改前需要先点亮宝物\n新号的话用功能1的微加速 配合连点器抽几分钟 宝箱钥匙修改在功能3\n前几个修改有点慢修改后升一级可保留数量")
if SN==1 then HS1() end
if SN==2 then HS2() end
if SN==3 then HS3() end
if SN==4 then HS4() end
if SN==5 then HS5() end
if SN==6 then HS6() end
if SN==7 then HS7() end 
if SN==8 then HS8() end
if SN==9 then HS9() end
if SN==10 then HS10() end
if SN==11 then HS11() end
if SN==12 then HS12() end
if SN==13 then HS13() end
if SN==14 then HS14() end
if SN==15 then HS15() end
if SN==16 then HS16() end
if SN==17 then HS17() end
if SN==18 then HS18() end
if SN==19 then HS19() end
if SN==20 then HS20() end
if SN==21 then HS21() end
if SN==22 then HS22() end
if SN==23 then HS23() end
if SN==24 then HS24() end
if SN==25 then HS25() end
if SN==26 then HS26() end
if SN==27 then HS27() end
if SN==28 then HS28() end
if SN==29 then HS29() end
if SN==30 then HS30() end
if SN==31 then HS31() end
if SN==32 then HS32() end
if SN==33 then HS33() end
if SN==34 then HS34() end
if SN==35 then os.exit() end
FX1=0
end

function HS1()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 1, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS2()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 2, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS3()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 3, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS4()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 4, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS5()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 5, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS6()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 6, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS7()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 7, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS8()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 8, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS9()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 9, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS10()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 10, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS11()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 11, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS12()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 12, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS13()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 13, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS14()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 14, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS15()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 15, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS16()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 16, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS17()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 17, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS18()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 18, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS19()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 19, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS20()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 20, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS21()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 21, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS22()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 22, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end



function HS23()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 23, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS24()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 24, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{

{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS25()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 25, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS26()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 26, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS27()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 27, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS28()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 28, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS29()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 29, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS30()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 30, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS31()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 31, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS32()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 32, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS33()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 33, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function HS34()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "666666"},
{["value"] = 34, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =16, ["type"] = D},
{["lv"] = 1,["offset"] =24, ["type"] = D},
{["lv"] = 1,["offset"] =36, ["type"] = D},
{["lv"] = 1,["offset"] =44, ["type"] = D},
},
{
{["value"] = 111111,["offset"] =28, ["type"] = D,["freeze"] = false},
{["value"] = 108557,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 6666,["offset"] =40, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function Exit()
   print("喜羊羊QQ:1472069299")
  os.exit()
end

function Main5()
 SN = gg.multiChoice({
"秘典宝箱更新重启游戏生效",
"秘典宝箱开人物鼠小意",
"秘典宝箱开滑板电音风暴",
"秘典宝箱开背饰甜心花圈",
"秘典宝箱开边框钻石璀璨",
"每日在线奖励改人物",
}, nil, "")
if SN == nil then else
if SN[1] == true then c1() end
if SN[2] == true then c2() end
if SN[3] == true then c3() end
if SN[4] == true then c4() end
if SN[5] == true then c5() end
if SN[6] == true then c6() end
if SN[7] == true then Exit() end
end end
function c1()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "秘典宝箱更新"},
{["value"] = 2202, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 0,["offset"] =-20, ["type"] = D},
},
{
{["value"] = 6666,["offset"] =0, ["type"] = D,["freeze"] = false},
{["value"] = 6667,["offset"] =-8, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =-12, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function c2()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "鼠小意"},
{["value"] = 800, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1800,["offset"] =-160, ["type"] = D},
},
{
{["value"] = 1,["offset"] =8, ["type"] = D,["freeze"] = false},
{["value"] = 115,["offset"] =12, ["type"] = D,["freeze"] = false},
{["value"] = 114,["offset"] =20, ["type"] = D,["freeze"] = false},
{["value"] = 10,["offset"] =-20, ["type"] = D,["freeze"] = false},
{["value"] = 11,["offset"] =-28, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =-32, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function c3()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "电音风暴"},
{["value"] = 800, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1800,["offset"] =-160, ["type"] = D},
},
{
{["value"] = 1,["offset"] =32, ["type"] = D,["freeze"] = false},
{["value"] = 122,["offset"] =36, ["type"] = D,["freeze"] = false},
{["value"] = 123,["offset"] =44, ["type"] = D,["freeze"] = false},
{["value"] = 12,["offset"] =-20, ["type"] = D,["freeze"] = false},
{["value"] = 13,["offset"] =-28, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =-32, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function c4()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "甜心花圈"},
{["value"] = 800, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1800,["offset"] =-160, ["type"] = D},
},
{
{["value"] = 1,["offset"] =56, ["type"] = D,["freeze"] = false},
{["value"] = 9,["offset"] =60, ["type"] = D,["freeze"] = false},
{["value"] = 8,["offset"] =68, ["type"] = D,["freeze"] = false},
{["value"] = 14,["offset"] =-20, ["type"] = D,["freeze"] = false},
{["value"] = 15,["offset"] =-28, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =-32, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end

function c5()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "钻石璀璨"},
{["value"] = 800, ["type"] = D},
{["lv"] = 1,["offset"] =4, ["type"] = D},
{["lv"] = 1,["offset"] =-4, ["type"] = D},
{["lv"] = 1800,["offset"] =-160, ["type"] = D},
},
{
{["value"] = 1,["offset"] =-12, ["type"] = D,["freeze"] = false},
{["value"] = 11,["offset"] =-8, ["type"] = D,["freeze"] = false},
{["value"] = 10,["offset"] =0, ["type"] = D,["freeze"] = false},
{["value"] = 9,["offset"] =-20, ["type"] = D,["freeze"] = false},
{["value"] = 8,["offset"] =-28, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =-32, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end



function c6()
editData(
{
{["memory"] = gg.REGION_ANONYMOUS},
{["name"] = "在线奖励"},
{["value"] = 300, ["type"] = D},
{["lv"] = 2,["offset"] =-160, ["type"] = D},
---{["lv"] = 6,["offset"] =140, ["type"] = D},
},
{
{["value"] = 1,["offset"] =168, ["type"] = D,["freeze"] = false},
 {["value"] = 121,["offset"] =172, ["type"] = D,["freeze"] = false},
 {["value"] = 120,["offset"] =180, ["type"] = D,["freeze"] = false},
{["value"] = 10,["offset"] =140, ["type"] = D,["freeze"] = false},
{["value"] = 11,["offset"] =132, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =128, ["type"] = D,["freeze"] = false},

{["value"] = 1,["offset"] =-32, ["type"] = D,["freeze"] = false},
{["value"] = 11,["offset"] =-28, ["type"] = D,["freeze"] = false},
{["value"] = 10,["offset"] =-20, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =8, ["type"] = D,["freeze"] = false},
 {["value"] = 145,["offset"] =12, ["type"] = D,["freeze"] = false},
 {["value"] = 144,["offset"] =20, ["type"] = D,["freeze"] = false},

{["value"] = 1,["offset"] =-152, ["type"] = D,["freeze"] = false},
 {["value"] = 142,["offset"] =-148, ["type"] = D,["freeze"] = false},
 {["value"] = 143,["offset"] =-140, ["type"] = D,["freeze"] = false},
{["value"] = 11,["offset"] =-180, ["type"] = D,["freeze"] = false},
{["value"] = 10,["offset"] =-188, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =-192, ["type"] = D,["freeze"] = false},

{["value"] = 1,["offset"] =-312, ["type"] = D,["freeze"] = false},
 {["value"] = 84,["offset"] =-308, ["type"] = D,["freeze"] = false},
 {["value"] = 85,["offset"] =-300, ["type"] = D,["freeze"] = false},
{["value"] = 11,["offset"] =-340, ["type"] = D,["freeze"] = false},
{["value"] = 10,["offset"] =-348, ["type"] = D,["freeze"] = false},
{["value"] = 1,["offset"] =-352, ["type"] = D,["freeze"] = false},
}
)
gg.clearResults()
end



function Main6()
 SN = gg.multiChoice({
"迷蝶之翼变大",
"恢复",
"时光之翼变大",
"恢复",
"背景音乐加速",
"恢复",
"人物变大",
"恢复",
"人物变大瘦",
"恢复",
"人物变小",
"恢复",
"人物变小",
"恢复",
"时光 甜心尾焰",
"恢复",
}, nil, "")
if SN == nil then else
if SN[1] == true then d1() end
if SN[2] == true then d2() end
if SN[3] == true then d3() end
if SN[4] == true then d4() end
if SN[5] == true then d5() end
if SN[6] == true then d6() end
if SN[7] == true then d7() end
if SN[8] == true then d8() end
if SN[9] == true then d9() end
if SN[10] == true then d10() end
if SN[11] == true then d11() end
if SN[12] == true then d12() end
if SN[13] == true then d13() end
if SN[14] == true then d14() end
if SN[15] == true then d15() end
if SN[16] == true then d16() end
if SN[14] == true then Exit() end
end end
function d1()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;43009;1F:16000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("7",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d2()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;43009;7F:16000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("7", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(6000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d3()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;2521;1F:2000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1.8",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d4()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;2521;1.8F:2000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1.8", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d5()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;505;1F;-10000:1000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("2",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d6()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;505;2F;-10000:1000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("2", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end


function d7()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;10801;1F::200", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("3",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d8()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;10801;3F::200", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("3", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d9()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;3329;1F:3000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("6",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d10()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;3329;6F:3000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("6", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d11()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;3329;1F:3000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("0",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d12()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;3329;0F:3000", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("0", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d13()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;10801;1F::200", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("0.5",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d14()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("12;10801;0.5F::200", gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("0.5", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d15()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("1;25;5;0.5:90", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("6",gg.TYPE_FLOAT)
gg.toast("成功")
end

function d16()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("6;25;5;0.5:90", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("6", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5000)
gg.editAll("1",gg.TYPE_FLOAT)
gg.toast("成功")
end

while true do
if gg.isVisible(true) then
    FX1 = nil
    gg.setVisible(false)
  end
  if FX1 == nil then
    Main0()
  end
end

