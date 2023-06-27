import 'dart:html';

void main() {
  final ButtonElement button = querySelector('button') as ButtonElement;
  final InputElement input = querySelector('input') as InputElement;

  button.onClick
  .take(4)
  .where((event)=>input.value=='cherry')
  .listen(
    (event) => print('You got it!'),
    onDone: () => print('Nope, bad guesses.'),
  );
}
