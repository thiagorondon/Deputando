package Deputando::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER            => 'wrapper.tt',
    render_die         => 1,
);

=head1 NAME

Deputando::View::TT - TT View for Deputando

=head1 DESCRIPTION

TT View for Deputando.

=head1 SEE ALSO

L<Deputando>

=head1 AUTHOR

Thiago Rondon

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
