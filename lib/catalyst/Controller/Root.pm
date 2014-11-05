package catalyst::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

catalyst::Controller::Root - Root Controller for catalyst

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    my $rs = $c->model('Root::Phonebook')->search({});   
    $c->stash->{pbs} = $rs;
    $c->detach($c->view("TT")); 
}

sub delete :Local {
     my ( $self, $c, $id ) = @ _;
     my $person = $c->model('Root::Phonebook')->find({id => $id});  
     $c->stash->{person} = $person;
     
     if($person){
	        $person->delete;
			$c->response->body( "Sucssec" );
	  }
	 else {
	        $c->response->status(404);
	        $c->response->body( "false" );
	  }
}

sub add :Local {
    my ( $self, $c ) = @ _;
	
	my $id = $c->req->body_params->{ id };
	my $name = $c->req->body_params->{ username };
	my $phone = $c->req->body_params->{ phoneNumber };
    my $date = $c->req->body_params->{ date };	
    my $note = $c->req->body_params->{ note };
     
    my $ph = $c->model('Root::Phonebook')->find_or_new({id => $id});
       $ph->name( $name );
       $ph->phone( $phone );
       $ph->birthday( $date );
       $ph->note( $note );
       $ph->update_or_insert;
       
    my $rs = $c->model('Root::Phonebook')->search({});
    my $rs_m = $rs->get_column('id');
    my $max_id = $rs_m->max;
       $c->response->body( "$max_id" );
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}


=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
