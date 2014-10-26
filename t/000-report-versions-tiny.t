use strict;
use warnings;
use Test::More 0.88;
# This is a relatively nice way to avoid Test::NoWarnings breaking our
# expectations by adding extra tests, without using no_plan.  It also helps
# avoid any other test module that feels introducing random tests, or even
# test plans, is a nice idea.
our $success = 0;
END { $success && done_testing; }

my $v = "\n";

eval {                     # no excuses!
    # report our Perl details
    my $want = "any version";
    my $pv = ($^V || $]);
    $v .= "perl: $pv (wanted $want) on $^O from $^X\n\n";
};
defined($@) and diag("$@");

# Now, our module version dependencies:
sub pmver {
    my ($module, $wanted) = @_;
    $wanted = " (want $wanted)";
    my $pmver;
    eval "require $module;";
    if ($@) {
        if ($@ =~ m/Can't locate .* in \@INC/) {
            $pmver = 'module not found.';
        } else {
            diag("${module}: $@");
            $pmver = 'died during require.';
        }
    } else {
        my $version;
        eval { $version = $module->VERSION; };
        if ($@) {
            diag("${module}: $@");
            $pmver = 'died during VERSION check.';
        } elsif (defined $version) {
            $pmver = "$version";
        } else {
            $pmver = '<undef>';
        }
    }

    # So, we should be good, right?
    return sprintf('%-45s => %-10s%-15s%s', $module, $pmver, $wanted, "\n");
}

eval { $v .= pmver('Carp','any version') };
eval { $v .= pmver('Catalyst','any version') };
eval { $v .= pmver('Catalyst::Action','any version') };
eval { $v .= pmver('Catalyst::Action::REST','0.88') };
eval { $v .= pmver('Catalyst::Action::RenderView','any version') };
eval { $v .= pmver('Catalyst::Controller::REST','any version') };
eval { $v .= pmver('Catalyst::Engine::HTTP','any version') };
eval { $v .= pmver('Catalyst::Model::DBIC::Schema','any version') };
eval { $v .= pmver('Catalyst::Request::REST::ForBrowsers','any version') };
eval { $v .= pmver('Catalyst::Runtime','5.80024') };
eval { $v .= pmver('Catalyst::View::JSON','any version') };
eval { $v .= pmver('Catalyst::View::TT','any version') };
eval { $v .= pmver('CatalystX::Controller::ExtJS::Direct','any version') };
eval { $v .= pmver('CatalystX::Controller::ExtJS::Direct::API','any version') };
eval { $v .= pmver('CatalystX::ExtJS::Direct','any version') };
eval { $v .= pmver('Config::Any','any version') };
eval { $v .= pmver('DBIx::Class','0.08127') };
eval { $v .= pmver('DBIx::Class::ResultSet','any version') };
eval { $v .= pmver('DBIx::Class::Schema','any version') };
eval { $v .= pmver('File::Find','any version') };
eval { $v .= pmver('File::Spec','any version') };
eval { $v .= pmver('File::Temp','any version') };
eval { $v .= pmver('FindBin','any version') };
eval { $v .= pmver('Getopt::Long','any version') };
eval { $v .= pmver('HTML::Entities','any version') };
eval { $v .= pmver('HTML::FormFu','0.08') };
eval { $v .= pmver('HTML::FormFu::ExtJS','0.076') };
eval { $v .= pmver('HTML::FormFu::Model::DBIC','0.08') };
eval { $v .= pmver('HTTP::Request::Common','any version') };
eval { $v .= pmver('JSON','any version') };
eval { $v .= pmver('JSON::Any','any version') };
eval { $v .= pmver('JSON::XS','any version') };
eval { $v .= pmver('JavaScript::Dumper','0.011') };
eval { $v .= pmver('Lingua::EN::Inflect','any version') };
eval { $v .= pmver('Module::Build','0.3601') };
eval { $v .= pmver('Moose','1.21') };
eval { $v .= pmver('Moose::Util::TypeConstraints','any version') };
eval { $v .= pmver('MooseX::MethodAttributes','any version') };
eval { $v .= pmver('Path::Class','any version') };
eval { $v .= pmver('Path::Class::File','any version') };
eval { $v .= pmver('Pod::Usage','any version') };
eval { $v .= pmver('Scalar::Util','any version') };
eval { $v .= pmver('Test::More','0.88') };
eval { $v .= pmver('Test::WWW::Mechanize::Catalyst','any version') };
eval { $v .= pmver('Try::Tiny','any version') };



# All done.
$v .= <<'EOT';

Thanks for using my code.  I hope it works for you.
If not, please try and include this output in the bug report.
That will help me reproduce the issue and solve you problem.

EOT

diag($v);
ok(1, "we really didn't test anything, just reporting data");
$success = 1;

# Work around another nasty module on CPAN. :/
no warnings 'once';
$Template::Test::NO_FLUSH = 1;
exit 0;
