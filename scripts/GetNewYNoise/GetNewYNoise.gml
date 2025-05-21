function GetNewYNoise(_noise,_x,_y,_yRange){
  var noiseVal = GetValueNoise(_noise,_x,_y)
  var _yy = ceil(_yRange * noiseVal)
  return _yy
}