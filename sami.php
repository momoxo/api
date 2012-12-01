<?php

use Sami\Sami;
use Symfony\Component\Finder\Finder;

$iterator = Finder::create()
	->files()
	->name("*.php")
	->exclude("Resources")
	->exclude("Tests")
	->in(__DIR__ . "/_momoxo/html")
	->in(__DIR__ . "/_momoxo/xoops_trust_path/modules/XCore")
;

return new Sami($iterator, array(
	"title"                => "Momoxo API",
	"build_dir"            => __DIR__ . "/tmp",
	"cache_dir"            => __DIR__ . "/cache",
	"default_opened_level" => 2,
));
