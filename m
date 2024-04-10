From: Pope B.Lei <popeblei@gmail.com>
Date: Wed, 10 Apr 2024 10:20:38 +0800
Subject: [PATCH v3] lib: sbi: Refine the settings for switching to Virtual
 Supervisor Mode.
In-Reply-To: <20240410020521.1898-1-popeblei@gmail.com>
References: <20240410020521.1898-1-popeblei@gmail.com>
Message-ID: <CAECSvgbkPWzSZ70B9=MfALVh=LPf=uqpCviX5Zmseu8to+xLdg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear all:

    I apologize for starting a new topic, but I'm unsure how to
proceed without doing so. Below is the sequence of commands I've used.
Could you please suggest any improvements?

Generating the Patch:

bashCopy code
git format-patch -v3 -M -s origin/master

Sending the Patch:

vbnetCopy code
git send-mail --to opensbi at lists.infradead.org
v3-0001-lib-sbi-Refine-the-settings-for-switching-to-Virt.patch

Thank you for your guidance!

On Wed, Apr 10, 2024 at 10:05?AM Pope B.Lei <popeblei@gmail.com> wrote:
>
> Although Mstatus.MPV is set, before executing mret, access to VS mode
> registers should use the actual register addresses, not the pseudonyms
> of S registers.
>
> Signed-off-by: Pope B.Lei <popeblei@gmail.com>
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

