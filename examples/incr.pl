#!/usr/bin/env perl
use strict; use warnings FATAL => 'all';

use Object::RateLimiter;

my $ctrl = Object::RateLimiter->new( events => 3, seconds => 5 );
my $x;
while (1) {
  if (my $delay = $ctrl->delay) {
    print "  ... delayed for $delay seconds ...\n";
    sleep 1
  } else {
    print ++$x, "\n"
  }
}
