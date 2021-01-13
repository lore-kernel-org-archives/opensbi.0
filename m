From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 13 Jan 2021 15:17:44 -0800
Subject: [PATCH 0/3] Avoid using packed structures
In-Reply-To: <20210113100657.809754-1-anup.patel@wdc.com>
References: <20210113100657.809754-1-anup.patel@wdc.com>
Message-ID: <CAOnJCULk6a9b5i6r=6JxMtB8O==MtZmF+LPtNgRo_gGFDAO=Cw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 13, 2021 at 2:07 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> Currently, we are using packed structures wherever both C source and
> assembly source access the structure. This causes GCC to generate
> sub-optimal instructions when accessing members of packed structure
> in C sources. As a result, we have bigger firmware binaries with
> sub-optimal instructions in hot path.
>
> This series removes packing of structures wherever possible. Due to
> this we have small firmware binaries with more optional instructions.
>
> These patches can also be found in nopacking_imp_v1 branch at:
> https://github.com/avpatel/opensbi.git
>
> Anup Patel (3):
>   include: sbi: No need to pack struct sbi_trap_regs
>   include: sbi: No need to pack struct sbi_scratch
>   include: sbi: Don't pack struct sbi_platform and
>     sbi_platform_operations
>
>  include/sbi/sbi_platform.h | 4 ++--
>  include/sbi/sbi_scratch.h  | 2 +-
>  include/sbi/sbi_trap.h     | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


For the entire series:
Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

