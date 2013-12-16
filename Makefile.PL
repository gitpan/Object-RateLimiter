
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A flood control (rate limiter) object",
  "AUTHOR" => "Jon Portnoy <avenj\@cobaltirc.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Object-RateLimiter",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Object::RateLimiter",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::Method::Modifiers" => 0,
    "List::Objects::WithUtils" => 2,
    "Object::ArrayType::New" => "0.002001",
    "Scalar::Util" => 0,
    "Time::HiRes" => 0,
    "namespace::clean" => 0,
    "overload" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.88"
  },
  "VERSION" => "1.001002",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Class::Method::Modifiers" => 0,
  "List::Objects::WithUtils" => 2,
  "Object::ArrayType::New" => "0.002001",
  "Scalar::Util" => 0,
  "Test::More" => "0.88",
  "Time::HiRes" => 0,
  "namespace::clean" => 0,
  "overload" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



