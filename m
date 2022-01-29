From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 29 Jan 2022 09:55:12 +0800
Subject: [PATCH] Makefile: fix build with binutils 2.38
In-Reply-To: <20220128173346.1863727-1-aurelien@aurel32.net>
References: <20220128173346.1863727-1-aurelien@aurel32.net>
Message-ID: <CAEUhbmWQBdzDKDfNB5oAH1UG4PfghouCLX+=n520oYDMcCHX6A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 29, 2022 at 1:33 AM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> From version 2.38, binutils default to ISA spec version 20191213. This
> means that the csr read/write (csrr*/csrw*) instructions and fence.i
> instruction has separated from the `I` extension, become two standalone
> extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> this causes the following build failure:
>
>  CC        lib/sbi/sbi_tlb.o
> <<BUILDDIR>>/lib/sbi/sbi_tlb.c: Assembler messages:
> <<BUILDDIR>>/lib/sbi/sbi_tlb.c:190: Error: unrecognized opcode `fence.i'
> make: *** [Makefile:431: <<BUILDDIR>>/build/lib/sbi/sbi_tlb.o] Error 1
>
> The fix is to specify those extensions explicitly in -march. However as
> older binutils version do not support this, we first need to detect
> that.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  Makefile | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> Changes v1 -> v2 following the review from Bin Men (thanks)!
> - Fix typos
> - Use grep to detect missing extensions for consistency with CC_SUPPORT_SAVE_RESTORE
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

