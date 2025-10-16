lesson_title "Redirection"

test_redirecting_stdout_to_file() {

  # We set the output_stdout to print to a text file named redirect_test because we use ">"  to redirect it.
  # Then we use cat to read and copy the contents of the text file. 

  output_stdout > tmp/redirect_test.txt

  local contents=$(cat tmp/redirect_test.txt)

  assertEqual "$contents" "out to stdout"

}

test_redirecting_stderr_to_file() {

  # We redirect the standard error to a text file named redirect_test2 by using "2>".
  # The output of stderr will be written into tmp/redirect_test2.txt.
  # Then we use cat to read and copy the contents of the text file. 

  output_stderr 2> tmp/redirect_test2.txt

  local contents=$(cat tmp/redirect_test2.txt)

  assertEqual "$contents" "out to stderr"
}

test_redirecting_stdout_to_stderr() {

  # In this case, we need to redirect the output of stdout to the standard error destination.
  # First, we need the standard error destination by redirecting it with tmp/redirect_test3.txt, then stdout then redirects with the standard error.
  output_stdout 2> tmp/redirect_test3.txt 1>&2

  local contents=$(cat tmp/redirect_test3.txt)

  assertEqual "$contents" "out to stdout"

}

test_redirecting_stderr_to_stdout() {

  # Here we need to redirect the file descriptor of stdout to tmp/redirect_test4.txt. 
  # Then we send stderr to where stdout is going by 2>&1 
  # Consider ordering matters.

  output_stderr 1> tmp/redirect_test4.txt 2>&1

  local contents=$(cat tmp/redirect_test4.txt)

  assertEqual "$contents" "out to stderr"

}

test_redirecting_stdout_and_stderr_to_file() {

  # Here we redirect stdout to redirect_test5.txt by 1>
  # Then we redirect stderr to redirect_test6.txt by 2>

  output_both 1> tmp/redirect_test5.txt 2> tmp/redirect_test6.txt

  local contents5=$(cat tmp/redirect_test5.txt)
  local contents6=$(cat tmp/redirect_test6.txt)

  assertEqual "$contents5" "out to stdout"
  assertEqual "$contents6" "out to stderr"

}
