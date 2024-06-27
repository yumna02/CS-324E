<Project 1: Image Manipulation> Report for <ya6544>
====================================


## Instructions


<Open the file in Processing, then hit the run button. Press keys “0” through “4” to either reset the filter, or change the filters on the image.>


## Report


<This project manipulates an image that is input by utilizing kernels to convolve the image. It convolves the image of, in my specific project, a flower, by applying various kernels to the image which is dependent upon the key that the user presses. There are 4 filters created and used in this program. These filters include a grayscale filter which can be applied to the original image when the user presses “1”, a contrast filter which can be applied to the original image when the user presses “2”, a gaussian filter which can be applied to the original image when the user presses “3”, and a sobel filter which can be applied to the original image when the user presses “4”. I wrote all of the program myself, minus the one line of code (line 18) for the grayscale kernel, referencing back to the slides “[3] Images” by Kevin Song from my CS 324E: Graphics/Visualization class and attending Kevin Song’s office hours on June 17th, 2024. I used code that I wrote for the “Hands On: Image Kernels” which I was able to fix during my professor Kevin Song’s office hours. Using this code, I was able to change the applyKernelTo() function to take in a kernel parameter which would allow me to apply the sobel, contrast, and gaussian filters on it when their respective kernels were input and called on the function. I debugged the program, found the line of code for the numerical values that create a grayscale kernel, and asked questions using ChatGPT 4.0 – this ultimately allowed me to write the grayscaleFilter() code, as well, by informing me of the differences of the grayscale filter. Additionally, I referenced a Processing.org reference page to learn how to implement copy() in order to reset the image (reference page: https://processing.org/reference/copy_.html). There are no unresolved issues with my program at this time. 

Project: 1
Purpose: Project 1 was created for my CS 324E: Graphics/Visualization class
Class: CS 324E: Graphics/Visualization with Professor Kevin Song at the University of Texas at Austin
Date: Summer 2024
Assignment Instructions: https://www.cs.utexas.edu/~thekson>
