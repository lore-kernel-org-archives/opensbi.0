From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2024 17:45:39 +0530
Subject: [PATCH 0/2] Optimize current hart scratch access
In-Reply-To: <20240318144932.4165729-1-samuel.holland@sifive.com>
References: <20240318144932.4165729-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2zG0MUkPt1Z7tcEy+f0Cz8hkT7GhSF2OjeZ9wdzs+CsQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 18, 2024 at 8:19?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> These patches save about 280 bytes of code size in the generic platform
> firmware.
>
>
> Samuel Holland (2):
>   lib: utils/timer: Optimize current hart scratch access
>   platform: generic: allwinner: Optimize current hart scratch access

Applied this series to the riscv/opensbi repo.

Regards,
Anup

>
>  lib/utils/timer/aclint_mtimer.c        | 18 +++---------------
>  platform/generic/allwinner/sun20i-d1.c |  2 +-
>  2 files changed, 4 insertions(+), 16 deletions(-)
>
> --
> 2.43.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

