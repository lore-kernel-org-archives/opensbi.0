From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Oct 2021 17:43:03 +0530
Subject: [PATCH 0/2] system reset rework to list, priority
In-Reply-To: <20211001083117.2008-1-nikita.shubin@maquefel.me>
References: <20211001083117.2008-1-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy18BXn-aQaiuoBzNgBZ-DZ2iOAgqp9sEraYWnO-eMRksQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 1, 2021 at 2:01 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Reworking current sbi_system reset to support multiply reset handlers.
>
> There are situation possible when one reset handler is responsible for
> shutdown and the other for reset, they can be both capable of reset/shutdown
> but some are more desirable than others.
>
> rfc -> v0:
> lib: sbi: convert reset to list:
> - restored dom->system_reset_allowed check
> - removed reset devices iterations from sbi_system_reset, we rely on
>   sbi_system_reset_get_device
> - to_system_reset_device +static
>
> lib: sbi: add priority for reset handler:
> - changed priority meaning to classic, the more the more prioritized
> - moved all checks to sbi_system_reset
>
> Currently all reset devices have priority of 1 - the least priority,
> as it wasn't supposed to have more than one handler before this patch,
> it won't break anything.
>
> Tested with 2 reset handlers on Sifive Unmatched, gpio-poweroff responsible
> for shutdown and da9063 responsible for reset:
>
> Platform Reboot Device    : da9063
> Platform Shutdown Device  : gpio-reset
>
> Without da9063 it looks like:
>
> Platform Reboot Device    : ---
> Platform Shutdown Device  : gpio-reset

Overall this looks good. I will wait a couple of more days before merging this.

Regards,
Anup

>
> Nikita Shubin (2):
>   lib: sbi: convert reset to list
>   lib: sbi: add priority for reset handler
>
>  include/sbi/sbi_system.h              | 13 ++++++--
>  lib/sbi/sbi_init.c                    |  7 ++--
>  lib/sbi/sbi_system.c                  | 47 +++++++++++++++++++--------
>  lib/utils/reset/fdt_reset_gpio.c      |  2 +-
>  lib/utils/reset/fdt_reset_sunxi_wdt.c |  2 +-
>  lib/utils/reset/fdt_reset_thead.c     |  2 +-
>  lib/utils/sys/htif.c                  |  2 +-
>  lib/utils/sys/sifive_test.c           |  2 +-
>  platform/kendryte/k210/platform.c     |  2 +-
>  platform/nuclei/ux600/platform.c      |  2 +-
>  10 files changed, 57 insertions(+), 24 deletions(-)
>
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

