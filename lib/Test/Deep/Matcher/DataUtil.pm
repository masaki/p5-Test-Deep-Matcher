package Test::Deep::Matcher::DataUtil;

use strict;
use warnings;
use Test::Deep::Cmp;
use Data::Util ();

sub init {
    my $self = shift;
    my ($name, @args) = @_;

    $self->{name}    = $name;
    $self->{matcher} = Data::Util->can($name);
    $self->{val}     = \@args;
}

sub descend {
    my ($self, $got) = @_;
    return $self->{matcher}->($got);
}

sub diag_message {
    my ($self, $got) = @_;
    return "Checking $got " . join(' ', split /_/, $self->{name});
}

sub renderGot {
    my ($self, $val) = @_;

    if ($self->{name} =~ /_ref/) {
        return ref($val) || '(NONREF)';
    }
}

sub renderExp {
    my ($self, $val) = @_;

    if ($self->{name} =~ /is_(.+)_ref/) {
        return uc($1);
    }
}

1;

__END__
