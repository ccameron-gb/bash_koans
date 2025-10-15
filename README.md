# Bash Koans

So I set up to learn Bash better. Normally I try to learn by doing koans, but I could not find any, so I decided to learn by building koans for Bash.

## DISCLAIMER

I am no Bash expert. This is a project strictly for learning and fun. It's also not complete, I'm doing this when I have a moment.

If you are an expert, PLEASE contribute and make it even better!

### How to

Just clone this repo and run:

    ./meditate

### License

License is MIT. See LICENSE for details.

### Shreyas About Conditional Tips

While working on the `00_about_conditionals.sh` koan, I learned that Bash conditionals require careful attention to syntax and quoting.  
Here are a few lessons I took away from the process:

- Always include spaces around `[` and `]`.  
  Example: `[ $a = $b ]` is correct, while `[$a=$b]` will fail.
- Quote variable references to prevent unexpected behavior when variables are empty.  
  Example: `[ "$var" = "text" ]`
- Use either `==` or `=` for string comparisons. Both work in test brackets, though `==` can improve readability.
- Use `-d` to check for directories and `-f` to check for files.  
  These flags are useful when verifying file paths.
- The order of conditions in `if`, `elif`, and `else` statements matters. Bash evaluates from top to bottom and runs the first matching block.

Overall, these exercises helped reinforce the importance of precision in Bash syntax and how subtle details like spacing or quoting can affect program behavior.
