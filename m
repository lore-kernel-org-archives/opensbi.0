From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 4 Dec 2022 00:59:08 +0300
Subject: [PATCH RFC v2 0/2] lib: sbi: add support for debug triggers
In-Reply-To: <20221203213929.206429-1-geomatsi@gmail.com>
References: <20221203213929.206429-1-geomatsi@gmail.com>
Message-ID: <Y4vGrLxywGPpCJ//@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> This is the second revision of the patches implementing SBI Debug
> Trigger extension proposal posted at riscv tech-debug list:
> https://lists.riscv.org/g/tech-debug/topic/92375492
> 
> The major changes include support for mcounter trigger type and
> updates according to some of the review comments. 
> 
> As a part of endianness fixes, this revision includes a separate
> patch for a header with endianness conversion macros. Depending
> on the feedback, later on it can be reposted separately.
> 
> Regards,
> Sergey
> 
> Changes v1 -> v2:
> - add header with endianness conversion macros
> - fix endinanness: keep possible big-endian support in mind
> - do not mark shared structures as packed
> - add support for type 2 (mcounter) triggers
 
The accompanying patches for Linux and GDB has also been posted:
- https://patchwork.sourceware.org/project/gdb/patch/20221130182605.1905317-1-yuly.tarasov at syntacore.com/
- https://lore.kernel.org/linux-riscv/20221203215535.208948-1-geomatsi at gmail.com/T/#t

Regards,
Sergey

