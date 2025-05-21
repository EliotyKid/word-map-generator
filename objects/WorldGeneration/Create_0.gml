global.world = array_create(N_CHUNCKS_W)
for(var i=0; i<N_CHUNCKS_W; i++){
  global.world[i] = array_create(N_CHUNCKS_H)
  for(var j=0; j<N_CHUNCKS_H; j++){
    global.world[i][j] = new CreateChunck(i,j)
  }
}


baseGround = ceil(CHUNCK_DEPTH*.5)

for(var xx=0; xx<N_CHUNCKS_W; xx++){
  for(var yy=0; yy<N_CHUNCKS_H; yy++){
    global.world[xx][yy].Generate(xx,yy)
    global.world[xx][yy].Redraw()
  }
}