import Test.HUnit
import InversionCounter

test_list1 = TestCase (assertEqual "inversion_count [1,3,5,2,4,6] 6"
  ([1,2,3,4,5,6],3) (inversion_count [1,3,5,2,4,6] 6))

test_list2 = TestCase (assertEqual "inversion_count [1,4,5,2,9,44,7,12,34] 9"
  ([1,2,4,5,7,9,12,34,44],6) (inversion_count [1,4,5,2,9,44,7,12,34] 9))

tests = TestList [TestLabel "test_list1" test_list1, TestLabel "test_list2" test_list2]

main = runTestTT tests
