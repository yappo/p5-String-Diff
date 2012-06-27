use strict;
use warnings;

use Test::More;

eval q{ use HTML::Entities };
plan skip_all => "HTML::Entities is not installed." if $@;

use String::Diff;

my @diff = String::Diff::diff(
    'this is <b>Perl</b>',
    'this is <b><BIG>R</BIG>uby</b>',
    remove_open  => '<del>',
    remove_close => '</del>',
    append_open  => '<ins>',
    append_close => '</ins>',
    escape       => sub { encode_entities($_[0]) },
);
is($diff[0], 'this is &lt;b&gt;<del>Perl</del>&lt;/b&gt;');
is($diff[1], 'this is &lt;b&gt;<ins>&lt;BIG&gt;R&lt;/BIG&gt;uby</ins>&lt;/b&gt;');

my $diff = String::Diff::diff_merge(
    'this is <b>Perl</b>',
    'this is <b><BIG>R</BIG>uby</b>',
    remove_open  => '<del>',
    remove_close => '</del>',
    append_open  => '<ins>',
    append_close => '</ins>',
    escape       => sub { encode_entities($_[0]) },
);
is($diff, 'this is &lt;b&gt;<del>Perl</del><ins>&lt;BIG&gt;R&lt;/BIG&gt;uby</ins>&lt;/b&gt;');


done_testing;
