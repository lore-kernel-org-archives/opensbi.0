From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 18 Oct 2021 05:17:01 +0000
Subject: PATCH for Issue 225
In-Reply-To: <CAM0yjiSayXAvWG+6-su0HZNUw-TdB8CpZExGvwRfkRn0k472eA@mail.gmail.com>
References: <CAM0yjiSayXAvWG+6-su0HZNUw-TdB8CpZExGvwRfkRn0k472eA@mail.gmail.com>
Message-ID: <77762AB9-E2A2-41A4-A716-020CFB7AD5B0@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Vasan,

Only plain text emails are allowed in OpenSBI mailing list so please
take care in future emails.

Please see further comments inline below...

Regards,
Anup

From: Vasan VS <vasan.vs@gmail.com>
Date: Monday, 18 October 2021 at 1:32 AM
To: Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
Cc: "opensbi at lists.infradead.org" <opensbi@lists.infradead.org>
Subject: PATCH for Issue 225

Please review the following fix for Issue #225 (https://github.com/riscv-software-src/opensbi/issues/225 )

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6254452..0659486 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -346,6 +346,7 @@ static unsigned long hart_pmp_get_allowed_addr(void)
? unsigned long val = 0;
? struct sbi_trap_info trap = {0};
?
+ csr_write(CSR_PMPCFG0, 0);

[Anup] Use csr_write_allowed() to set CSR_PMPCFG0 because PMP might
not be preset. If you get trap while updating CSR_PMPCFG0 then return 0.

? csr_write_allowed(CSR_PMPADDR0, (ulong)&trap, PMP_ADDR_MASK);
? if (!trap.cause) {
? val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);



Regards

Vasan

