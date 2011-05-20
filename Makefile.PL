use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'MooseX::Types::Digest',
    VERSION_FROM  => 'lib/MooseX/Types/Digest.pm',
    ABSTRACT      => 'Digest datatypes for Moose',
    AUTHOR        => 'Michael Langner',
    LICENSE       => 'perl',
    PREREQ_PM     => {
        'MooseX::Types'                => '0.15',
        'Moose'                        => '0.82'
    }
);


