randomize()
random_set_seed(irandom(999999))

global.worldNoise = CreateNoise(N_TOTAL_BLOCKS_W,N_TOTAL_BLOCKS_H)

global.world = array_create(N_CHUNCKS_W)
for(var i=0; i<N_CHUNCKS_W; i++){
  global.world[i] = array_create(N_CHUNCKS_H)
  for(var j=0; j<N_CHUNCKS_H; j++){
    global.world[i][j] = new CreateChunck(i,j)
  }
}



for(var xx=0; xx<N_CHUNCKS_W; xx++){
  for(var yy=0; yy<N_CHUNCKS_H; yy++){
    global.world[xx][yy].Generate(xx,yy)
    global.world[xx][yy].Redraw()
  }
}