import 'dart:html';
import 'dart:convert' show JSON;
import 'dart:async' show Future;

void main() {
  querySelector("#sample_text_id")
      ..text = "GET USERS LIST!"
      ..onClick.listen(getUsersList);
}

void getUsersList(MouseEvent event) {
	HttpRequest.getString('data.json').then(manageUsers)
  	 .catchError((err){
  	  	print("call ko $err");
  	  });
}

void manageUsers(String response){
	String text = "";
	List<User> users = new List<User>();
	List jsonUsers = JSON.decode(response);
	jsonUsers.forEach((map) => users.add(new User.fromJson(map)));
	querySelector("#sample_text_id")
        ..text = users.toString();
}

class User{
	String _firstName;
	String _lastName;
	
	User({String firstName, String lastName}) {
      _firstName = firstName;
      _lastName = lastName;
	}
	
	User.fromJson(Map jsonMap) {
      _firstName = jsonMap['firstName'];
      _lastName = jsonMap['lastName'];
  }
	
	String toString() => "${_firstName} ${_lastName}";
}