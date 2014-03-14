import 'dart:html';
import 'dart:convert' show JSON;
import 'dart:async' show Future;

void main() {
  querySelector("#sample_text_id")
      ..text = "Click me!"
      ..onClick.listen(reverseText);
  
  HttpRequest.getString('data.json').then(manageUsers)
	 .catchError((err){
	  	print("call ko $err");
	  });
  
  
}

void manageUsers(String response){
  	List users = JSON.decode(response);
    print(users);
}

void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
}

class User{
	
	String _firstName;
	String _lastName;
}