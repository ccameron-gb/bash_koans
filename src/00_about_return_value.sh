lesson_title "Return value"

test_return_value() {
  # Trys to change into directory that doesn't exist and
  # (&>) redirects both stdout and stderr to /dev/null so we won't see an error message
  cd /ZOMGNODIRLIKETHIS &> /dev/null

  # ($?) contains the exit status of the previous command and
  # since the cd failed, ($?) will be 1 (nonzero indicates failure), and 0 is a success.
  assertEqual $? 1

  ls ~/ > /dev/null

  assertEqual $? __
}
