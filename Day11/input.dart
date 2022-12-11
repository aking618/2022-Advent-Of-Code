export 'input.dart';

class Monkey {
  final int id;
  int inspections = 0;
  int divisor = 3;
  List<int> items;
  final int Function(int) operation;
  final void Function(int) test;

  Monkey({
    required this.id,
    required this.items,
    required this.operation,
    required this.test,
  });
}

List<Monkey> monkeys = [
  Monkey(
    id: 0,
    items: [79, 98],
    operation: (old) => old * 19,
    test: (newItem) {
      if (newItem % 23 == 0) {
        monkeys[2].items.add(newItem);
      } else {
        monkeys[3].items.add(newItem);
      }
    },
  ),
  Monkey(
    id: 1,
    items: [54, 65, 75, 74],
    operation: (old) => old + 6,
    test: (newItem) {
      if (newItem % 19 == 0) {
        monkeys[2].items.add(newItem);
      } else {
        monkeys[0].items.add(newItem);
      }
    },
  ),
  Monkey(
    id: 2,
    items: [79, 60, 97],
    operation: (old) => old * old,
    test: (newItem) {
      if (newItem % 13 == 0) {
        monkeys[1].items.add(newItem);
      } else {
        monkeys[3].items.add(newItem);
      }
    },
  ),
  Monkey(
    id: 3,
    items: [74],
    operation: (old) => old + 3,
    test: (newItem) {
      if (newItem % 17 == 0) {
        monkeys[0].items.add(newItem);
      } else {
        monkeys[1].items.add(newItem);
      }
    },
  ),
];

void resetMonkeys() {
  for (Monkey monkey in monkeys) {
    monkey.inspections = 0;
    monkey.divisor = 3;
  }

  monkeys = [
    Monkey(
      id: 0,
      items: [79, 98],
      operation: (old) => old * 19,
      test: (newItem) {
        if (newItem % 23 == 0) {
          monkeys[2].items.add(newItem);
        } else {
          monkeys[3].items.add(newItem);
        }
      },
    ),
    Monkey(
      id: 1,
      items: [54, 65, 75, 74],
      operation: (old) => old + 6,
      test: (newItem) {
        if (newItem % 19 == 0) {
          monkeys[2].items.add(newItem);
        } else {
          monkeys[0].items.add(newItem);
        }
      },
    ),
    Monkey(
      id: 2,
      items: [79, 60, 97],
      operation: (old) => old * old,
      test: (newItem) {
        if (newItem % 13 == 0) {
          monkeys[1].items.add(newItem);
        } else {
          monkeys[3].items.add(newItem);
        }
      },
    ),
    Monkey(
      id: 3,
      items: [74],
      operation: (old) => old + 3,
      test: (newItem) {
        if (newItem % 17 == 0) {
          monkeys[0].items.add(newItem);
        } else {
          monkeys[1].items.add(newItem);
        }
      },
    ),
  ];
}

int lcm(int a, int b) => (a * b) ~/ gcd(a, b);

int gcd(int a, int b) {
  if (a == 0) return b;
  return gcd(b % a, a);
}
