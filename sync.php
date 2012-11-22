<?php

if (in_array($_SERVER['REMOTE_ADDR'], array('207.97.227.253', '50.57.128.197', '108.171.174.178'))) {
	system(__DIR__ . '/makedoc.sh');
} else {
	die('WAHAHA');
}
