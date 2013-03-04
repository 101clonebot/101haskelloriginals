module Main where

import Company.Data
import Company.BX
import Company.Total
import Company.Cut
import Company.LLTree
import Data.Foldable (toList)
import Test.HUnit
import System.Exit

sampleCompany = Company
  "Acme Corporation"
  [ Department "Research"
      (Employee "Craig" "Redmond" 123456)
      []
      [ Employee "Erik" "Utrecht" 12345,
        Employee "Ralf" "Koblenz" 1234
      ],
    Department "Development"
      (Employee "Ray" "Redmond" 234567)
      [ Department "Dev1"
          (Employee "Klaus" "Boston" 23456)
          [ Department "Dev1.1"
              (Employee "Karl" "Riga" 2345)
              []
              [ Employee "Joe" "Wifi City" 2344 ]
          ]
          []
      ]
      []
  ]

sampleTree = Fork [Fork [Leaf 123456.0,Leaf 12345.0,Leaf 1234.0],Fork [Leaf 234567.0,Fork [Leaf 23456.0,Fork [Leaf 2345.0,Leaf 2344.0]]]]

sampleTreeList = [123456.0,12345.0,1234.0,234567.0,23456.0,2345.0,2344.0]

totalTest = 399747.0 ~=? total sampleCompany

cutTest = 199873.5 ~=? total (cut sampleCompany)

serializationTest = sampleCompany ~=? read (show sampleCompany)

getTreeTest = sampleTree ~=? get sampleCompany

getTreeListTest = sampleTreeList ~=? toList (get sampleCompany)

tests =
  TestList [
    TestLabel "total" totalTest,
    TestLabel "cut" cutTest,
    TestLabel "serialization" serializationTest,
    TestLabel "getTree" getTreeTest,
    TestLabel "getTreeList" getTreeListTest
  ]

main = do
 counts <- runTestTT tests
 if (errors counts > 0 || failures counts > 0)
   then exitFailure
   else exitSuccess
