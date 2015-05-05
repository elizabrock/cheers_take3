# cheers_take3
The fully-tested interactive version of cheers, for cohort huckleberry

## Specifications, for interactive version of cheers

Start the program by running `./cheers.rb`

The program should ask:

> Hello! What is your name?

The user types in their name, for example:

> Abby

The program outputs a cheer in the following format:

> Give me an... A

> Give me a... B

> Give me a... B

> Give me a... Y

> Abby’s just GRAND!

* If there was no input, ask again ("I'm sorry, what was your name again?") until valid input is provided
* Follow the proper grammatical for a and an. The rule is based on whether the spelling of a letter would begin with a vowel.
* Skip non-word characters when printing the cheer (e.g. "Give me a..." lines)
* Print the user's name out as it was originally input for the "just GRAND" line

After printing out the user's cheer, the program asks:

> Hey, Abby, what's your birthday? (mm/dd)

The user types in their birthdate

> 08/25

* If there was no input, asks again until valid input is provided
* If there was input that couldn't be parsed, the program tries again, but with the prompt:

> I couldn't understand that. Could you give that to me in mm/dd format?

The program then outputs the number of days until the user's birthday

> Awesome!  Your birthday is in 45 days! Happy Birthday in advance!
