-- centroids
k=15
cent={}
for j=1,k do
 cent[j]={rnd(128),rnd(128)}
end

-- data points
n=2000
x={}
y={}
for i=1,n do
 x[i]={rnd(128),rnd(128)}
 y[i]=1+flr(rnd(15))
end

function dist(x1,x2)
 return (x1[1]-x2[1])^2+(x1[2]-x2[2])^2
end

function knn(x,y,n,cent,k)
 local count={}
 for j=1,k do
  count[j]=0
 end
 
 for i=1,n do
  local d0=32767
  local j0=0
  for j=1,k do
   local d=dist(x[i],cent[j])
   if d<d0 then
    d0=d
    j0=j
   end
  end
  y[i]=j0
  count[j0]+=1
 end

 for j=1,k do
  cent[j]={0,0}
 end
 
 for i=1,n do
  cent[y[i]][1]+=x[i][1]/count[y[i]]
  cent[y[i]][2]+=x[i][2]/count[y[i]]
 end
end

function _update()
 knn(x,y,n,cent,k)
end

function _draw()
 cls(0)
 
 for j=1,k do
  circfill(cent[j][1],cent[j][2],1,j)
 end
 
 for i=1,n do
  pset(x[i][1],x[i][2],y[i])
 end
end
