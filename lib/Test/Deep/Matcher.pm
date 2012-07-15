package Test::Deep::Matcher;

use 5.008001;
use strict;
use warnings;
use parent 'Exporter';
use Test::Deep::Matcher::DataUtil;

our $VERSION = '0.01';
$VERSION = eval $VERSION;

our $DATA_UTIL_MATCHER = __PACKAGE__ . '::DataUtil';
our @DATA_UTIL_METHOD = qw(
    is_scalar_ref is_array_ref is_hash_ref is_code_ref is_glob_ref
    is_value is_string is_number is_integer
);

for my $name (@DATA_UTIL_METHOD) {
    no strict 'refs';
    *{$name} = sub { Test::Deep::Matcher::DataUtil->new($name, @_) };
}

our @EXPORT = (
    @DATA_UTIL_METHOD,
);

1;

=head1 NAME

Test::Deep::Matcher - A module that ...

=head1 SYNOPSIS

    use Test::Deep::Matcher;

=head1 DESCRIPTION

Test::Deep::Matcher is

=head1 METHODS

=head1 AUTHOR

NAKAGAWA Masaki E<lt>masaki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
