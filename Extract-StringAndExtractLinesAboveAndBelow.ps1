﻿Select-String -Path "*.txt" -Pattern "445/tcp open" -Context 3,1 >> out.txt