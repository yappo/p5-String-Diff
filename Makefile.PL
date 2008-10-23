use inc::Module::Install;
name 'String-Diff';
all_from 'lib/String/Diff.pm';

requires $_ for (qw/ Algorithm::Diff /);

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
