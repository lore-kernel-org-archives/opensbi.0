From: Anup Patel <anup@brainfault.org>
Date: Sat, 21 Dec 2024 21:24:48 +0530
Subject: [PATCH v2 1/2] Cleanup int vs bool in semihosting_init() definitions
In-Reply-To: <20241213041421.2153806-1-michaelneuling@tenstorrent.com>
References: <20241213041421.2153806-1-michaelneuling@tenstorrent.com>
Message-ID: <CAAhSdy2njzAEuL-ZdozCTmj6-rR3iyfO0v9fAaboSJNte+wBYQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 13, 2024 at 9:44?AM Michael Neuling
<michaelneuling@tenstorrent.com> wrote:
>
> This is needed for a future patches to enable the new C23 language dialect.
>
> Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>

Added "include: sbi_utils:" prefix to patch subject at the time of
merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v2:
>   Address feedback from Xiang
>    - no longer change semihosting_init()
>    - cleanup int vs bool in semihost_enable() return
> ---
>  include/sbi_utils/serial/semihosting.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi_utils/serial/semihosting.h b/include/sbi_utils/serial/semihosting.h
> index 8cc4a86c3a..ef4888fc3f 100644
> --- a/include/sbi_utils/serial/semihosting.h
> +++ b/include/sbi_utils/serial/semihosting.h
> @@ -38,10 +38,10 @@ enum semihosting_open_mode {
>
>  #ifdef CONFIG_SERIAL_SEMIHOSTING
>  int semihosting_init(void);
> -int semihosting_enabled(void);
> +bool semihosting_enabled(void);
>  #else
>  static inline int semihosting_init(void) { return SBI_ENODEV; }
> -static inline int semihosting_enabled(void) { return 0; }
> +static inline bool semihosting_enabled(void) { return false; }
>  #endif
>
>  #endif
> --
> 2.34.1
>

