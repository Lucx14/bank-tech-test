# Progress update:

on the morning of the second day, i have a single class (Account) program with all the required functionality, a 100% test coverage using Gem SimpleCov, and am passing Rubocops code quality requirements (apart from one line length violation which i'm thinking about). Thought this morning are on how close i am to meeting the requirement specs.

* I have only used a single class and I think i could potentially separate the printing of the statement into its own class, or maybe make a parent class for the account called bank that would take on the responsibilty of .open_account and .print_statement. I also question if i should extract the creation and storage of the cashflow object into its own class. The reason maybe i'm haven't yet gone down that route is that the requirements seem to be very simple and i don't want to overcomplicate something that is meant to be a simple implementation just for the sake of it.

* I have set the statement to Put out to the console in the format requested. It is not the most readable format but it matches the requirement spec so i'm going to go with it. I have tested it and the only concern is should i be using Puts to the console.

* I have tried to write both feature tests and unit tests, using the user stories i wrote to guide the feature tests. My thoughts at the moment are that maybe because i have only one class the feature tests seem a bit pointless.

* My statement method involves a .each loop with a puts statement that i would like to make more readable if i can, will continue to look at how i can multi line that. Also because i use puts , im getting the statement output printing out inside my RSpec output which isnt very good visually.


# Post - coach review



```
To pass, you need fewer than 5 minors and no majors. Feedback below:

MAJORS:
- Feature tests: your feature tests aren't really testing the requirements, just that there are no errors
- Object model - you have one class with multiple responsibilities (business logic and presentation)

MINORS:
- Testing state not behaviour - expect(account.balance).to eq(0)

```

* will work on refactoring this morning based on feedback, will aim to resolve the minor test issue first then move on to better feature tests and lastly i will look at a class extraction to seperate responsibilities.


# Update

* Ive tried to extract the printer/formatting of the statement to its own class, i ended up with something that looked like it had only behaviour and no state and so i decided to use it as a module.
