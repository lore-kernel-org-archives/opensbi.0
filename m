From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date: Tue, 23 May 2023 16:41:55 +0300
Subject: reserved-memory nodes created by OpenSBI
Message-ID: <CAMacjJzPFY85xouincvYdeh1TLOZEynVuzyVnztRNP4ht+Exhw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello, dear community,

I would like to ask you about reserved-memory nodes, which are created
by OpenSBI here:
https://github.com/riscv-software-src/opensbi/blob/v1.2/lib/utils/fdt/fdt_fixup.c#LL198C5-L198C30)/

The questions are the following:
1. What is the purpose of extending dts by reserved-memory nodes? I
assume that it is necessary to reserve some memory ranges for OpenSBI.
2. Why OpenSBI needs to have a preserved memory?
3. The memory-reserved ranges are overlapped with Linux's memory node
range. Is it OK that OpenSBI's memory-reserved node ranges and Linux's
memory node ranges overlap?

Thanks.

~ Oleksii

