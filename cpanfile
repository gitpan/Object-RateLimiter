requires "List::Objects::WithUtils" => "2";
requires "Object::ArrayType::New"   => "0.002";
requires "namespace::clean"         => "0";
requires "Class::Method::Modifiers" => "0";

on test => sub {
  requires "Test::More" => "0.88";
};
