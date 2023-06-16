void main() {
  var person = new Person("onur");

  person.printName();
}

String myName() {
  return "Stephen";
}

class Person {
  String firstName;
  Person(this.firstName);
  printName() {
    print(firstName);
  }
}
