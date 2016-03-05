int spotX;
int spotY;
float spotDirection; // in radians
final int spotSpeed = 10;

void moveSpot(float followX, float followY)
{  
  int nextX = spotX + int(spotSpeed * cos(spotDirection));
  int nextY = spotY + int(spotSpeed * sin(spotDirection));
  
  if (dist(nextX, nextY, followX, followY) > 25)
  {
    spotX = nextX;
    spotY = nextY;    
  }
  
  spotDirection = atan2(followY - spotY, followX - spotX);
  int brightDistance = 300;
  loadPixels();
  
  for (int x=0; x < width; x++)
  {
    for (int y=0; y < height; y++)
    {
      int index = y*width + x;
      
      // Temporarily save the RGB values for the current pixel
      // so we can adjust them, then set them back
      float r = red(pixels[index]);
      float g = green(pixels[index]);
      float b = blue(pixels[index]);
      
      
      // Calculate how much to change the brightness of the
      // color based on how close the current pixel is to
      // the mouse.  Pixels more than 50 away from the
      // mouse will just be black.  Then, as they get
      // closer to the mouse, the brightness should be
      // higher and higher.  0 brightness factor means 
      // black 1.0 brightness factor means original
      // color.
      
      float distance = dist(x, y, spotX, spotY);
      
      float adjustFactor = (brightDistance-distance)/brightDistance;
      adjustFactor = constrain(adjustFactor, 0, 1.0f);
      
      r *= adjustFactor;
      g *= adjustFactor;
      b *= adjustFactor;
      
      // Save the new color back to the original location
      // of the current pixel
      pixels[index] = color(r,g,b);
    }
}
updatePixels();
}