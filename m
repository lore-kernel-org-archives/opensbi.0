From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 11 Jun 2023 09:38:55 +0530
Subject: [PATCH 0/2] OpenSBI logo and copyright update
Message-ID: <20230611040857.51858-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The OpenSBI project does have an official logo which was designed
few months back. This logo is reviewed and approved by RISC-V
international. In fact, some of the RISC-V international slides
already use the official OpenSBI logo.

We add the official logo to the OpenSBI sources so that anyone can:
* Use it in presentations
* Create laptop stickers
* ... and more ...

We also update project copyright information in the top-level
README.md.

These patches can also be found in logo_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (2):
  docs: Add OpenSBI logo and use it in the top-level README.md
  README.md: Improve project copyright information

 README.md                               |   8 ++++++--
 docs/riscv_opensbi_logo_final_color.png | Bin 0 -> 7758 bytes
 docs/riscv_opensbi_logo_final_grey.png  | Bin 0 -> 9159 bytes
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 docs/riscv_opensbi_logo_final_color.png
 create mode 100644 docs/riscv_opensbi_logo_final_grey.png

-- 
2.34.1


