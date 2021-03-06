module InversionCounter where
import Data.List


merge :: [Int] -> [Int] -> Int -> Int -> 
    ([Int], Int, Int)
merge left [] counter left_length       = (left, counter, left_length)
merge [] right counter left_length      = (right, counter, 0)
merge (l:ls) (r:rs) counter left_length  
  | l <= r = (l:left, left_count, left_length')   
  | otherwise = (r:right, right_count, left_length'') 
  where
    counter' = counter + left_length
    (left, left_count, left_length')    = merge ls (r:rs) counter (left_length - 1)
    (right, right_count, left_length'') = merge (l:ls) rs counter' left_length


inversion_count :: [Int] -> Int -> ([Int], Int)
inversion_count [] _         = ([], 0)
inversion_count (x:[]) _     = ((x:[]), 0)
inversion_count list length' =
  let (left, left_count)   = inversion_count left_list left_length
      (right, right_count) = inversion_count right_list right_length in
    let (cross, cross_count, left_length') = merge left right (left_count + right_count) left_length in
        (cross, cross_count)
  where
    left_length  = length' `div` 2
    right_length = length' - left_length
    (left_list, right_list) = splitAt left_length list
