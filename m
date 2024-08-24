From: Kele Zhang <1952088712@qq.com>
Date: Sat, 24 Aug 2024 16:14:07 +0800
Subject: [PATCH 0/2] Enable Dead Code Elimination
Message-ID: <tencent_A49D2F3ABD9848D0904EE4A6A0BDAC933A06@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch enables `--gc-sections`. Dead Code Elimination (DCE) can
reduce binary size and the attack surface without introducing side
effects, and it has been used in the Linux kernel for many years.

After testing, enabling DCE does not affect the normal functionality of
OpenSBI.

Kele Zhang (2):
  Makefile: enable --gc-sections
  Makefile: Remove -g from default CFLAGS

 Makefile                    | 4 ++--
 firmware/fw_base.ldS        | 1 +
 firmware/fw_payload.elf.ldS | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1


