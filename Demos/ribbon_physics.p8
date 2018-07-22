function create_ribbon(n,x)
 local level={}
 
 for i=1,n do
  level[i]=x
 end
 
 return level
end

function dist(level,i1,i2)
 return level[i1]-level[i2]
end

function force(level,i1,i2)
 return dist(level,i1,i2)
end

function update_ribbon(level)
 for i=2,#level do
  --random dampening
  local f=force(level,i-1,i)*rnd()
  level[i]+=f
 end
end

function draw_ribbon(level,c)
 for i=1,#level do
  local x=level[i]
  local y=128-i
  local w=16
  line(x-w/2,y,x+w/2,y,c)
 end
end

function _init()
 r1=create_ribbon(128,32)
 r2=create_ribbon(128,96)
end

function _update()
 r1[1]=32+30*sin(t()/3)
 r2[1]=96+30*cos(t()/3)
 update_ribbon(r1)
 update_ribbon(r2)
end

function _draw()
 cls(8)
 draw_ribbon(r1,rnd(16))
 draw_ribbon(r2,rnd(16))
end
