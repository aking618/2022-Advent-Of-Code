import 'input.dart';

void main() {
  List<String> rounds = input.split("\n");

  partOne(rounds);
  partTwo(rounds);
}

void partOne(List<String> rounds) {
  var score = rounds.map(partOneRubric).reduce((a, b) => a + b);

  print("Part One $score");
}

void partTwo(List<String> rounds) {
  var score = rounds.map(partTwoRubric).reduce((a, b) => a + b);

  print("Part Two $score");
}

dynamic partOneRubric(String type) {
  switch (type) {
    case "A X":
      return 4;
    case "A Y":
      return 8;
    case "A Z":
      return 3;
    case "B X":
      return 1;
    case "B Y":
      return 5;
    case "B Z":
      return 9;
    case "C X":
      return 7;
    case "C Y":
      return 2;
    case "C Z":
      return 6;
  }
}

dynamic partTwoRubric(String type) {
  switch (type) {
    case "A X":
      return 3;
    case "A Y":
      return 4;
    case "A Z":
      return 8;
    case "B X":
      return 1;
    case "B Y":
      return 5;
    case "B Z":
      return 9;
    case "C X":
      return 2;
    case "C Y":
      return 6;
    case "C Z":
      return 7;
  }
}
