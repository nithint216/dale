#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/namespace-fns.dt -o namespace-fns  `;
is(@res, 0, 'No compilation errors');

@res = `./namespace-fns`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ 
    '1', '2', '1', '2',
    100, 200, 100, 200,
    100, '"', '"', 100
], 'Got expected results');

`rm namespace-fns`;

1;
