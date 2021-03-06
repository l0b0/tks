# Copyright (C) 2009 Catalyst IT Ltd (http://www.catalyst.net.nz)
#
# This file is distributed under the same terms as tks itself.
package TKS::Entry;

use Moose;

has 'date'         => ( is => 'rw', isa => 'Str', required => 1 );
has 'request'      => ( is => 'rw', isa => 'Str', required => 1 );
has 'time'         => ( is => 'rw', isa => 'Num', required => 1 );
has 'needs_review' => ( is => 'rw', isa => 'Int', required => 1, default => 0 );
has 'comment'      => ( is => 'rw', isa => 'Str', required => 1 );

sub clone {
    my ($self) = @_;

    return bless { %{$self} }, ref $self;
};

sub invert_clone {
    my ($self) = @_;

    $self = bless { %{$self} }, ref $self;
    $self->{time} = -$self->{time};

    return $self;
};

1;
