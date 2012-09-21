/* 
*  initial forays into working with Instagram API for processing
*
*/

import com.francisli.processing.http.*;

String clientID = "d6208d23235d4cf287d63c9d6dc9cf31"; //put your clientID here

//PFont InstagramFont;
//PFont InstagramFont2;


int totalCheck = 9;
int currentItem = 0;

PImage[] userphoto = new PImage[totalCheck];
PImage[] profilepicture = new PImage[totalCheck];
String[] username = new String[totalCheck];
String[] userID = new String[totalCheck];
String tag[] = new String[totalCheck];
String[] tagStrings = new String[totalCheck];
String[] search = new String[totalCheck];
int[] comments = new int[totalCheck];
int[] likes = new int[totalCheck];



float likedCount[];


HttpClient client;
HttpClient Personal;

void setup() {
  
  size(800, 800, P2D);
  smooth();
  //InstagramFont = loadFont("Helvetica-Bold-36.vlw");
  //InstagramFont2 = loadFont("Helvetica-Light-16.vlw");

  
  // create new client
  client = new HttpClient(this, "api.instagram.com");
 
  // use https
  client.useSSL = true;
  
  // search for the artist Radiohead
  String mediaLookup = "popular";
 
  // instantiate a new HashMap
  HashMap params = new HashMap();
 
  // pass parameters as key-value pairs
  params.put("client_id", clientID);
 
  for (int i=0;i<totalCheck-1;i++){
    // make the request
    client.GET("v1/media/popular?client_id="+clientID);
  }

}


void draw() {
//  println(currentItem);
  if (currentItem==totalCheck-1){

  imageMode(CENTER);
    for (int i=0;i<totalCheck;i++){
          
//    background(255);
    imageMode(CENTER);
    
    if (profilepicture[i] != null) {
      image(profilepicture[i], 82, 90, 90, 90);
    }
  
    if (userphoto[i] != null) {
      image(userphoto[i], 100*i-50, height/2-30, 100, 100);
    }
    /*
   textFont(InstagramFont, 36);
    if (username[i] != null) {
      text(username[i], 140, 105);
      fill(0);
    }
    if (userID[i] != null) {
      text(userID[i], 140, 150);
      fill(0);
    }
      text(likes[i], 100, i*11);
      text(comments[i],100,i+12);
    
  /*
  
    textFont(InstagramFont2, 16);
    if ((tagStrings != null) && (tagStrings.length > 0)) {
      String line = "#" + tagStrings[0];
      for (int i = 1; i < tagStrings.length; i++) {
        line += ", " + tagStrings[i];
      }
      text(line, 40, 690, 525, 150);
      fill(0);
    }
   */
   delay(100); // 5 seconds delay
  //  client.GET("v1/media/popular?client_id="+clientID);
//  println(i);
    }
  }
}


