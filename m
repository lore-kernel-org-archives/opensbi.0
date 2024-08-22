From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Aug 2024 23:50:46 -0700
Subject: [PATCH v2 0/3] zicfilp and zicfiss support in opensbi
Message-ID: <20240822065049.3923308-1-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v2 for zicfilp and zicfiss support in opensbi

---
v2:
 - added mpelp for 32bit (mstatush) and its handling in trad redirection
 - removed default SSE enabling. it'll break shadow stack enabled kernel
 - put sw check delegation at correct place

Deepak Gupta (3):
  include: adding support for Zicfilp / Zicfiss encodings
  lib: sbi: Zicfilp/Zicfiss detection and elp cfi state reflect back in
    status
  lib: sbi: sw check exception delegation

 include/sbi/riscv_encoding.h |  7 +++++++
 include/sbi/sbi_hart.h       |  3 +++
 lib/sbi/sbi_hart.c           | 21 ++++++++++++++++++++-
 lib/sbi/sbi_trap.c           | 20 ++++++++++++++++++++
 4 files changed, 50 insertions(+), 1 deletion(-)

-- 
2.44.0


