const matchRubric = {
    "A X": 4,
    "A Y": 8,
    "A Z": 3,
    "B X": 1,
    "B Y": 5,
    "B Z": 9,
    "C X": 7,
    "C Y": 2,
    "C Z": 6,
};

const modifiedMatchRubric = {
    "A X": 3,
    "A Y": 4,
    "A Z": 8,
    "B X": 1,
    "B Y": 5,
    "B Z": 9,
    "C X": 2,
    "C Y": 6,
    "C Z": 7,
};

let games = input.split("\n");

let partOneTotal = 0;
let partTwoTotal = 0;

for (let i = 0; i < games.length; i++) {
    partOneTotal += matchRubric[games[i]];
    partTwoTotal += modifiedMatchRubric[games[i]];
}

console.log(partOneTotal);
console.log(partTwoTotal);

let partOneDiv = document.createElement("div");
partOneDiv.innerHTML = `Part 1: ${partOneTotal}`;
document.body.appendChild(partOneDiv);

let partTwoDiv = document.createElement("div");
partTwoDiv.innerHTML = `Part 2: ${partTwoTotal}`;
document.body.appendChild(partTwoDiv);
