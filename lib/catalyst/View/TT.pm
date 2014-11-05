package catalyst::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
    CATALYST_VAR => 'c',
    ENCODING     => 'utf-8',
);

=head1 NAME

catalyst::View::TT - TT View for catalyst

=head1 DESCRIPTION

TT View for catalyst.

=head1 SEE ALSO

L<catalyst>

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
