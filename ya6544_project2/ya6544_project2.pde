PrintWriter allWordsOutput, uniqueWordsOutput, wordCountsOutput;
String[] uniqueWords;
String[] wordCounts;
int numWords = 0;
boolean displayUniformWordCloud = true;

void setup() {
  size(800, 600);
  String[] allWords;
  String theWord;
  
  // I set these arrays to 10000 because in my case, with the book, The Picture of Dorian Gray by Oscar Wilde, I am
  // only using the 1st chapter in the source.txt as it was taking far to long to generate when I had the entire 
  // book in the source.txt; and the 1st chapter definitely has less than 10000 words
  String[] uniqueWordsArray = new String[10000];
  int[] wordFrequencies = new int[10000];
  int indexOfUniqueWord = 0;

  // Generates text files for the three requested outputs
  allWordsOutput = createWriter("allwords.txt");
  uniqueWordsOutput = createWriter("uniquewords.txt");
  wordCountsOutput = createWriter("wordcounts.txt");

  String[] lines = loadStrings("source.txt");
  for (int line = 0; line < lines.length; line++) {
    allWords = split(lines[line], ' '); // This splits each line into individual words
    for (int word = 0; word < allWords.length; word++) {
      theWord = allWords[word];
      
      // If there is a word present, then it converts it to lowercase
      // I found the .toLowerCase() function from:
      // https://processing.org/reference/String_toLowerCase_.html
      if (!theWord.isEmpty()) {
        theWord = theWord.toLowerCase();
        
        // I used to be a CS major so I am using the StringBuilder class to store the alphabetic characters, all lowercase words
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < theWord.length(); i++) {
          char theCharacterAtWord = theWord.charAt(i);
          // Checks to see if all the characters in the word are alphabetic using ASCII; if so, then it appends it to the result
          if (theCharacterAtWord >= 'a' && theCharacterAtWord <= 'z') {
            result.append(theCharacterAtWord);
          }
        }
        theWord = result.toString();
        
        // Adds all of the lowercased, and entirely alphabetic words to the allwords.txt file
        if (!theWord.isEmpty()) {
          allWordsOutput.println(theWord);
          
          // Code below inspired/parts taken from ChatGPT until allWordsOutput.close(); line
          // Checks to see if the word is already in the uniqueWordsArray
          boolean foundWord = false;
          for (int i = 0; i < indexOfUniqueWord; i++) {
            if (uniqueWordsArray[i].equals(theWord)) {
              wordFrequencies[i]++;
              foundWord = true;
              break;
            }
          }
          // If the word is not in the uniqueWordsArray, then it adds it to it
          if (!foundWord) {
            uniqueWordsArray[indexOfUniqueWord] = theWord;
            wordFrequencies[indexOfUniqueWord] = 1;
            indexOfUniqueWord++;
          }
        }
      }
    }
  }
  allWordsOutput.close(); // closes the allwords.txt file

  // Adds the unique words (words that only show up once in the source.txt file) to
  // the uniquewords.txt file
  for (int i = 0; i < indexOfUniqueWord; i++) {
    if (wordFrequencies[i] == 1) {
      uniqueWordsOutput.println(uniqueWordsArray[i]);
    }
  }
  uniqueWordsOutput.close(); // closes the uniquewords.txt file

  // This tracks the maximum frequency for each of the words that 
  // frequently show up
  int maxFrequency = 0;
  for (int i = 0; i < indexOfUniqueWord; i++) {
    if (wordFrequencies[i] > maxFrequency) {
      maxFrequency = wordFrequencies[i];
    }
  }

  // This tracks the frequency of the frequencies of the words
  int[] frequencyCounts = new int[maxFrequency + 1];
  for (int i = 0; i < indexOfUniqueWord; i++) {
    frequencyCounts[wordFrequencies[i]]++;
  }

  // This adds the the frequency of the frequencies of the words to the wordcounts.txt
  // file in the "frequency: number of distinct words with that frequency" format
  for (int freq = 1; freq <= maxFrequency; freq++) {
    if (frequencyCounts[freq] > 0) {
      wordCountsOutput.println(freq + ": " + frequencyCounts[freq]);
    }
  }
  wordCountsOutput.close(); // closes the wordcounts.txt file

  // Load unique words for visualization
  uniqueWords = loadStrings("uniquewords.txt");
  numWords = uniqueWords.length;

  // Loads the word counts for frequency distribution visualization
  wordCounts = loadStrings("wordcounts.txt");

  textAlign(CENTER, CENTER);
  textSize(20);
  noLoop(); // Ensure draw() is called only once unless mouse is pressed
}

