package Template::Plugin::Datum;
$VERSION = 0.01;

use strict;
use base 'Template::Plugin';

sub new {
    my ($self, $context) = @_;

    $context->define_filter('datum', \&datum, '');

    return $self;
}

sub datum {
    my $text = shift || '';

    # split on '-' or '.'
    my @date = split(/[-.]/, $text);

    # wrong?
    return '' unless (scalar @date == 3);

    return join('.', reverse @date);
}


1;
__END__

=head1 NAME

Template::Plugin::Datum - TT2 plugin that converts international
date format to German date format

=head1 SYNOPSIS

  [% USE Datum %]

  von: [% von | datum %]
  bis: [% '2003-12-31' | datum %]

=head1 DESCRIPTION

This plugin converts international date format (year-month-day) to
German date format (day.month.year).

=head1 NOTE

It does not check the date if it is correct!

MySQL returns international date format by default.

=head1 AUTHOR

Uwe Voelker E<lt>uwe.voelker@gmx.deE<gt>

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 SEE ALSO

L<Template>

=cut
