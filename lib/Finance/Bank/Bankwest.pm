package Finance::Bank::Bankwest;
{
  $Finance::Bank::Bankwest::VERSION = '1.0.0';
}
# ABSTRACT: check Bankwest accounts from Perl


use strict;
use warnings;

use Finance::Bank::Bankwest::SessionFromLogin ();


sub login {
    my ($class, @args) = @_;
    return Finance::Bank::Bankwest::SessionFromLogin->new(@args)->session;
}

1;

__END__

=pod

=for :stopwords Alex Peters cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee
diff irc mailto metadata placeholders metacpan Bankwest's login

=head1 NAME

Finance::Bank::Bankwest - check Bankwest accounts from Perl

=head1 VERSION

This module is part of distribution Finance-Bank-Bankwest v1.0.0.

This distribution's version numbering follows the conventions defined at L<semver.org|http://semver.org/>.

=head1 SYNOPSIS

    my $session = Finance::Bank::Bankwest->login(
        pan         => 12345678,
        access_code => 'LetMeIn123',
    );
    for my $acct ($session->accounts) {
        printf(
            "Account %s has available balance %s\n",
            $acct->number,
            $acct->available_balance,
        );
        my @txns = $session->transactions(
            account     => $acct->number,
            from_date   => '31/12/2012',
        );
        for my $txn (@txns) {
            printf(
                "> Transaction: %s (%s)\n",
                $txn->narrative,
                $txn->amount,
            );
        }
    }
    $session->logout;

=head1 DESCRIPTION

This distribution provides the ability to log into Bankwest's Online
Banking service using a Personal Access Number (PAN) and access code,
then retrieve information on all accounts associated with that PAN and
their transactions.

Consult the documentation for L<Finance::Bank::Bankwest::Session> for
further details on what can be achieved within a session.

=head1 WARNING

The code contained in this distribution is B<not endorsed by Bankwest>
as an official means of accessing banking data.  It is entirely written
and provided by a third party, and B<Bankwest will not provide support>
for this distribution if approached for it.

You should audit the source code of this distribution in order to
satisfy yourself that your banking details are only being used in a
legitimate manner.

Consider also consulting the Bankwest Online Banking Conditions of Use
before using this distribution.

=head1 METHODS

=head2 login

    $session = Finance::Bank::Bankwest->login(
        pan             => 12345678,        # required
        access_code     => 'LetMeIn123',    # required
    );

Log into Bankwest Online Banking with the supplied Personal Access
Number (PAN) and access code.  Returns a
L<Finance::Bank::Bankwest::Session> object on success.

Refer to L<Finance::Bank::Bankwest::SessionFromLogin/session> for
specific details on possible exceptions that may be thrown in cases of
failure.

=head1 SEE ALSO



=over 4

=item *

L<Finance::Bank::Bankwest::Session>

=item *

L<Finance::Bank::Bankwest::SessionFromLogin/session>

=back

=head1 SUPPORT

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

MetaCPAN

A modern, open-source CPAN search engine, useful to view POD in HTML format.

L<http://metacpan.org/release/Finance-Bank-Bankwest>

=item *

RT: CPAN's Bug Tracker

The RT ( Request Tracker ) website is the default bug/issue tracking system for CPAN.

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Finance-Bank-Bankwest>

=item *

CPAN Ratings

The CPAN Ratings is a website that allows community ratings and reviews of Perl modules.

L<http://cpanratings.perl.org/d/Finance-Bank-Bankwest>

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-finance-bank-bankwest at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Finance-Bank-Bankwest>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code

The source code for this distribution is available
online in a L<Git|http://git-scm.com/> repository.
Please feel welcome to contribute patches.

L<https://github.com/lx/perl5-Finance-Bank-Bankwest>

  git clone git://github.com/lx/perl5-Finance-Bank-Bankwest

=head1 AUTHOR

Alex Peters <lxp@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Alex Peters.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

The full text of the license can be found in the
'LICENSE' file included with this distribution.

=cut
