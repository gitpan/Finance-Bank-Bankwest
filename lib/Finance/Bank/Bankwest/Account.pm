package Finance::Bank::Bankwest::Account;
{
  $Finance::Bank::Bankwest::Account::VERSION = '1.1.0';
}
# ABSTRACT: representation of a Bankwest account


## no critic (RequireUseStrict, RequireUseWarnings, RequireEndWithOne)
use MooseX::Declare;
class Finance::Bank::Bankwest::Account {

    use MooseX::StrictConstructor;

    for (
        [ name              => 'Str' ],
        [ number            => 'Str' ],
        [ balance           => 'Num' ],
        [ credit_limit      => 'Num' ],
        [ uncleared_funds   => 'Num' ],
        [ available_balance => 'Num' ],
    ) {
        has $_->[0] => ( isa => $_->[1], is => 'ro', required => 1 );
    }
}

__END__

=pod

=for :stopwords Alex Peters unfinalised

=head1 NAME

Finance::Bank::Bankwest::Account - representation of a Bankwest account

=head1 VERSION

This module is part of distribution Finance-Bank-Bankwest v1.1.0.

This distribution's version numbering follows the conventions defined at L<semver.org|http://semver.org/>.

=head1 SYNOPSIS

    $account->name;                 # 'My Zero Transaction'
    $account->number;               # '303-111 0012345'
    $account->balance;              # 4224.35
    $account->credit_limit;         # 100.00
    $account->uncleared_funds;      # 0.00
    $account->available_balance;    # 4207.66

=head1 DESCRIPTION

Instances of this module are returned by
L<Finance::Bank::Bankwest::Session/accounts>.

=head1 ATTRIBUTES

=head2 name

The "nickname" for the account as set in the Bankwest Online Banking
interface.

=head2 number

The full account number of the account in C<BBB-BBB AAAAAAA> format,
where C<B> is a BSB digit and C<A> is an account digit.

=head2 balance

The current balance of the account in dollars, not including
unfinalised debits.

=head2 credit_limit

The account's credit limit in dollars.

=head2 uncleared_funds

The total of all unfinalised deposits in dollars.

=head2 available_balance

The account's available balance in dollars, including unfinalised
debits and the credit limit.

=head1 SEE ALSO



=over 4

=item *

L<Finance::Bank::Bankwest::Session/accounts>

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