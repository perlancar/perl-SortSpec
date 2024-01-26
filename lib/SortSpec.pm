## no critic: TestingAndDebugging::RequireUseStrict
package SortSpec;

# AUTHORITY
# DATE
# DIST
# VERSION

1;
# ABSTRACT: Specification of sort specification

=head1 SPECIFICATION VERSION

0.1


=head1 SYNOPSIS

Basic use with L<Sort::BySpec>:

 use Sort::BySpec qw(sort_by_spec);
 use SortSpec::Perl::CPAN::ChangesGroup::PERLANCAR; # sort specification of changes group, a la PERLANCAR

 my $sorter = sort_by_spec(spec => SortSpec::Perl::CPAN::ChangesGroup::PERLANCAR::get_spec());
 my @sorted = $sorter->(...);

Specifying arguments:

 use Sort::BySpec qw(sort_by_spec);
 use SortExample::Foo;
 my $sorter = sort_by_spec(spec => SortSpec::Foo::get_spec(arg1=>..., ));
 my @sorted = sorter->(...);

Specifying spec on the command-line (for other CLI's):

 % sort-by-spec -m Perl::CPAN::ChangesGroup::PERLANCAR ...
 % sort-by-spec -m Foo=arg1,val,arg2,val ...


=head1 DESCRIPTION

B<EXPERIMENTAL.>

C<SortSpec> is a namespace for modules that declare sort specifications. Sort
specifications are used with L<Sort::BySpec>.

=head2 Writing a SortSpec module

 package SortSpec::Foo;

 # required. must return a hash (DefHash)
 sub meta {
     return +{
         v => 1,
         summary => 'Sort specification related to Foo',
         args => {
             arg1 => {
                 schema => 'str*', # Sah schema
                 req => 1,
             },
         },
     };
 }

 sub get_spec {
     my %args = @_;
     ...
     return [...];
 }

 1;


=head2 Namespace organization

TODO.


=head2 SEE ALSO

=head2 Base specifications

L<DefHash>

L<Sah>

=head2 Related specifications

L<SortExample>

=head2 Related modules

L<Sort::BySpec>
