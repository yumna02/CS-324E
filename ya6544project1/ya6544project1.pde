PImage img;
PImage originalImg;
PImage convolvedImage;

// The sobel filter is another name for edge detection
// Lecture [3] Images, slide 6.4:
float[] sobelKernel =
  {-1, 0, 1,
   -2, 0, 2, 
   -1, 0, 1};
   
// ATTRIBUTION COMMENT/CITATION: The following line of code (line 18) is not my own
// I asked ChatGPT 4.0 about the proper grayscale kernel values as I could not 
// figure it out on my own when messing around with various values. It gave me
// 0.299 for the value to be applied to the red colors in the image, it gave me
// 0.587 for the value to be applied to the green colors in the image, and it gave me
// 0.114 for the value to be applied to the blues colors in the image.
float[] grayscaleKernel = {0.299, 0.587, 0.114};

// Lecture [3] Images, slide 6.10:
float[] contrastKernel =
  {0, -1, 0, 
  -1, 5, -1, 
  0, -1, 0};
  
// Lecture [3] Images, slide 6.8: I calculated the exact value of each kernal
// by multiplying {1, 2, 1, 2, 4, 2, 1, 2, 1} by 16 in order to simplify it:
float[] gaussianKernel = {
  0.0625, 0.125, 0.0625,
  0.125,  0.25,  0.125,
  0.0625, 0.125, 0.0625
};

void setup() {
  img = loadImage("flower.jpg");
  originalImg = img.copy();
  size(255, 193);
  convolvedImage = new PImage(img.width, img.height);
}

void draw() {
  image(convolvedImage, 0, 0);
}

void keyPressed() {
  if (key == '0') {
    resetImage();
  } else if (key == '1') {
    grayscaleFilter();
  } else if (key == '2') {
    convolveTheImage(contrastKernel);
  } else if (key == '3') {
    convolveTheImage(gaussianKernel);
  } else if (key == '4') {
    convolveTheImage(sobelKernel);
  }
}

// .copy(): https://processing.org/reference/copy_.html
void resetImage() {
  convolvedImage = originalImg.copy();
}

void convolveTheImage(float[] theKernel) {
  img.loadPixels();
  convolvedImage.loadPixels();
  for (int x = 1; x < img.width - 1; x++) {
    for (int y = 1; y < img.height - 1; y++) {
      applyKernelTo(img, x, y, theKernel);
    }
  }
  convolvedImage.updatePixels();
}

// Lecture [3] Images, slide 7.10:
void applyKernelTo(PImage img, int x, int y, float[] kernelFilter) {
  float finalRed = 0.0;
  float finalGreen = 0.0;
  float finalBlue = 0.0;
  for (int xOff = -1; xOff <= 1; xOff++) {
    for (int yOff = -1; yOff <= 1; yOff++) {
      int imgIndex = (y + yOff) * img.width + (x + xOff);
      int kerIndex = (1 + yOff) * 3 + (1 + xOff);
      color pixel = img.pixels[imgIndex];
      float red = red(pixel);
      float green = green(pixel);
      float blue = blue(pixel);
      finalRed += red * kernelFilter[kerIndex];
      finalGreen += green * kernelFilter[kerIndex];
      finalBlue += blue * kernelFilter[kerIndex];
    }
  }
  finalRed = constrain(finalRed, 0, 255);
  finalGreen = constrain(finalGreen, 0, 255);
  finalBlue = constrain(finalBlue, 0, 255);
  color finalColor = color(finalRed, finalGreen, finalBlue);
  convolvedImage.pixels[x + img.width * y] = finalColor;
}

// I asked ChatGPT about debugging questions related to my program
// which allowed me to realize that I could not simply pass in a kernel
// to create a grayscale filter in my applyToKernel() function, which
// ultimately led me to create this function:
void grayscaleFilter() {
  img.loadPixels();
  convolvedImage.loadPixels();
  for (int imgIndex = 0; imgIndex < img.pixels.length; imgIndex++) {
    color pixel = img.pixels[imgIndex];
    float red = red(pixel);
    float green = green(pixel);
    float blue = blue(pixel);
    float gray = red * grayscaleKernel[0] + green * grayscaleKernel[1] + blue * grayscaleKernel[2];
    convolvedImage.pixels[imgIndex] = color(gray, gray, gray);
  }
  convolvedImage.updatePixels();
}
