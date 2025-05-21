function GetValueNoise(_noise, _x, _y) {
  if (!surface_exists(_noise)) return 0;

  var col = surface_getpixel(_noise, _x, _y); // retorna cor como inteiro
  var gray = color_get_red(col); // ruído está em tons de cinza, qualquer canal serve

  var norm = gray / 255;         // converte para [0,1]
  var noiseVal = norm * 2 - 1;   // remapeia para [-1,1]

  return noiseVal;
}
