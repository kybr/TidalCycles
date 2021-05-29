unit module TidalCycles;

use Grammar::Tracer;

grammar Tidal {

  token sound { \w+ [ ':' \w+ ]? }
  token rational { \d+ '.' \d+ }
  token rest { '~' }
  token stack { ',' }
  token splyt { '.' }
  rule group { '[' <pattern>+ ']' }
  rule polymetric { '{' <pattern>+ '}' }
  rule subdivision { '{' <pattern>+ '}' '%' \d+ }
  rule alternation { '<' <pattern>+ '>' }
  rule euclidean { '(' <pattern>+ ')' }

  # these operate on the pattern to the left
  rule repeat { '*' \d+ }
  rule slow { '/' \d+ }
  rule replicate { '!' \d+ }
  rule extend { '_' }
  rule elongate { '@' \d+ }
  rule degrade { '?' }

  rule pattern {
    [
      | <sound>
      | <rational>
      | <rest>
      | <stack>
      | <splyt>
      | <group>
      | <polymetric>
      | <subdivision>
      | <alternation>
      | <euclidean>
    ]
    [
      | <repeat>
      | <slow>
      | <replicate>
      | <extend>
      | <elongate>
      | <degrade>
    ]?
  }

  rule TOP {
    <pattern>+
  }
}

sub parse(Str $pattern) is export {
  Tidal.parse($pattern)
}
