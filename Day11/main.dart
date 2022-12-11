import 'input.dart';

void main() {
  partOne();
  partTwo();
}

void partOne() {
  for (var round = 0; round < 20; round++) {
    for (int i = 0; i < monkeys.length; i++) {
      if (monkeys[i].items.isEmpty) {
        continue;
      }

      while (monkeys[i].items.isNotEmpty) {
        monkeys[i].inspections++;

        int worryValue = monkeys[i].items.removeAt(0);
        worryValue = monkeys[i].operation(worryValue);
        worryValue = (worryValue / monkeys[i].divisor).floor();

        monkeys[i].test(worryValue);
      }
    }
  }

  int highest = 0;
  int secondHighest = 0;

  for (Monkey monkey in monkeys) {
    if (monkey.inspections > highest) {
      secondHighest = highest;
      highest = monkey.inspections;
    } else if (monkey.inspections > secondHighest) {
      secondHighest = monkey.inspections;
    }
  }

  print(highest * secondHighest);
}

void partTwo() {
  resetMonkeys();

  int leastCommonMultiple = 1;
  for (Monkey monkey in monkeys) {
    leastCommonMultiple = lcm(leastCommonMultiple, monkey.divisor);
  }

  for (var round = 0; round < 10000; round++) {
    for (int i = 0; i < monkeys.length; i++) {
      if (monkeys[i].items.isEmpty) {
        continue;
      }

      while (monkeys[i].items.isNotEmpty) {
        monkeys[i].inspections++;

        int worryValue = monkeys[i].items.removeAt(0);
        worryValue = monkeys[i].operation(worryValue);
        worryValue = (worryValue % leastCommonMultiple).floor();

        monkeys[i].test(worryValue);
      }
    }

    switch (round) {
      case 1 - 1:
      case 20 - 1:
      case 1000 - 1:
      case 2000 - 1:
      case 3000 - 1:
      case 4000 - 1:
      case 5000 - 1:
      case 6000 - 1:
      case 7000 - 1:
      case 8000 - 1:
      case 9000 - 1:
      case 10000 - 1:
        print('=== After round $round ===');
        for (int key = 0; key < monkeys.length; key++) {
          print(
              'Monkey $key: inspected items ${monkeys[key].inspections} times.');
        }
        print("");

        break;
    }
  }

  int highest = 0;
  int secondHighest = 0;

  for (Monkey monkey in monkeys) {
    if (monkey.inspections > highest) {
      secondHighest = highest;
      highest = monkey.inspections;
    } else if (monkey.inspections > secondHighest) {
      secondHighest = monkey.inspections;
    }
  }

  BigInt result = BigInt.from(highest) * BigInt.from(secondHighest);
  print(result);
}
