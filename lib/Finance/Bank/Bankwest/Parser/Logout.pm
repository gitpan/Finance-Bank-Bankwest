package Finance::Bank::Bankwest::Parser::Logout;
{
  $Finance::Bank::Bankwest::Parser::Logout::VERSION = '1.0.1';
}
# ABSTRACT: Online Banking logout web page parser


## no critic (RequireUseStrict, RequireUseWarnings, RequireEndWithOne)
use MooseX::Declare;
class Finance::Bank::Bankwest::Parser::Logout
    extends Finance::Bank::Bankwest::Parser
{
    use Web::Scraper qw{ scraper process };

    my $token = 'You have successfully logged out from your session';
    my $scraper = scraper {
        process '#contentColumn', 'text' => 'TEXT';
    };

    method TEST {
        my $scrape = $scraper->scrape($self->response);
        $self->bad_response
            if not defined $scrape->{'text'}
                or index($scrape->{'text'}, $token) < 0;
    }
}

__END__

=pod

=for :stopwords Alex Peters

=head1 NAME

Finance::Bank::Bankwest::Parser::Logout - Online Banking logout web page parser

=head1 VERSION

This module is part of distribution Finance-Bank-Bankwest v1.0.1.

This distribution's version numbering follows the conventions defined at L<semver.org|http://semver.org/>.

=head1 DESCRIPTION

This module holds the logic for identifying an L<HTTP::Response> object
as a Bankwest Online Banking logout web page.

=head1 SEE ALSO



=over 4

=item *

L<Finance::Bank::Bankwest::Parser>

=item *

L<Finance::Bank::Bankwest::Session/logout>

=back

=head1 AUTHOR

Alex Peters <lxp@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Alex Peters.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

The full text of the license can be found in the
'LICENSE' file included with this distribution.

=cut
