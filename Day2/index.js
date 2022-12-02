const checkMatch = (move1, move2) => {
    let move1A = move1 === "A";
    let move1B = move1 === "B";
    let move1C = move1 === "C";

    let move2X = move2 === "X";
    let move2Y = move2 === "Y";
    let move2Z = move2 === "Z";

    if (move1A && move2X) {
        return 1 + 3;
    }

    if (move1A && move2Y) {
        return 2 + 6;
    }

    if (move1A && move2Z) {
        return 3 + 0;
    }

    if (move1B && move2X) {
        return 1 + 0;
    }

    if (move1B && move2Y) {
        return 2 + 3;
    }

    if (move1B && move2Z) {
        return 3 + 6;
    }

    if (move1C && move2X) {
        return 1 + 6;
    }

    if (move1C && move2Y) {
        return 2 + 0;
    }

    if (move1C && move2Z) {
        return 3 + 3;
    }
};

const checkModifiedMatch = (move1, move2) => {
    let move1A = move1 === "A";
    let move1B = move1 === "B";
    let move1C = move1 === "C";

    let lose = move2 === "X";
    let draw = move2 === "Y";
    let win = move2 === "Z";

    if (move1A && lose) {
        return 3 + 0;
    }

    if (move1A && draw) {
        return 1 + 3;
    }

    if (move1A && win) {
        return 2 + 6;
    }

    if (move1B && lose) {
        return 1 + 0;
    }

    if (move1B && draw) {
        return 2 + 3;
    }

    if (move1B && win) {
        return 3 + 6;
    }

    if (move1C && lose) {
        return 2 + 0;
    }

    if (move1C && draw) {
        return 3 + 3;
    }

    if (move1C && win) {
        return 1 + 6;
    }
};

let games = input.split("\n");

let partOneTotal = 0;
let partTwoTotal = 0;

for (let i = 0; i < games.length; i++) {
    let options = games[i].split(" ");

    partOneTotal += checkMatch(options[0], options[1]);
    partTwoTotal += checkModifiedMatch(options[0], options[1]);
}

console.log(partOneTotal);
console.log(partTwoTotal);

let partOneDiv = document.createElement("div");
partOneDiv.innerHTML = `Part 1: ${partOneTotal}`;
document.body.appendChild(partOneDiv);

let partTwoDiv = document.createElement("div");
partTwoDiv.innerHTML = `Part 2: ${partTwoTotal}`;
document.body.appendChild(partTwoDiv);
