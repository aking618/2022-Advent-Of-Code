<?php

include 'input.php';

for ($i = 0; $i < count($input); $i++) {
    $amount = $input[$i][0];
    $from = $input[$i][1] - 1;
    $to = $input[$i][2] - 1;

    $flipper = [];

    for ($j = 0; $j < $amount; $j++) {

        $flipper[] = array_pop($stacks[$from]);
    }

    for ($j = 0; $j < $amount; $j++) {
        $stacks[$to][] = array_pop($flipper);
    }
}

echo "Part 2: ";
foreach ($stacks as $stack) {
    echo array_pop($stack);
}