void draw() {
  background(255);

  if (displayUniformWordCloud) {
    drawUniformWordCloud();
  } else {
    drawFrequencyDistribution();
  }
}

// This method displays the uniform word cloud based on the uniquewords.txt file
void drawUniformWordCloud() {
  // I chose the "Zapfino" font off of the Processing reference site because I thought it fit the aesthetic of the book
  // https://processing.org/tutorials/typography
  PFont font = createFont("Zapfino", 9, true);
  textFont(font);

  int margin = 10;
  int wordWidth = 100;
  int wordHeight = 30;
  // Calculates the number of rows and columns needed with enough space so that the words don't overlap or run off the edges of the canvas
  int cols = (width - margin * 2) / wordWidth;
  int rows = (height - margin * 2) / wordHeight;
  int maxWords = cols * rows;

  // Loops through the words to find the exact x, and y coordinates for each one to create equally spaced,
  // cohesive rows and columns of the unique words from the book using formulas to find each coordinate value
  for (int i = 0; i < maxWords; i++) {
    // MOD function from when I was a CS major; I don't think we've learned it in CS 324E yet
    int x = margin + (i % cols) * wordWidth + wordWidth / 2;
    int y = margin + (i / cols) * wordHeight + wordHeight / 2;

    if (uniqueWords[i].length() <= 4) {
      fill(#002D0B); // Dark green for short words (1-4 letters)
    } else if (uniqueWords[i].length() <= 7) {
      fill(#00008B); // Dark blue for medium-length words (5-7 letters)
    } else {
      fill(#8B0000); // Dark red for long words (8 or more letters)
    }
    text(uniqueWords[i], x, y);
  }
}

// Code inspired by ChatGPT for the drawFrequencyDistribution() function
// This function draws a bar chart using data from the wordcounts.txt file
void drawFrequencyDistribution() {
  // This sets a margin to 50 pixels around the edges of the canvas which makes sure that the bar chart does not touch the borders/go outside of it
  int margin = 50;
  int barWidth = (width - 2 * margin) / wordCounts.length;
  
  // The for loop iterates over each element from the wordCounts array and stores each into its respective new array
  for (int i = 0; i < wordCounts.length; i++) {
    String[] parts = split(wordCounts[i], ": ");
    int frequency = int(parts[0]);
    int count = int(parts[1]);

    // calculates the height of each bar
    float barHeight = count * 0.65;
    // calculates the x coordinate of each bar
    float x = margin + i * barWidth;
    // calculates the y coordinate of each bar
    float y = height - margin - barHeight;

    // Sets the fill color of the slices to different shades of red depending on the index that it is on
    fill(50 * i, i, i);
    rect(x, y, barWidth, barHeight);
    
    // This draws the frequency amount below the bar chart
    fill(0);
    textAlign(CENTER);
    PFont font = createFont("Arial", 8, true);
    textFont(font);
    text(frequency, x + barWidth / 2, height - margin + 15);
  }
}

void mousePressed() {
  // Redraws the sketch when the mousepad is pressed
  // https://processing.org/reference/redraw_.html
  redraw();
}

void keyPressed() {
  if (key == 'a') {
    displayUniformWordCloud = true;
  } else if (key == 'b') {
    displayUniformWordCloud = false;
  }
  // Redraws the sketch to show the visualization that the user wants to see based on their selection
  redraw();
}
