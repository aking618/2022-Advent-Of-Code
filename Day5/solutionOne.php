<?php

include 'input.php';

for ($i = 0; $i < count($input); $i++) {
    $amount = $input[$i][0];
    $from = $input[$i][1] - 1;
    $to = $input[$i][2] - 1;

    for ($j = 0; $j < $amount; $j++) {
        $stacks[$to][] = array_pop($stacks[$from]);
    }
}

echo "Part 1: ";
foreach ($stacks as $stack) {
    echo implode(' ', $stack) . PHP_EOL;
}