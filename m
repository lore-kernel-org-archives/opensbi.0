From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Feb 2024 18:25:37 +0530
Subject: [PATCH v5 0/6] starfive reboot cleanup & fix
In-Reply-To: <20240222081619.275869-1-namcao@linutronix.de>
References: <20240222081619.275869-1-namcao@linutronix.de>
Message-ID: <CAAhSdy0M_pGXptDY7RgVSuQdv=PF-ZyLpHHqe8RVnzP6NR8ddA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 22, 2024 at 1:46?PM Nam Cao <namcao@linutronix.de> wrote:
>
> This series:
>  - Rename device tree compatible strings to match U-Boot
>  - Fix code that extract I2C address from device tree
>  - Cleanup
>
> v5:
>  - Collect reviewed-by and tested-by tags
>  - squash 2 commits:
>      platform: starfive: remove redundant compatibility check in pmic_ops
>      platform: starfive: drop "compatible" from struct pmic
>
>
> Nam Cao (6):
>   platform: starfive: correct system clock device tree node
>   platform: starfive: get I2C offset address from clocks property
>   platform: starfive: remove redundant compatibility check in pmic_ops
>   platform: starfive: rename "stf,axp15060-regulator" ->
>     "x-powers,axp15060"
>   platform: starfive: return error if needed devices are not present
>   platform: starfive: call starfive_jh7110_inst_init() in
>     pm_reset_init()

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  platform/generic/starfive/jh7110.c | 71 ++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 33 deletions(-)
>
> --
> 2.39.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

