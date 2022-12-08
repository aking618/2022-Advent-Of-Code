void main() {
  List<String> elfIntakes = input.split("\n\n");
  
  partOne(elfIntakes: elfIntakes);
  partTwo(elfIntakes: elfIntakes);
}

void partOne({List<String> elfIntakes = const []}) {
  int maxTotal = 0;

  for (String elfIntake in elfIntakes) {
    List<int> intakes =
        elfIntake.split("\n").map((e) => int.parse(e)).toList();

    int sum = intakes.reduce((a, b) => a + b);

    if (sum > maxTotal) {
      maxTotal = sum;
    }
  }

  print(maxTotal);
}

void partTwo({List<String> elfIntakes = const []}) {
  List<int> sums = [];

  for (String elfIntake in elfIntakes) {
    List<int> intakes =
        elfIntake.split("\n").map((e) => int.parse(e)).toList();

    int sum = intakes.reduce((a, b) => a + b);

    sums.add(sum);
  }
  
  sums.sort();

  print(sums.sublist(sums.length - 3, sums.length).reduce((a, b) => a + b));
}

