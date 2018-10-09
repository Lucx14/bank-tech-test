# Progress update:

on the morning of the second day, i have a single class (Account) program with all the required functionality, a 100% test coverage using Gem SimpleCov, and am passing Rubocops code quality requirements (apart from one line length violation which i'm thinking about). Thought this morning are on how close i am to meeting the requirement specs.

* I have only used a single class and I think i could potentially separate the printing of the statement into its own class, or maybe make a parent class for the account called bank that would take on the responsibilty of .open_account and .print_statement. I also question if i should extract the creation and storage of the cashflow object into its own class. The reason maybe i'm haven't yet gone down that route is that the requirements seem to be very simple and i don't want to overcomplicate something that is meant to be a simple implementation just for the sake of it.

* I have set the statement to Put out to the console in the format requested. It is not the most readable format but it matches the requirement spec so i'm going to go with it. I have tested it and the only concern is should i be using Puts to the console.

* I have tried to write both feature tests and unit tests, using the user stories i wrote to guide the feature tests. My thoughts at the moment are that maybe because i have only one class the feature tests seem a bit pointless.

* My statement method involves a .each loop with a puts statement that i would like to make more readable if i can, will continue to look at how i can multi line that. Also because i use puts , im getting the statement output printing out inside my RSpec output which isnt very good visually.
