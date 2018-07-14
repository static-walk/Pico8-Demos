--------------------------------
---  define kohonen network  ---
--------------------------------

function create_kn(n_nodes)
 local kn={}
 kn.n_nodes=n_nodes
 
 -- weight[i]: weight for ith node
 kn.weight={}
 
 -- initialize weights
 for i=1,kn.n_nodes do
  kn.weight[i]={}
  kn.weight[i][1]=rnd(128)
  kn.weight[i][2]=rnd(128)
 end
 return kn
end

-- update kn.weight[node] using (x,y)
function update_weight(kn,node,x,y,rate)
 kn.weight[node][1]+=rate*(x-kn.weight[node][1])
 kn.weight[node][2]+=rate*(y-kn.weight[node][2])
end

-- train network using (x,y)
function train_kn(kn,x,y,rate)
 -- find i0: index of winning node
 local i0=0
 -- 32767.99 is pico8's largest number
 -- d and d0 are square of the euclidean distance
 local d0=32767.99
 for i=1,kn.n_nodes do
  local w1=kn.weight[i][1]
  local w2=kn.weight[i][2]
  local d=(x-w1)^2+(y-w2)^2
  if d<d0 then
   d0=d
   i0=i
  end
 end
 
 -- update winning node and its neighbors
 update_weight(kn,i0,x,y,rate)
 if i0==1 then
  if kn.n_nodes>1 then
   update_weight(kn,i0+1,x,y,rate)
  end
 elseif i0==kn.n_nodes then
  update_weight(kn,i0-1,x,y,rate)
 else
  update_weight(kn,i0-1,x,y,rate)
  update_weight(kn,i0+1,x,y,rate)
 end
end

function draw_kn(kn)
 x0=kn.weight[1][1]
 y0=kn.weight[1][2]
 for i=2,kn.n_nodes do
  x=kn.weight[i][1]
  y=kn.weight[i][2]
  line(x0,y0,x,y,8)
  pset(x0,y0,9)
  pset(x,y,9)
  x0=x
  y0=y
 end
end

--------------------------------
--      represent space       --
-------------------------------- 

function sample_from_space()
 local a=rnd()
 local r=30+rnd(10)
 local pt={}
 pt[1]=64+r*cos(a)
 pt[2]=64+r*sin(a)
 return pt
end

function draw_space()
 cls(1)
 circfill(64,64,40,12)
 circfill(64,64,30,1)
end

--------------------------------
--         game loop          --
--------------------------------

function _init()
 network=create_kn(12)
end

function _update()
 pt=sample_from_space()
 train_kn(network,pt[1],pt[2],0.1)
end

function _draw()
 draw_space()
 draw_kn(network)
end
