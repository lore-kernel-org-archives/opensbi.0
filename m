From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 14 Sep 2023 10:39:50 +0800
Subject: [RFC PATCH v2 0/2] platform: generic: thead: add sfence workaroud for th1520/sg2042
Message-ID: <IA1PR20MB4953B82756730D98866F9E90BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The TLB entries remain functional all the time once added in T-HEAD th1520
and Sophgo sg2042 (even if the MMU is then disabled afterwards). If there
are some stale TLB entries that contains the address of SBI, it will cause
unexpected memory access and issue a illegal instruction error.
To avoid this, a TLB flush (sfence.vma) is needed to drop these TLB entries
before any memory access in the trap handler.

To minimize modification, a custom trap handler is used in the thead
platform to avoid destructive change to the generic code.

Changed from RFC:
1. use custom trap handler instead of asm alternative.
2. change description

Inochi Amaoto (2):
  include: Move trap handle helper functions to sbi_trap.h
  platform: generic: thead: fix stale TLB entries for th1520/sg2042

 firmware/fw_base.S                          | 149 -------------------
 include/sbi/sbi_trap.h                      | 155 ++++++++++++++++++++
 platform/generic/Kconfig                    |   4 +
 platform/generic/configs/defconfig          |   1 +
 platform/generic/thead/objects.mk           |  10 ++
 platform/generic/thead/thead-generic.c      |  61 ++++++++
 platform/generic/thead/thead-trap-handler.S |  33 +++++
 7 files changed, 264 insertions(+), 149 deletions(-)
 create mode 100644 platform/generic/thead/objects.mk
 create mode 100644 platform/generic/thead/thead-generic.c
 create mode 100644 platform/generic/thead/thead-trap-handler.S

--
2.42.0


