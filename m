From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 17:56:38 +0530
Subject: [PATCH] docs: platform: update platform_requirements.md
In-Reply-To: <TYWP286MB29878C4D4202EBC98937326BA5C1A@TYWP286MB2987.JPNP286.PROD.OUTLOOK.COM>
References: <TYWP286MB29878C4D4202EBC98937326BA5C1A@TYWP286MB2987.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy0=rfPor_o6ZOUMbVZxgyeVW689OCUm3GWsow9pi3RPAQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 28, 2023 at 1:55?PM <jay1273062855@outlook.com> wrote:
>
> From: Yangjie Zhang <jay1273062855@outlook.com>
>
> "Zicsr" isa extension has been separated from "I" extension.
> This patch add the isa requirement of "Zicsr" extension in
> platform requirements documentation.
>
> Signed-off-by: Yangjie Zhang <jay1273062855@outlook.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/platform_requirements.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/platform_requirements.md b/docs/platform_requirements.md
> index 8735adb..a843feb 100644
> --- a/docs/platform_requirements.md
> +++ b/docs/platform_requirements.md
> @@ -18,7 +18,7 @@ Base Platform Requirements
>
>  The base RISC-V platform requirements for OpenSBI are as follows:
>
> -1. At least rv32ima or rv64ima required on all HARTs
> +1. At least rv32ima_zicsr or rv64ima_zicsr required on all HARTs
>  2. At least one HART should have S-mode support because:
>
>       * SBI calls are meant for RISC-V S-mode (Supervisor mode)
> @@ -33,7 +33,7 @@ The base RISC-V platform requirements for OpenSBI are as follows:
>  6. Hardware support for injecting M-mode software interrupts on
>     a multi-HART platform
>
> -The RISC-V extensions not covered by rv32ima or rv64ima are optional
> +The RISC-V extensions not covered by rv32ima_zicsr or rv64ima_zicsr are optional
>  for OpenSBI. Although, OpenSBI will detect and handle some of these
>  optional RISC-V extensions at runtime.
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

