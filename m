From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 May 2024 18:26:20 +0530
Subject: [PATCH v3] lib: sbi: Refine the settings for switching to Virtual
 Supervisor Mode.
In-Reply-To: <20240410020521.1898-1-popeblei@gmail.com>
References: <20240410020521.1898-1-popeblei@gmail.com>
Message-ID: <CAAhSdy3kWqstGLsHGA0J7smLc35UU+Z1nOzNcj+f0AeRWseyAA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 7:35?AM Pope B.Lei <popeblei@gmail.com> wrote:
>
> Although Mstatus.MPV is set, before executing mret, access to VS mode
> registers should use the actual register addresses, not the pseudonyms
> of S registers.
>
> Signed-off-by: Pope B.Lei <popeblei@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> V1 -> V2: Simplify the if condition
> V2 -> V3: Format indentation to tabs.
>  lib/sbi/sbi_hart.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 3d13694..ea75e74 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -1041,10 +1041,17 @@ sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
>         csr_write(CSR_MEPC, next_addr);
>
>         if (next_mode == PRV_S) {
> -               csr_write(CSR_STVEC, next_addr);
> -               csr_write(CSR_SSCRATCH, 0);
> -               csr_write(CSR_SIE, 0);
> -               csr_write(CSR_SATP, 0);
> +               if (next_virt) {
> +                       csr_write(CSR_VSTVEC, next_addr);
> +                       csr_write(CSR_VSSCRATCH, 0);
> +                       csr_write(CSR_VSIE, 0);
> +                       csr_write(CSR_VSATP, 0);
> +               } else {
> +                       csr_write(CSR_STVEC, next_addr);
> +                       csr_write(CSR_SSCRATCH, 0);
> +                       csr_write(CSR_SIE, 0);
> +                       csr_write(CSR_SATP, 0);
> +               }
>         } else if (next_mode == PRV_U) {
>                 if (misa_extension('N')) {
>                         csr_write(CSR_UTVEC, next_addr);
> --
> 2.35.2.windows.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

