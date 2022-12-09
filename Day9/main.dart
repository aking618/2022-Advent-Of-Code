import 'dart:math';

import 'input.dart';

void main() {
  List<String> moves = input.split("\n");

  partOne(moves: moves);
  partTwo(moves: moves);
}

void partOne({List<String>? moves}) {
  List<Point> seen = [];

  Point head = Point(0, 0);
  Point tail = Point(0, 0);

  seen.add(tail);

  Map<String, Point> directions = {
    "U": Point(0, 1),
    "D": Point(0, -1),
    "L": Point(-1, 0),
    "R": Point(1, 0),
  };

  List<dynamic> actions = moves!.map((e) => e.split(" ")).toList();
  actions = actions.map((e) => [e[0], int.parse(e[1])]).toList();

  for (var action in actions) {
    for (var i = 0; i < action[1]; i++) {
      head = head + directions[action[0]]!;

      double distance = tail.distanceTo(head);
      double angle = getAngle(head, tail);

      if (head.distanceTo(tail) > sqrt2) {
        tail = getNewTail(head, tail, angle);

        if (!seen.contains(tail)) {
          seen.add(tail);
        }
      }
    }
  }

  print("Part 1: ${seen.length}");
}

void partTwo({List<String>? moves}) {
  List<Point> seen = [];

  List<Point> rope = List.generate(10, (index) => Point(0, 0));

  seen.add(rope[rope.length - 1]);

  Map<String, Point> directions = {
    "U": Point(0, 1),
    "D": Point(0, -1),
    "L": Point(-1, 0),
    "R": Point(1, 0),
  };

  List<dynamic> actions = moves!.map((e) => e.split(" ")).toList();
  actions = actions.map((e) => [e[0], int.parse(e[1])]).toList();

  for (var action in actions) {
    for (var i = 0; i < action[1]; i++) {
      rope[0] = rope[0] + directions[action[0]]!;

      for (var i = 1; i < rope.length; i++) {
        double distance = rope[i - 1].distanceTo(rope[i]);
        double angle = getAngle(rope[i - 1], rope[i]);

        if (rope[i - 1].distanceTo(rope[i]) > sqrt2) {
          rope[i] = getNewTail(rope[i - 1], rope[i], angle);

          if (!seen.contains(rope[rope.length - 1])) {
            seen.add(rope[rope.length - 1]);
          }
        }
      }
    }
  }

  print("Part 2: ${seen.length}");
}

double getAngle(Point head, Point tail) {
  double angle = atan2(head.y - tail.y, head.x - tail.x);
  angle = angle * 180 / pi;
  return angle;
}

Point getNewTail(Point head, Point tail, double angle) {
  if ((angle.round() == 180 || angle.round() == 0) && head.x > tail.x) {
    return Point(tail.x + 1, tail.y);
  }

  if ((angle.round() == 180 || angle.round() == 0) && head.x < tail.x) {
    return Point(tail.x - 1, tail.y);
  }

  if ((angle.round() == 90 || angle.round() == -90) && head.y > tail.y) {
    return Point(tail.x, tail.y + 1);
  }

  if ((angle.round() == 90 || angle.round() == -90) && head.y < tail.y) {
    return Point(tail.x, tail.y - 1);
  }

  if (isAngleBetween(angle, 1, 89)) {
    return Point(tail.x + 1, tail.y + 1);
  }

  if (isAngleBetween(angle, 91, 179)) {
    return Point(tail.x - 1, tail.y + 1);
  }

  if (isAngleBetween(angle, -89, -1)) {
    return Point(tail.x + 1, tail.y - 1);
  }

  if (isAngleBetween(angle, -179, -91)) {
    return Point(tail.x - 1, tail.y - 1);
  }

  return tail;
}

bool isAngleBetween(double angle, double min, double max) {
  return angle >= min && angle <= max;
}
