From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Sep 2022 16:36:13 +0530
Subject: [PATCH 1/2] docs: pmu: fix Unmatched example typo
In-Reply-To: <20220831070714.7540-1-nikita.shubin@maquefel.me>
References: <20220831070714.7540-1-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy0og7ZaMCViz+CNud7kTfrE50zZ+msgFW2GfusPsdqx-w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 31, 2022 at 12:38 PM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
>
> bitmap for MHPMCOUNTERx should be 0x18 and not 0x0c, we check
> against SBI_PMU_FIXED_CTR_MASK which assumes than first 3 bits are
> dedicated to mcycle, mtime and minstret, u74 has 2 hardware counters.
>
> Reported-by: Zhang Xin <zhangxin.xa@gmail.com>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/pmu_support.md | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> index 8751bb5..ca6ca25 100644
> --- a/docs/pmu_support.md
> +++ b/docs/pmu_support.md
> @@ -93,8 +93,8 @@ pmu {
>   */
>  pmu {
>         compatible                      = "riscv,pmu";
> -       riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0xc>,
> -                                         <0x0 0x1 0xffffffff 0xfff800ff 0xc>,
> -                                         <0x0 0x2 0xffffffff 0xffffe0ff 0xc>;
> +       riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0x18>,
> +                                         <0x0 0x1 0xffffffff 0xfff800ff 0x18>,
> +                                         <0x0 0x2 0xffffffff 0xffffe0ff 0x18>;
>  };
>  ```
> --
> 2.35.1
>

