#!/usr/bin/env raku

my $todo-file = "todo.txt";
$todo-file.IO.spurt: "" unless $todo-file.IO.e;
my @todos = $todo-file.IO.lines;

#| Add an entry in the todo list (if duplicate, help is returned)
multi sub MAIN('add', Str $todo where { !so @todos.first: /:i $todo/ }) {
	$todo-file.IO.spurt: "TODO\t" ~ $todo ~ "\n", :append; }

#| Delete an entry from the todo list (if item does not exist, help is returned)
multi sub MAIN( 'delete', Str $todo where { so @todos.first: /:i $todo/ }) {
	@todos.splice(@todos.first(/:i $todo/, :k), 1);
	$todo-file.IO.spurt: @todos.join("\n"); }

#| Toggle a TODO to a DONE status
multi sub MAIN( 'done', Str $todo where { so @todos.first: /:i $todo/ }) {
	s/^TODO/DONE/ for @todos.grep(/:i $todo/);
	$todo-file.IO.spurt: @todos.join("\n"); }

#| Show all entries
multi sub MAIN( 'list' ) { say @todos.join("\n") }
