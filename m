From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Aug 2024 16:55:43 -0700
Subject: [PATCH 0/3] zicfilp and zicfiss support in opensbi
Message-ID: <20240821235546.3876172-1-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I had sent opensbi patches for zicfilp and zicfiss support a while ago.
Since it was long time ago and specifications are ratified now, so
rebooting the patch series to version 1.

These patches to below things

- Add newly defined bits in existing CSRs
	* enabling bit in menvcfg
	* expected landing pad bit in mstatus for M and S
- Add new exception cause code and its delegation to S
	* software check exception is a new exception and is raised
	when control flow violation is detected by CPU
- Detection and enabling of zicfilp and zicfiss
	* zicfilp is detected by presence of MSTATUS_MPELP bit in mstatus
	* zicfiss is detected if CSR_SSP exists
	* zicfilp for S is not enabled by default. It is expected the S
	mode software will request a SBI call to enable it (via FWFT extn)
	* zicfiss is enabled by default for S mode because S mode can
	leverage it only if S mode is compiled with zicfiss support

Deepak Gupta (3):
  include: adding support for Zicfilp / Zicfiss encodings
  lib: sbi: Zicfilp/Zicfiss detection and elp cfi state reflect back in
    status
  lib: sbi: sw check exception delegation

 include/sbi/riscv_encoding.h |  6 ++++++
 include/sbi/sbi_hart.h       |  3 +++
 lib/sbi/sbi_hart.c           | 31 +++++++++++++++++++++++++++++++
 lib/sbi/sbi_trap.c           | 16 ++++++++++++++++
 4 files changed, 56 insertions(+)

-- 
2.44.0


