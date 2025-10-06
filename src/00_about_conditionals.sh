lesson_title "Conditions"

test_if_condition() {

  local test='ok'
  # This if condition checks the value of the variable test = 'ok', then sets the value of assert to string 'YES'.
  if [ $test = 'ok' ]; then
    local assert='YES'
  fi

  assertEqual $assert YES
}


test_if_condition_with_else() {

  local test='nope'

  # The output will result to 'NO' because the value of test does not equal 'ok', so assert's value = 'NO'
  if [ $test == 'ok' ]; then
    local assert='YES'
  else
    local assert='NO'
  fi

  assertEqual $assert NO
}

test_if_condition_with_variables() {
  local variable="OMG"
  local condition='OMG' 
  
  #The quotations don't matter for conditions and variables. 

  if [  "$variable" = "$condition" ]; then
    local assert='ok'
  fi

  assertEqual $assert ok

}

test_multiple_if_conditions() {

  local test='zomg' # Can consider multiple cases on checking the value of local variable test.

  if [ $test = 'ok' ]; then
    local assert='no'
  elif [ $test = 'zomg' ]; then
    local assert='YES'
  fi

  assertEqual $assert YES

}

test_directory_if_conditions() {

  # We can consider using -_ to check if something we need exists (files, directories, etc.)
  # This checks if the directory named src exists, which does. 
  if [ -d src ]; then
    local assert='yes'
  fi

  assertEqual $assert yes

  # The answer is still no because this checks "if NON_EXISTENT_DIR doesn't exist", which is true.
  if [ ! -d NOT_EXISTENT_DIR ]; then
    local assert='no'
  fi

  assertEqual $assert no

}

test_file_if_conditions() {

  # We use -f to check if the file README.md exists, which results to true.
  if [ -f README.md ]; then
    local assert='yes'
  fi

  assertEqual $assert yes

}

# TODO add koans for 'man test' entries
