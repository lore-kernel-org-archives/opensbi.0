From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 Aug 2024 10:48:24 -0700
Subject: [PATCH v3 0/4] zicfilp and zicfiss support in opensbi
Message-ID: <20240822174828.4031332-1-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v3 for zicfilp and zicfiss support in opensbi

---
v3:
 - added fwft implementation for shadow stack and landing pad interface
v2:
 - added mpelp for 32bit (mstatush) and its handling in trad redirection
 - removed default SSE enabling. it'll break shadow stack enabled kernel
 - put sw check delegation at correct place

Deepak Gupta (4):
  include: adding support for Zicfilp / Zicfiss encodings
  lib: sbi: Zicfilp/Zicfiss detection and elp cfi state reflect back in
    status
  lib: sbi: sw check exception delegation
  lib: sbi: fwft: implement landing pad and shadow stack fwft interface

 include/sbi/riscv_encoding.h |  7 ++++
 include/sbi/sbi_hart.h       |  3 ++
 lib/sbi/sbi_fwft.c           | 74 ++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           | 21 +++++++++-
 lib/sbi/sbi_trap.c           | 20 ++++++++++
 5 files changed, 124 insertions(+), 1 deletion(-)

-- 
2.44.0


