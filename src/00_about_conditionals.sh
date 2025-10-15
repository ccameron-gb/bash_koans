lesson_title "Conditions"

# Basic 'if' condition: executes when the test is true
test_if_condition() {

  local test='ok'

  # The condition checks if variable 'test' equals the string 'ok'
  if [ $test = 'ok' ]; then
    local assert='YES'
  fi

  # The condition was true, so 'assert' should be 'YES'
  assertEqual $assert "YES"
}

# 'if...else' condition: handles both true and false cases
test_if_condition_with_else() {

  local test='nope'

  # Since 'test' is 'nope', this condition fails
  if [ $test == 'ok' ]; then
    local assert='YES'
  else
    # Because the test failed, this branch executes
    local assert='NO'
  fi

  # The result should be 'NO' since the condition was false
  assertEqual $assert "NO"
}

# Using variables in conditional checks
test_if_condition_with_variables() {
  local variable="OMG"
  local condition='OMG' # Both variables hold the same string

  # Compare variable and condition values
  if [ "$variable" = "$condition" ]; then
    # Since they match, this block runs
    local assert='ok'
  fi

  # The variable matched the condition, so expect 'ok'
  assertEqual $assert "ok"
}

# Multiple conditions using 'elif'
test_multiple_if_conditions() {

  local test='zomg' # The value that will trigger the 'elif' condition

  # The first condition fails ('zomg' != 'ok')
  if [ $test = 'ok' ]; then
    local assert='no'
  # The second condition matches, so this branch executes
  elif [ $test = 'zomg' ]; then
    local assert='YES'
  fi

  # The expected result is 'YES'
  assertEqual $assert "YES"
}

# Checking if a directory exists
test_directory_if_conditions() {
  # The 'src' directory exists in the koans project
  if [ -d src ]; then
    local assert='yes'
  fi

  # Expect 'yes' because the 'src' directory exists
  assertEqual $assert "yes"

  # Check for a directory that doesn’t exist
  if [ ! -d NOT_EXISTENT_DIR ]; then
    local assert='no'
  fi

  # Expect 'no' because NOT_EXISTENT_DIR does not exist
  assertEqual $assert "no"
}

# Checking if a file exists
test_file_if_conditions() {
  # The 'README.md' file exists in the repository root
  if [ -f README.md ]; then
    local assert='yes'
  fi

  # Expect 'yes' because README.md exists
  assertEqual $assert "yes"
}
