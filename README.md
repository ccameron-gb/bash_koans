# Bash Koans Exercise Details
Arithmetic:
- echo command will copy all contents of the exact string, including spaces.
Conditionals:
- Consider using $x when determining the value or condition it is.
- The quotations don't matter for conditions and variables.
- Can consider multiple cases on checking the value of local variable test.
- Can consider using -_ to check if something we need exists (files, directories).
About pipe:
- To substitute or pipeline old variables with new ones, we can use s/old/new.
Redirection:
- Consider using > to direct some output or result to a file or text.
- Consider using 2> to redirect standard errors to a file or text. 
About Quoting:
- The escape character \ in Bash is used to continue the next line part of code to the original. This skips the next line command and rather treats the remaining characters after the character part of the same line.
- We can use bash scripts to include ASCII characters, other characters generated like smiley faces, and other scripts from other programs like \n and \t.
- The escape character will result to delete itself from the result and paste the next character after the \, resulting in "escaping" the line.

  
## Tips and Gotchas
- Ordering matters for redirecting stdout or stderr with its file descriptors.
- We can create locally translated specific messages by telling the bash to find the translation if we contain it. If it doesn't, then it will result in the original text. 

AMAL's:

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


## Lessons Learned from Bash Koans

### 6. Return Value Koan
- **Understanding `$?`:** Every command in Bash sets an exit status stored in `$?`.  
  - `0` indicates success.  
  - Non-zero indicates failure (commonly `1`).  
- **Examples:**
  - `cd /nonexistent` → exit status `1` (failure).  
  - `ls ~/` → exit status `0` (success).  
- **Key takeaway:** Always check `$?` to determine if a command succeeded or failed, especially in scripts that depend on previous commands.

### 7. Variables Koan
- **Local vs Global Variables:**
  - `local` variables are only visible within the function they are defined in.  
  - Variables defined without `local` are global and accessible anywhere.  
- **Variable Expansion:**
  - Variables expand inside double quotes (`"foo $var"`) and with `${var}` syntax (`this_is_${var}_yay`).  
- **Unsetting Variables:**
  - `unset var` removes a variable value so it no longer exists.  
- **Exporting Variables:**
  - Only exported variables (`export VAR=value`) are visible to processes.  
  - Local or nonexported variables remain invisible to processes.  
- **Key takeaway:** Understanding scoping and exporting is crucial for writing reliable Bash scripts.