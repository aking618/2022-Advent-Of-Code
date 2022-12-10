import 'dart:io';

void main() async {
  final input = await File('./Day10/input.txt').readAsString();

  final moves = input.split('\n');

  partOne(moves: moves);
  partTwo(moves: moves);
}

void partOne({List<String>? moves}) {
  if (moves == null) return;

  int currentCycle = 1;
  int currentMoveIndex = 0;

  int instructionSum = 1;
  int cycleSum = 0;

  bool addStarted = false;

  while (currentMoveIndex < moves.length) {
    final move = moves[currentMoveIndex].split(" ");

    switch (currentCycle) {
      case 20:
        cycleSum += 20 * instructionSum;
        break;
      case 60:
        cycleSum += 60 * instructionSum;
        break;
      case 100:
        cycleSum += 100 * instructionSum;
        break;
      case 140:
        cycleSum += 140 * instructionSum;
        break;
      case 180:
        cycleSum += 180 * instructionSum;
        break;
      case 220:
        cycleSum += 220 * instructionSum;
        break;
      default:
    }

    if (move[0] == "addx") {
      if (addStarted) {
        addStarted = false;
        instructionSum += int.parse(move[1]);
        currentMoveIndex++;
      } else {
        addStarted = true;
      }
    } else {
      currentMoveIndex++;
    }

    currentCycle++;
  }

  print(cycleSum);
}

void partTwo({List<String>? moves}) {
  if (moves == null) return;

  int currentCycle = 1;
  int currentMoveIndex = 0;

  int instructionSum = 1;

  bool addStarted = false;

  List<List<String>> grid = List.generate(
    6,
    (index) => List.generate(40, (index) => ''),
  );

  List<int> sprite = [0, 1, 2];

  while (currentMoveIndex < moves.length) {
    final move = moves[currentMoveIndex].split(" ");

    if (sprite.contains((currentCycle - 1) % 40)) {
      grid[(currentCycle - 1) ~/ 40][(currentCycle - 1) % 40] = '#';
    } else {
      grid[(currentCycle - 1) ~/ 40][(currentCycle - 1) % 40] = '.';
    }

    if (move[0] == "addx") {
      if (addStarted) {
        addStarted = false;
        instructionSum += int.parse(move[1]);
        currentMoveIndex++;

        sprite = [instructionSum - 1, instructionSum, instructionSum + 1];
      } else {
        addStarted = true;
      }
    } else {
      currentMoveIndex++;
    }

    printGrid(currentCycle, grid);

    currentCycle++;
  }
}

void printGrid(int cycle, List<List<String>> grid) {
  print("Cycle: $cycle");
  for (var row in grid) {
    print(row.join());
  }
}
