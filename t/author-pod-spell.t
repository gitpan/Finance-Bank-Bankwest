
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006007
use Test::Spelling 0.12;
use Pod::Wordlist;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
semver
Alex
Peters
lxp
lib
Finance
Bank
Bankwest
Error
NotLoggedIn
UnknownReason
Parser
Accounts
BadCredentials
TransactionSearch
Login
ServiceMessage
Transaction
TransactionExport
ExportFailed
Parsers
Timeout
WithResponse
SessionFromLogin
Account
Logout
BadResponse
Session
SubsequentLogin
