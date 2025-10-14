lesson_title "Conditions"

test_if_condition() {

  local test='ok'

  if [ $test = 'ok' ]; then
    local assert='YES'
  fi

  assertEqual $assert "YES"
}


test_if_condition_with_else() {

  local test='nope'

  if [ $test == 'ok' ]; then
    local assert='YES'
  else
    local assert='NO'
  fi

  assertEqual $assert "NO"
}

test_if_condition_with_variables() {
  local variable="OMG"
  local condition='OMG'

  if [  "$variable" = "$condition" ]; then
    local assert="EQUAL"
  else
    local assert="NOT_EQUAL"
  fi

  assertEqual $assert "EQUAL"

}

test_multiple_if_conditions() {

  local test='zomg' #this one checks multiple ifs

  if [ $test = 'ok' ]; then
    local assert='no'
  elif [ $test = 'zomg' ]; then
    local assert='YES'
  fi

  assertEqual $assert "YES"

}

test_directory_if_conditions() {
  if [ -d src ]; then
    local assert='yes'
  fi

  assertEqual $assert "yes"

  if [ ! -d NOT_EXISTENT_DIR ]; then
    local assert='no'
  fi

  assertEqual $assert "no"

}

test_file_if_conditions() {
  if [ -f README.md ]; then
    local assert='yes' # checking if file actually exists
  fi

  assertEqual $assert "yes"
}

#add more later for 'man test'
