From: Samuel Holland <samuel@sholland.org>
Date: Tue, 27 Dec 2022 14:13:44 -0600
Subject: [PATCH] Makefile: Remove -N ldflag to prevent linker RWX warning
In-Reply-To: <20221225032211.1370467-1-rpathak@ventanamicro.com>
References: <20221225032211.1370467-1-rpathak@ventanamicro.com>
Message-ID: <f0c6670a-27f7-5412-65f9-56f39b67fe16@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/24/22 21:22, Rahul Pathak wrote:
> -N option coalesce all sections into single LOAD segment which causes
> data and other sections to have executable permission causing warning
> with new binutils ld 2.39.
> New ld emits warning when any segment have all three permissions RWX.
> 
> ld.bfd: warning: test.elf has a LOAD segment with RWX permissions
> ld.bfd: warning: fw_dynamic.elf has a LOAD segment with RWX permissions
> ld.bfd: warning: fw_jump.elf has a LOAD segment with RWX permissions
> ld.bfd: warning: fw_payload.elf has a LOAD segment with RWX permissions
> 
> This option was added in below commit -
> commit: eeab92f2423e ("Makefile: Convert to a more standard format")
> 
> Removing -N option allows to have text and rodata into one LOAD
> segment and other sections into separate LOAD segment which prevents
> RWX permissions on single LOAD segment. Here X == E
> 
> Current
>  LOAD           0x0000000000000120 0x0000000080000000 0x0000000080000000
>                  0x000000000001d4d0 0x0000000000032ed8  RWE    0x10
> 
> -N removed
>   LOAD           0x0000000000001000 0x0000000080000000 0x0000000080000000
>                  0x00000000000198cc 0x00000000000198cc  R E    0x1000
>   LOAD           0x000000000001b000 0x000000008001a000 0x000000008001a000
>                  0x00000000000034d0 0x0000000000018ed8  RW     0x1000
> 
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

fw_dynamic.bin still works for me on D1 with this change, so:

Tested-by: Samuel Holland <samuel@sholland.org>


