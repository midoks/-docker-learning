<?php

function p() {
    for ($i = 0; $i < 3; $i++) {
        test_sleep();
    }
}

function test_sleep() {
    sleep(1);
}

echo "sleep";

p();

echo "test slow log";

?>
