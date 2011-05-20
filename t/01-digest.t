use Test::More tests => 2*7;

{
    package Foo;

    use Moose;
    use Moose::Util::TypeConstraints;
    use MooseX::Types::Digest qw( MD5 SHA1 );
    
    has md5  => ( is => 'rw', isa => MD5  );
    has sha1 => ( is => 'rw', isa => SHA1 );
}

my %digest = (
    MD5 => {
        ok => [
            '3a59124cfcc7ce26274174c962094a20',
            '3A59124CFCC7CE26274174C962094A20'
        ],
        fail => [
            '3a59124cfcc7ce26274174c962094a2x',
            '3a59124cfcc7ce26274174c962094a2-',
            '3a59124cfcc7ce26274174c962094a20000'
        ]
    },
    SHA1 => {
        ok => [
            '1dff4026f8d3449cc83980e0e6d6cec075303ae3',
            '1DFF4026F8D3449CC83980E0E6D6CEC075303AE3'
        ],
        fail => [
            '1dff4026f8d3449cc83980e0e6d6cec075303aex',
            '1dff4026f8d3449cc83980e0e6d6cec075303ae-',
            '1dff4026f8d3449cc83980e0e6d6cec075303ae333'
        ]
    }
);

my $foo = Foo->new;

for my $type ( keys %digest ) {
    my $method = lc $type;
    for my $value ( @{ $digest{$type}->{ok} } ) {

        eval { $foo->$method($value) };

        ok( $@ eq "", "eval" );
        ok( $foo->$method, $value );

    }
    for my $value ( @{ $digest{$type}->{fail} } ) {

        eval { $foo->$method($value) };

        like( $@, qr/$method/, "fail test" );

    }
}
