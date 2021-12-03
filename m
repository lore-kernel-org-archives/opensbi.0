From: Tsukasa OI <research_trasio@irq.a4lg.com>
Date: Fri,  3 Dec 2021 10:13:55 +0900
Subject: [PATCH 0/1] docs/platform: spike: Enhance Spike examples
Message-ID: <cover.1638493883.git.research_trasio@irq.a4lg.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I mainly use Spike rather than QEMU for small tests and I find that setting up
Spike (with OpenSBI + Linux + initramfs) is not easy enough.

This commit makes Spike examples usable as QEMU ones.  This is not a full
tutorial (totally lacks initramfs, which is out of scope in the OpenSBI
documentation) but better than nothing.


Note: This is the same changeset as:
<https://github.com/riscv-software-src/opensbi/pull/232> (but rebased)




Tsukasa OI (1):
  docs/platform: spike: Enhance Spike examples

 docs/platform/spike.md | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)


base-commit: 14faee6916bc973b9fdb816c5f4a45096e3f645a
-- 
2.32.0


