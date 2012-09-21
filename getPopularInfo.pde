void responseReceived(HttpRequest request, HttpResponse response) {
//  println(response.getContentAsString());

  //// we get the server response as a JSON object
  JSONObject content = response.getContentAsJSONObject();
  

  //  println(content);

  //// get the "data" value, which is an array
  if (content.get("data") != null) {
    
    currentItem ++; 
    
    JSONObject data = content.get("data");

    //// get the first element in the array
    JSONObject first = data.get(0);

    //// the "user" value is another dictionary, from which we can get the "full_name" string value
    if (first.get("user").get("id").stringValue() != null) {
      println(first.get("user").get("id").stringValue());
    }
    
    if (first.get("user").get("full_name").stringValue() != null) {
      println(first.get("user").get("full_name").stringValue());
    }
    
    //// the "caption" value is another dictionary, from which we can get the "text" string value
 /*   if (first.get("caption").get("text").stringValue() != null) {
      println(first.get("caption").get("text").stringValue());
    }
    */
    //// get profile picture
    if (first.get("user").get("profile_picture").stringValue() != null) {
      println(first.get("user").get("profile_picture").stringValue());
    }
    //// the "images" value is another dictionary, from which we can get different image URL data
    if (first.get("images").get("standard_resolution").get("url").stringValue() != null) {
      println(first.get("images").get("standard_resolution").get("url").stringValue());
    }
    if (first.get("likes").get("count").intValue() != 0) {
      println("Likes: "+first.get("likes").get("count").intValue());
      likes[currentItem] = first.get("likes").get("count").intValue();
    }
    
    if (first.get("comments").get("count").intValue() != 0) {
      println("Comments: "+first.get("comments").get("count").intValue());
      comments[currentItem] = first.get("comments").get("count").intValue();
    }
/*
    if (first.get("tags") != null) {
      JSONObject tags = first.get("tags");
      tagStrings[currentItem] = new String[tags.size()];
      for (int i = 0; i < tags.size(); i++) {
        tagStrings[currentItem][i] = tags.get(i).stringValue();
      }
      
    println("Tags: "+tags.size());
    }
*/  if (first.get("user").get("id").stringValue() != null) {
      userID[currentItem] = first.get("user").get("id").stringValue();
    }  
    if (first.get("user").get("full_name").stringValue() != null) {
      username[currentItem] = first.get("user").get("full_name").stringValue();
    }
    if (first.get("user").get("profile_picture").stringValue() != null) {
      String profilepicture_url = first.get("user").get("profile_picture").stringValue();
      profilepicture[currentItem] = loadImage(profilepicture_url, "png");
    }
    if (first.get("user").get("profile_picture").stringValue() != null) {
      String userphoto_url = first.get("images").get("standard_resolution").get("url").stringValue();
      userphoto[currentItem] = loadImage(userphoto_url, "png");
      image(userphoto[currentItem],100,100);
    }
    println(currentItem);
  }
  
}
