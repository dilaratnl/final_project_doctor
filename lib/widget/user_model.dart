class MyUser{
  String? email;
  String? name;

  MyUser({
    this.email,
    this.name
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'email' : email,
      'name': name,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map){
    return MyUser(
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    
    );
  }
}