#!/usr/bin/env raku

use lib 'lib';
use TidalCycles;

my $pattern = '
bd sd:1 1.1 ~ , bd . [[[[[
    { bd sd <1 2 (a b c)> } * 4
    ] / 4
    ] ! 2
    ] _
    ] @ 3
] ?
'.lines.map(*.chomp).join;

say parse $pattern;

# from here: https://tidalcycles.org/Mini_notation_syntax
#
#  [ ]  Create a pattern grouping: "[bd sd] hh"
#   .   Shorthand for pattern grouping: "bd sd . hh hh hh"
#   ,   Play multiple patterns at the same time: "[bd sd, hh hh hh]"
#  < >	Alternate between patterns: "bd <sd hh cp>"
#  { }	Polymetric sequences: "{bd bd bd bd, cp cp hh}"
#  { }% Polymetric sequence subdivision: "{bd cp hh}%8"
#  ( )	Euclidean sequences: "bd(3,8)"
#   * 	Repeat a pattern: "bd*2 sd"
#   /   Slow down a pattern: "bd/2"
#   !   Replicate a pattern: "bd!3 sd"
#   _   Elongate a pattern: "bd _ _ ~ sd _"
#   @   Elongate a pattern: "superpiano@3 superpiano"
#   ?   Randomly remove events from pattern: "bd? sd"
#   :   Selecting samples: "bd:3"

# these seem to operate on the pattern to the left
# * / ! _ @ ?

# Questions
# - is . specific to groups?
# - does , do something inside a <>?
# - can () take patterns? should it? can it take more than 3 arguments?
# - does ? actually remove an item or just silence it?
# - is % part of {}%? an op that only works after %? does it only take an int after?
# - what is the difference between * (repeat) and ! (replicate)?
# - <a b c . d e f> is <[a b c] [d e f]> ?
# - does "a b . c d . e f" work?
# - what type of argument do * / ! take? int only?
# - does "1 2 3 * 4" work? "[1 2 3] * 4" ? how about "[1 2 3] * 4 @ 2" ? or
#   "[[1 2 3] * 4] @ 2" ?
# - what happens if we have two . or , in a row?
# - are empty patterns allowed?
# - what is the operator precedence in Tidal? does . bind tighter than , ?
#


