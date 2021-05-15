From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 15 May 2021 19:27:00 +0800
Subject: [PATCH] Makefile: unconditionally disable SSP
In-Reply-To: <20210515081638.2361496-1-fontaine.fabrice@gmail.com>
References: <20210515081638.2361496-1-fontaine.fabrice@gmail.com>
Message-ID: <CAEUhbmVYw=fJF-9dbF-jCA-8qH36R4MmDSW4T_1NQpiQza69FA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 15, 2021 at 4:30 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Though -nostdlib is passed in CFLAGS, -fno-stack-protector must also be
> passed to avoid linking errors related to undefined references to
> '__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
> -fstack-protector.
>
> Fixes:
>  - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

