From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 May 2021 13:05:54 +0530
Subject: [PATCH v1 0/3] Don't use SBI functions in fdt code
In-Reply-To: <20210517113319.25855-1-daniel.schaefer@hpe.com>
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
Message-ID: <CAAhSdy1ONL_sdujW6GfF6g4UFQKz59zJGYAB8CdgUNcpy76Yaw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Daniel,

On Mon, May 17, 2021 at 5:04 PM Daniel Schaefer <daniel.schaefer@hpe.com> wrote:
>
> My previous solution to build v0.9 in EDK2 wasn't correct:
> http://lists.infradead.org/pipermail/opensbi/2021-May/000982.html
>
> Abner reminded me that he had done a similar change before. It was
> to not use SBI functions in the FDT files but instead call those from
> libfdt_env.h.
>
> See:
> 2cfd2fc9048806353298a1b967abf985901e36e8
> 2845d2d2cf4fb74a89452ba223995aa4a118c07e
> 8e47649eff96c303e02fbd58cdc6c4ed341066ec
>
> Doing the same kinds of changes again, solves the issue.
>
> Cc: Abner Chang <abner.chang@hpe.com>
> Cc: Anup Patel <Anup.Patel@wdc.com>
>
> Daniel Schaefer (3):
>   lib: utils: Add macro to libfdt_env.h for strncpy
>   lib: fdt: Don't use sbi_string functions
>   lib: utils: Replace strcmp with strcmp

You would be sending a v2 with comments addressed. Right ??

>
>  lib/utils/fdt/fdt_domain.c    | 7 ++++---
>  lib/utils/libfdt/libfdt_env.h | 1 +
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> --
> 2.30.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

