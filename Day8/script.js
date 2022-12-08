var visibleTrees = 0;

var trees = forest.split("\n").map(function (row) {
  return row.split("").map((e) => parseInt(e));
});

function partOne() {
  for (var row = 0; row < trees.length; row++) {
    for (var col = 0; col < trees[row].length; col++) {
      if (treeIsOnEdge(row, col)) {
        visibleTrees++;
        continue;
      }

      if (visibleFromLeft(row, col)) {
        visibleTrees++;
        continue;
      }

      if (visibleFromRight(row, col)) {
        visibleTrees++;
        continue;
      }

      if (visibleFromTop(row, col)) {
        visibleTrees++;
        continue;
      }

      if (visibleFromBottom(row, col)) {
        visibleTrees++;
        continue;
      }
    }
  }

  var partOneDiv = document.createElement("div");
  partOneDiv.innerHTML = visibleTrees.toString();
  document.getElementById("part1").appendChild(partOneDiv);
}

function treeIsOnEdge(row, col) {
  if (row === 0 || row === trees.length - 1) {
    return true;
  }

  if (col === 0 || col === trees[row].length - 1) {
    return true;
  }

  return false;
}

function visibleFromLeft(row, col) {
  for (var i = col - 1; i >= 0; i--) {
    if (trees[row][i] >= trees[row][col]) {
      return false;
    }
  }

  return true;
}

function visibleFromRight(row, col) {
  for (var i = col + 1; i < trees[row].length; i++) {
    if (trees[row][i] >= trees[row][col]) {
      return false;
    }
  }

  return true;
}

function visibleFromTop(row, col) {
  for (var i = row - 1; i >= 0; i--) {
    if (trees[i][col] >= trees[row][col]) {
      return false;
    }
  }

  return true;
}

function visibleFromBottom(row, col) {
  for (var i = row + 1; i < trees.length; i++) {
    if (trees[i][col] >= trees[row][col]) {
      return false;
    }
  }

  return true;
}

function partTwo() {
  visibleTrees = 0;

  var scenicScore = [];

  for (var row = 0; row < trees.length; row++) {
    for (var col = 0; col < trees[row].length; col++) {
      if (treeIsOnEdge(row, col)) {
        continue;
      }

      scenicScore.push(calculateScenicScore(row, col));
    }
  }

  // find max
  let max = Math.max(...scenicScore);

  var partTwoDiv = document.createElement("div");
  partTwoDiv.innerHTML = max.toString();
  document.getElementById("part2").appendChild(partTwoDiv);
}

function calculateScenicScore(row, col) {
  var top = 0;
  var left = 0;
  var right = 0;
  var down = 0;

  // top
  for (var i = row - 1; i >= 0; i--) {
    top++;

    if (trees[i][col] >= trees[row][col]) {
      break;
    }
  }

  // left
  for (var i = col - 1; i >= 0; i--) {
    left++;
    if (trees[row][i] >= trees[row][col]) {
      break;
    }
  }

  // right
  for (var i = col + 1; i < trees[row].length; i++) {
    right++;
    if (trees[row][i] >= trees[row][col]) {
      break;
    }
  }

  // bottom
  for (var i = row + 1; i < trees.length; i++) {
    down++;
    if (trees[i][col] >= trees[row][col]) {
      break;
    }
  }

  console.table({
    rowcol: `${row}${col}`,
    left,
    top,
    right,
    down,
  });

  return top * left * right * down;
}

partOne();
partTwo();
