import 'package:bottom/bottom.dart';

void main(List<String> arguments) {
  var bottomed = (bottom.toBottom('Bing chilling'));

  print(bottomed);

  var unbottomed = (bottom.fromBottom(bottomed));

  print(unbottomed);
}
