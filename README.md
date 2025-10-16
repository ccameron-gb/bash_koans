# Bash Koans

### Piping in Bash

Function Name: "test_piping_output_to_another_program()"

local output=$(echo 'example' | sed -e "s/example/non-example/g")

Let's break this down:

What is $(...)?
This is going to be a command substitution in bash. Looking at the example below:

local output = $(echo 'example')

This means that the output "example" of echo will be assigned to the variable output.

What is "echo"?

"echo" writes the arguments it is given to the output.

E.g. echo 'example'

This would writes the word "example" to output using the echo command.

What is "sed -e"?

This component of the above command is going to serve as the stream editor. This would take components, applied the edit commands, and then it would write the result. In the above example example is replaced by nonexample using this component.

Let's put it all together:

When putting it together, this command allows the user to replace words with other words and output the replacement.

### Tips and Tricks

- The best tip that can be given in this is really spending the time to break down the various components of such a command. This will give a lot of insight into what is actually going on when such a command is run.
