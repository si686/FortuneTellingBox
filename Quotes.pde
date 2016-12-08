
String[] quotes = {
  "The only person you are destined to become is the person you decide to be.", 
  "Start where you are. Use what you have. Do what you can.", 
  "How wonderful it is that nobody need wait a single moment before starting to improve the world.", 
  "When one door closes another door opens; but we so often look so long and so regretfully upon the closed door, that we do not see the ones which open for us.", 
  "Life is a succession of lessons which must be lived to be understood.", 
  "When you get into a tight place and everything goes against you, till it seems as though you could not hang on a minute longer, never give up then, for that is just the place and time that the tide will turn.", 
  "You must do the thing you think you cannot do.", 
  "If you don’t pay appropriate attention to what has your attention, it will take more of your attention than it deserves.", 
  "I find hope in the darkest of days, and focus in the brightest. I do not judge the universe.", 
  "Stringacter cannot be developed in ease and quiet. Only through experience of trial and suffering can the soul be strengthened, ambition inspired, and success achieved.", 
  "It is by going down into the abyss that we recover the treasures of life. Where you stumble, there lies your treasure.", 
  "In essence, if we want to direct our lives, we must take control of our consistent actions. It’s not what we do once in a while that shapes our lives, but what we do consistently.", 
  "Our greatest weakness lies in giving up. The most certain way to succeed is always to try just one more time.", 
  "You are never to old to set another goal or to dream a new dream.", 
  "Even if you fall on your face, you’re still moving forward.", 
  "Be miserable. Or motivate yourself. Whatever has to be done, it’s always your choice.", 
  "Learn from the past, set vivid, detailed goals for the future, and live in the only moment of time over which you have any control: now.", 
  "Do you want to know who you are? Don’t ask. Act! Action will delineate and define you.", 
  "The key is to keep company only with people who uplift you, whose presence calls forth your best.", 
  "Be impeccable with your word. Speak with integrity. Say only what you mean. Avoid using the word to speak against yourself or to gossip about others. Use the power of your word in the direction of truth and love.", 
  "Act as if what you do makes a difference. It does.", 
  "Learning is the beginning of wealth. Learning is the beginning of health. Learning is the beginning of spirituality. Searching and learning is where the miracle process all begins", 
  "I’d rather attempt to do something great and fail than to attempt to do nothing and succeed.", 
  "If it is bread that you seek, you will have bread. If it is the soul you seek, you will find the soul. If you understand this secret, you know you are that which you seek."
};

int index;
int time = 200; //00 seconds  
int a = (int) random(23);
PFont font; 

void setup() {
  frameRate(60); 
  size(1280, 720);
  font = loadFont("ColonnaMT-48.vlw"); 
}

void draw() {
  println(frameCount); 
  background(0);
  fill(random(255), random(255), random (255));
  rectMode(CENTER); 
  if ( frameCount%time != 0) {
    textFont(font, 60);
    textAlign(CENTER);
    text(quotes[(a)], width/2, height, width - 200 ,height+350);
  } else if ( frameCount%time == 0) {
    a = (int) random (23);
  }
}


// input a string, to be printed as ints to the console
void printStringToInts(String s) {
  // for the length of the String
  for (int i=0; i<s.length(); i++) {
    // convert each character in the string to an int
    // and print it to the console (with a comma added)
    print(int(s.charAt(i)) + ",");
  }
}