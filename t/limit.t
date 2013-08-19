use Test::More;
use strict; use warnings FATAL => 'all';

BEGIN { use_ok( 'Object::RateLimiter' ) }

# new()
my $ctrl = new_ok 'Object::RateLimiter' => [
  events  => 3,
  seconds => 600,
];

# seconds() / events()
cmp_ok $ctrl->seconds, '==', 600, 'seconds() ok';
cmp_ok $ctrl->events,  '==', 3,   'events() ok';

# delay()
cmp_ok $ctrl->delay, '==', 0, 'delay 1 == 0 ok';
cmp_ok $ctrl->delay, '==', 0, 'delay 2 == 0 ok';
cmp_ok $ctrl->delay, '==', 0, 'delay 3 == 0 ok';
cmp_ok $ctrl->delay, '>', 0, 'delay 4 > 0 ok';

# clone() 
my $clone = $ctrl->clone( events => 10 );
cmp_ok $clone->delay, '==', 0, 'cloned with new events param ok';

# clone() + expire()
diag "This test will sleep for one second";
my $expire = $ctrl->clone( seconds => 0.5 );
sleep 1;
$expire->expire;
ok !$expire->_queue, 'expire() cleared queue';

# clear()
$ctrl->clear();
ok !$ctrl->_queue, 'clear() cleared queue';


done_testing;
