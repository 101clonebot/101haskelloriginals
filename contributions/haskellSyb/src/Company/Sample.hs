module Company.Sample where

import Company.Data

-- Test data
sampleCompany :: Company
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
