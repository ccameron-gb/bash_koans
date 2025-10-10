lesson_title "Quoting"
# https://www.gnu.org/software/bash/manual/bashref.html#Quoting

# Sensei advice: First argument of the assert should not be touched

# =============================================================================
# https://www.gnu.org/software/bash/manual/bashref.html#Escape-Character
test_escape_character() {

    # The escape character \ is simply treated like a continuation character> This skips newlines and treats the next line part of the same. 

    local EXAMPLE
    EXAMPLE=Use_no_escape_here_in_this_exam\
ple

    assertEqual $EXAMPLE Use_no_escape_here_in_this_example
}

# =============================================================================
# Sensei advice: Use single quotes in this function asserts
test_single_quotes() {
    assertEqual single\ quotes    'single quotes'           # The escape character will result to delete itself from the result and 
                                                            # paste the next character after the \ 
    # -------------------------------------------------------------------------
    assertEqual dollar_\$        'dollar_$'                 # The \ catches $ with it, so it will paste with the string.
    # -------------------------------------------------------------------------
    assertEqual Double_Quotes_\" 'Double_Quotes_"'          # " is treated as the next character so this will be captured.
    # -------------------------------------------------------------------------
    assertEqual backslash_\\     'backslash_\'              # Since you can only perform one escape character per line, the second backslash is treated as a character.
    # -------------------------------------------------------------------------
    assertEqual All_of_the_above_with_single_quotes\ \$\"\\ 'All_of_the_above_with_single_quotes $"\'
}

# =============================================================================
# Sensei advice: Use double quotes in this function asserts
test_double_quotes() {
    local D
    local EXAMPLE

    assertEqual between_double\ quotes    "between_double quotes"       # The backslash includes the space, since it considers the next character.
    # -------------------------------------------------------------------------
    D=nope
    assertEqual dollar_\$D        "dollar_\$D"                          # Since the backslash is before the dollar sign, we escape the variable and the answer will be as is.
    # -------------------------------------------------------------------------
    EXAMPLE=this_is_a_variable
    assertEqual example_$EXAMPLE  "example_$EXAMPLE"                    # There is no backslash, so this will be example_this_is_a_variable.
    # -------------------------------------------------------------------------
    assertEqual ".don't use backticks." ".don't `echo use backticks`."  # Need to consider echos when using other quotations, so we left don't outside.
    assertEqual ".use this instead."    ".$(echo use this instead)."    # Using echo shows more clear syntax and easier to nest. 
    # -------------------------------------------------------------------------
    assertEqual Single_Quotes_\' "Single_Quotes_'"                      # The backslash considers the single tick and inserts it with the answer. 
    # -------------------------------------------------------------------------
    assertEqual backslash_\\     'backslash_\'                          # This is escaping with the backslash so we include it with the results.
    # -------------------------------------------------------------------------
    assertEqual All_of_the_above_with_double_quotes\ \$\"\\ "All_of_the_above_with_double_quotes $\"\\" # This considers all cases and combines them in double quotes.
}

# =============================================================================
test_ansi_c_quoting() {
    local NEWLINE
    # These are good considerations to include that we can use ASCII characters, other characters generated like smiley faces, and other scripts from other programs like \n and \t.

    # -------------------------------------------------------------------------
    assertEqual $'\101' 'A' # Octal representation of 'A' according to the ANSI C Quoting
    # -------------------------------------------------------------------------
    assertEqual $'\x41' 'A' # Hexadecimal representation of 'A'.
    # -------------------------------------------------------------------------
    assertEqual $'\u263A' '☺' # Unicode 2 byte character for a smiley face.
    # -------------------------------------------------------------------------
    assertEqual $'\U0001F603' '😃' # Unicode 4 byte character for a more detailed smiley face.
    # -------------------------------------------------------------------------
    NEWLINE="
"
    assertEqual "$NEWLINE" $'\n'    # Just like C++ or Java, we can use \n for newlines. but need to consider $ to obtain the command o the script.
    # -------------------------------------------------------------------------
    HORIZONTAL_TAB="	"
    assertEqual "$HORIZONTAL_TAB" $'\t' # Vise versa, we can use \t for tabbing.
}

# =============================================================================
test_locale_specific_translation() {
    assertEqual "Deprecated and dangerous" "Deprecated and dangerous"          # Here this tells bash to find a translation for the specific text
    # $"..." seems good for i18n but:                                          # locally, but if there is no local translation found, then it will use the text as is.
    #   http://www.gnu.org/software/gettext/manual/html_node/bash.html
    # Use gettext instead:
    #   http://www.gnu.org/software/gettext/manual/gettext.html
}
