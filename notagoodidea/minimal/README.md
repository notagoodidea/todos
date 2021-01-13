# mininal by @notagoodidea
## Description
Just an implementation of the minimal requirements for the todos collection.

## Minimum fumctionalities

- [X] Add and delete a TODO item
- [X] Mark an item as DONE
- [X] Show the full list of entries

## Additional functionalities
None!

## How to use minimal
`minimal.raku` will create a `todo.txt` file where the script is run if one does not exist already.
The available actions are provided with the `raku minimal.raku --help` flag in the command line.
Enclose your TODO item with single quote if they contains a space or any character that may lead to shell interaction.

* `mininal.raku add 'My first Todo'` will append the TODO entry to the `todo.txt` file. [1]
* `minimal.raku delete 'My first Todo'` will delete the entry from the `todo.txt` file. [1]
* `minimal.raku done 'My first Todo'` will change the state of the entry from TODO to DONE in the `todo.txt` file. [1]
* `minimal.raku list` will show a list of all the entries in the `todo.txt` file.

[1] Entries are case-insensitive. If you try to delete or mark as done an entry that does not exist, the help will be printed.

## Dependencies
None!

## One last word?
Rabibocher
