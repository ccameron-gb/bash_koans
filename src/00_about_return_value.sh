lesson_title "Return value"

test_return_value() {
  cd /ZOMGNODIRLIKETHIS &> /dev/null

  assertEqual $? 1        # This is a valid case of entering the directory of ZOMGNODIRLLIKETHIS

  ls ~/ > /dev/null       # This is 0 because the syntax error contains in the slash before the ~

  assertEqual $? 0
}