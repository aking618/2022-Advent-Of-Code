let split = input.split("\n\n");

let sums = [];
let max = (sum = 0);

for (let i = 0; i < split.length; i++) {
  let lines = split[i].split("\n");
  sum = 0;

  for (let j = 0; j < lines.length; j++) {
    sum += parseInt(lines[j]);
  }

  sums.push(sum);
}

let firstMax = Math.max(...sums);
sums = sums.filter((e) => e !== firstMax);

console.log(firstMax);

let secondMax = Math.max(...sums);
sums = sums.filter((e) => e !== secondMax);

let thirdMax = Math.max(...sums);
sums = sums.filter((e) => e !== thirdMax);

console.log(firstMax + secondMax + thirdMax);

let div = document.createElement("div");

div.innerHTML = `Answer 1: ${firstMax}`;
document.getElementById("main").appendChild(div);

div.innerHTML = `Answer 2: ${firstMax + secondMax + thirdMax}`;
document.getElementById("main").appendChild(div);
