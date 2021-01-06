#!/usr/env/bin raku

my $todo-file = "todo.txt";
$todo-file.IO.spurt: "" unless $todo-file.IO.e;
my @todos = $todo-file.IO.lines;

#| Add a todo to the list (if duplicate, fails)
multi sub MAIN ( 'add', 
	Str $todo where {!so @todos.first(/$todo/)}
) {
	$todo-file.IO.spurt: "TODO\t" ~ $todo ~ "\n", :append;
}
#| Delete a todo if exists, fails otherwise
multi sub MAIN( 'delete', 
	Str $todo where {so @todos.first(/$todo/)}
) {
	@todos.splice(@todos.first(/$todo/,:k), 1);
	$todo-file.IO.spurt: @todos.join("\n");
}
#| Toggle a todo between TODO/DONE state (if todo doesn't exist, fails)
multi sub MAIN( 'toggle', 
	Str $todo where {so @todos.first(/$todo/)}
) {
	.grep(/TODO/) ?? s/TODO/DONE/ !! s/DONE/TODO/ if .grep: /$todo/ for @todos;
	$todo-file.IO.spurt: @todos.join("\n");
}
#| Show all the todos
multi sub MAIN( 'show' ) { say @todos.join("\n")}
