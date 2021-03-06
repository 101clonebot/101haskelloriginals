module Company.Cut where

import Company.Data
import Company.Algebra

cut :: Company -> Company
cut = foldCompany cutAlgebra
  where
    cutAlgebra
      = mapCompany {
          atEmployee = \n a s ->
            Employee n a (s/2)
        }

-- For comparison, without using mapCompany.

cut' :: Company -> Company
cut' = foldCompany cutAlgebra
  where
    cutAlgebra :: CompanyAlgebra Company Department Employee
    cutAlgebra
      = CompanyAlgebra {
          atCompany = Company,
          atDepartment = Department,
          atEmployee = \n a s ->
            Employee n a (s/2)
        }
