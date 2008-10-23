use inc::Module::Install;
use 5.008001;
name 'String-Diff';
all_from 'lib/String/Diff.pm';

requires 'Algorithm::Diff';

build_requires 'Test::More';
build_requires 'YAML';

use_test_base;
auto_include;
WriteAll;
