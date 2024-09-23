From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Sep 2024 18:27:33 +0530
Subject: [PATCH] lib: sbi_domain_context: Fix file permissions
In-Reply-To: <20240830155707.3979714-1-samuel.holland@sifive.com>
References: <20240830155707.3979714-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0qBQBjoCxo1JBSR7HUuN605mK65qRMkMz9muxtkZymmw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 9:29?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> These C source files should not be marked as executable.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi/sbi_domain_context.h | 0
>  lib/sbi/sbi_domain_context.c     | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 => 100644 include/sbi/sbi_domain_context.h
>  mode change 100755 => 100644 lib/sbi/sbi_domain_context.c
>
> diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
> old mode 100755
> new mode 100644
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> old mode 100755
> new mode 100644
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

