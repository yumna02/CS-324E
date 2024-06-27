<Project 2: Text Visualization> Report for <ya6544>
====================================


## Instructions


<Open the file in Processing, then hit the run button. Press the mousepad to generate the uniform word cloud based on the uniquewords.txt file. Press key “a” to generate the uniform word cloud, or press key “b” to generate the pie chart based off the wordcounts.txt file.>


## Report


<This project extracts, analyzes, and visualizes data of text from the source.txt file which is from a book off of Project Gutenberg's website. The book that I chose for my source.txt file was The Picture of Dorian Gray by Oscar Wilde. Because the file was too large for my computer to process, I had shortened the length of the file down to only one chapter of the book. This project generates three text files from the given source.txt file. These three files includes an allwords.txt file which contains every word from the source.txt file stripped onto its own line, a uniquewords.txt file which contains every unique word (word that only shows up once) from the source.txt file, and wordcounts.txt which contains the frequency of words to the number of words with that frequency on it’s own line. I wrote all of the code to generate each of these three files in the void setup() method, rather than making new functions for each, as it saved me lines of code overall by using the same line of code for some parts in order to generate two files (such as the if (!theWord.isEmpty()) line). I wrote separate methods to generate the visual representation of the uniquewords.txt file by creating the void drawUniformWordCloud() method, and the drawFrequencyDistribution() method for the visual representation of the wordcounts.txt file. I called both of these functions in the keyPressed() function. In order to write this code, I referenced Kevin Song’s lecture slides from my CS 324E: Graphics/Visualization, asked ChatGPT 4.0 questions, and used various reference pages from the Processing.org website — all of which are specified when used, within the code for Project 2 itself. There are no unresolved issues with my program at this time. >