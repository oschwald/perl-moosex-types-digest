package MooseX::Types::Digest;

use strict;
use warnings;

=head1 NAME

MooseX::Types::Digest - Digest datatypes for Moose

=cut

our $VERSION = '0.03';

=head1 SYNOPSIS

 package Foo;

 use Moose;
 use Moose::Util::TypeConstraints;
 use MooseX::Types::Digest qw( MD5 SHA1 SHA224 SHA256 SHA384 SHA512 );

 has md5  => ( is => 'rw', isa => MD5  );
 has sha1 => ( is => 'rw', isa => SHA1 );

Some string type constraints that match commonly used hexdigests. See L<Digest::MD5> or L<Digest::SHA1>.

=over

=item * MD5

A Str that looks like a valid MD5 hexdigest.

=item * SHA1

A Str that looks like a valid SHA1 hexdigest.

=back
=cut

use MooseX::Types -declare => [qw/ MD5 SHA1 SHA224 SHA256 SHA384 SHA512 /];
use Moose::Util::TypeConstraints;

subtype MD5,
  as "Str",
  where { (m/^[0-9a-f]{32}$/i) },
  message {"Must be 32 chars, and contain only [0-9a-f]" };

subtype SHA1,
  as "Str",
  where { (m/^[0-9a-f]{40}$/i) },
  message {"Must be 40 chars, and contain only [0-9a-f]" };

subtype SHA224,
  as "Str",
  where { (m/^[0-9a-f]{56}$/i) },
  message {"Must be 56 chars, and contain only [0-9a-f]" };

subtype SHA256,
  as "Str",
  where { (m/^[0-9a-f]{64}$/i) },
  message {"Must be 64 chars, and contain only [0-9a-f]" };

subtype SHA384,
  as "Str",
  where { (m/^[0-9a-f]{96}$/i) },
  message {"Must be 96 chars, and contain only [0-9a-f]" };

subtype SHA512,
  as "Str",
  where { (m/^[0-9a-f]{128}$/i) },
  message {"Must be 128 chars, and contain only [0-9a-f]" };

=head1 AUTHORS

 Michael Langner, C<< <mila at cpan.org> >>
 Stevan Little, C<< <stevan.little at iinteractive.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-moosex-types-digest at rt.cpan.org>,
or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-Types-Digest>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2009 Michael Langner, all rights reserved.

This program is free software; you can redistribute it and/or modify it under the
same terms as Perl itself.

=cut

1; # track-id: 3a59124cfcc7ce26274174c962094a20
