From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Oct 2021 14:13:59 +0530
Subject: [RFC PATCH 0/2] Add support for Allwinner D1 CLINT
In-Reply-To: <20211020015838.45399-1-samuel@sholland.org>
References: <20211020015838.45399-1-samuel@sholland.org>
Message-ID: <CAAhSdy0TW2ALDKJqBi_39QA3WsrzJTWnEvML5cK_T_mt1F7hCg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 20, 2021 at 7:28 AM Samuel Holland <samuel@sholland.org> wrote:
>
> This series removes the clint,has-no-64bit-mmio property from the MTIMER
> driver, and instead uses the compatible string to determine if 64-bit
> MMIO is functional, as suggested on the list[1][2].

Thanks for doing this change. I was also thinking of removing this DT property
in favor of implementation specific compatible strings.

>
> According to Guo Ren[3], this quirk only applies to the D1, not to the
> C9xx processors more generally, so I am using the SoC compatible without
> a fallback compatible for the CPU implementation.
>
> One question I have: Now that the ACLINT specification is available, and
> since it is backward compatible, should we describe this hardware as a
> standard ACLINT MSWI plus a custom ACLINT MTIMER instead of as a custom
> CLINT? This would minimize the scope of the changes.

Yes, for newer platforms (such as Allwiner D1) we should insist everyone
to move away from SiFive CLINT DT bindings and instead use ACLINT
DT bindings (this applies for all three ACLINT devices).

Although, I am not sure if we should update existing DTS files in the
upstream kernel.

Regards,
Anup

>
> [1]: http://lists.infradead.org/pipermail/opensbi/2021-October/001815.html
> [2]: http://lists.infradead.org/pipermail/opensbi/2021-October/001841.html
> [3]: http://lists.infradead.org/pipermail/opensbi/2021-October/001863.html
>
>  docs/platform/thead-c9xx.md        |  4 +--
>  include/sbi_utils/fdt/fdt_helper.h |  2 +-
>  lib/utils/ipi/fdt_ipi_mswi.c       |  3 ++-
>  lib/utils/reset/fdt_reset_gpio.c   |  4 +--
>  lib/utils/timer/fdt_timer_mtimer.c | 39 +++++++++++++++++++-----------
>  5 files changed, 31 insertions(+), 21 deletions(-)
>
> --
> 2.32.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

