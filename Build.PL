
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Catalyst' => '0',
    'Catalyst::Engine::HTTP' => '0',
    'Catalyst::Model::DBIC::Schema' => '0',
    'Catalyst::Request::REST::ForBrowsers' => '0',
    'Catalyst::View::JSON' => '0',
    'Catalyst::View::TT' => '0',
    'CatalystX::Controller::ExtJS::Direct' => '0',
    'CatalystX::Controller::ExtJS::Direct::API' => '0',
    'DBIx::Class' => '0',
    'DBIx::Class::ResultSet' => '0',
    'DBIx::Class::Schema' => '0',
    'File::Find' => '0',
    'File::Spec' => '0',
    'File::Temp' => '0',
    'FindBin' => '0',
    'Getopt::Long' => '0',
    'HTTP::Request::Common' => '0',
    'JSON' => '0',
    'JSON::XS' => '0',
    'Module::Build' => '0.3601',
    'Path::Class::File' => '0',
    'Pod::Usage' => '0',
    'Test::More' => '0.88',
    'Test::WWW::Mechanize::Catalyst' => '0'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Feature-rich REST controller for use with ExtJS',
  'dist_author' => [
    'Moritz Onken <onken@netcubed.de>'
  ],
  'dist_name' => 'CatalystX-ExtJS-REST',
  'dist_version' => '2.1.0',
  'license' => 'bsd',
  'module_name' => 'CatalystX::ExtJS::REST',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Catalyst::Action' => '0',
    'Catalyst::Action::REST' => '0.88',
    'Catalyst::Action::RenderView' => '0',
    'Catalyst::Controller::REST' => '0',
    'Catalyst::Runtime' => '5.80024',
    'CatalystX::ExtJS::Direct' => '0',
    'Config::Any' => '0',
    'DBIx::Class' => '0.08127',
    'HTML::Entities' => '0',
    'HTML::FormFu' => '0.08',
    'HTML::FormFu::ExtJS' => '0.076',
    'HTML::FormFu::Model::DBIC' => '0.08',
    'JSON::Any' => '0',
    'JavaScript::Dumper' => '0.011',
    'Lingua::EN::Inflect' => '0',
    'Moose' => '1.21',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::MethodAttributes' => '0',
    'Path::Class' => '0',
    'Scalar::Util' => '0',
    'Try::Tiny' => '0'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
