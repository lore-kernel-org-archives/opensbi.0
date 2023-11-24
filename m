From: Karthik B K <karthik.bk@incoresemi.com>
Date: Fri, 24 Nov 2023 09:36:07 +0000
Subject: [QUESTION] Usage of negative number notations on unsigned numbers.
Message-ID: <PN2P287MB0754429FA98AFB8EFD2F4D4BFAB8A@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi. The pmp_get function in lib/sbi/riscv_asm.c uses a negative number notation on an unsigned integer.

pmpaddr = -1UL;

Just curious why it is this way. I believe that the intention here is to represent the largest unsigned long number.
If so, isn't it safer to use (~0UL) ? This could be a very silent bug. Please correct me if I'm wrong.

Best,

karthik.
