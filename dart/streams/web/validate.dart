import 'dart:html';
import 'dart:async';

void main() {
  final InputElement input = querySelector('input') as InputElement;
  final DivElement div = querySelector('div') as DivElement;

  final validator = new StreamTransformer.fromHandlers(handleData: (inputValue, sink) {
    if (inputValue != null && (inputValue as String).contains('@')) {
      sink.add(inputValue);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  input.onInput
      .map((dynamic event) => event.target.value)
      .transform(validator)
      .listen(
        (inputValue)=> {
          div.innerHtml='',
          print(inputValue)
        },
        onError: (err)=> div.innerHtml=err,

      );
}
