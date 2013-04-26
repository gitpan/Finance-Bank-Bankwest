package Finance::Bank::Bankwest::Transaction;
{
  $Finance::Bank::Bankwest::Transaction::VERSION = '1.0.0';
}
# ABSTRACT: representation of an account transaction


## no critic (RequireUseStrict, RequireUseWarnings, RequireEndWithOne)
use MooseX::Declare;
class Finance::Bank::Bankwest::Transaction {

    use MooseX::StrictConstructor;

    for (
        [ date          => 'Str'        ],
        [ narrative     => 'Str'        ],
        [ cheque_num    => 'Maybe[Str]' ],
        [ amount        => 'Maybe[Num]' ],
        [ type          => 'Str'        ],
    ) {
        has $_->[0] => ( isa => $_->[1], is => 'ro', required => 1 );
    }
}

__END__

=pod

=for :stopwords Alex Peters authorisation BPAY CHQ DAU DEP DFD DRI EFTPOS ENQ NAR TFC TFD
WDC WDI WDL

=head1 NAME

Finance::Bank::Bankwest::Transaction - representation of an account transaction

=head1 VERSION

This module is part of distribution Finance-Bank-Bankwest v1.0.0.

This distribution's version numbering follows the conventions defined at L<semver.org|http://semver.org/>.

=head1 SYNOPSIS

    $transaction->date;         # '31/12/2012'
    $transaction->narrative;    # '1 BANK CHEQUE FEE - BWA CUSTOMER'
    $transaction->cheque_num;   # undef
    $transaction->amount;       # -10.00
    $transaction->type;         # 'FEE'

=head1 DESCRIPTION

Instances of this module are returned by
L<Finance::Bank::Bankwest::Session/transactions>.

=head1 ATTRIBUTES

=head2 date

A string in C<DD/MM/YYYY> format representing the date of the
transaction.

=head2 narrative

A description of the transaction.

=head2 cheque_num

The cheque number for cheque withdrawals, or C<undef> if not applicable.

=head2 amount

A positive or negative value representing the credit or debit value of
the transaction respectively, or C<undef> if not applicable (such as
for fee notices or declined transactions).

=head2 type

The transaction "type."  May be one of the following values (or even
something else):

=over 6

=item CHQ

Debit via cheque.

=item DAU

Authorisation only.

=item DEP

Non-salary deposit or EFTPOS refund.

=item DFD

Deposit via a Fast Deposit box.

=item DID

Dishonoured debit, e.g. bounced cheque.

=item DRI

Debit interest.

=item ENQ

Declined transaction.

=item FEE

Bank fee, e.g. bank cheque fee.

=item NAR

Information-only transaction without a credit or debit, such as
notification of an ATM fee being paid by Bankwest or a breakdown of
fees included in another transaction (such as foreign currency
conversion).

=item PAY

Salary deposit.

=item TFC

Internal credit from another Bankwest account.

=item TFD

BPAY or internal debit to another Bankwest account.

=item WDC

Credit withdrawal.

=item WDI

Credit withdrawal by an international merchant.

=item WDL

ATM, EFTPOS or "pay anyone" withdrawal, or direct debit.

=back

=head1 SEE ALSO



=over 4

=item *

L<Finance::Bank::Bankwest::Session/transactions>

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
