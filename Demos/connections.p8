pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
n=25
w=20

function _init()
 p={}
 for i=1,n do
  add(p,{rnd(128),rnd(128)})
 end
end

function rnd_step()
 return 2*flr(rnd(2))-1
end

function _update()
 for i=1,n do
  j=1+flr(rnd(2))
  p[i][j]=(p[i][j]+rnd_step())%128
 end
end

function _draw()
cls(14)
for i=1,n do
 pset(p[i][1],p[i][2],5)
end
for i=1,n do
 x=p[i][1]
 y=p[i][2]
 for a=max(0,x-w),min(127,x+w) do
  for b=max(0,y-w),min(127,y+w) do
   if pget(a,b)==5 then
    line(x,y,a,b,2)
    pset(x,y,8)
    pset(a,b,8)
   end
  end
 end
end
end
