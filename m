From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 May 2024 18:03:22 +0530
Subject: [1/2] platform: andes: Rename files with the prefix andes45
In-Reply-To: <20240419035824.280137-2-ben717@andestech.com>
References: <20240419035824.280137-1-ben717@andestech.com> <20240419035824.280137-2-ben717@andestech.com>
Message-ID: <CAAhSdy3tUh4JSkW2UW+_qPqQVnxOewFTGO3m_0Amc62MbePDRg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 19, 2024 at 9:28?AM Ben Zong-You Xie <ben717@andestech.com> wrote:
>
> Rename files with the prefix andes45 to andes.
>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/andes/{andes45-pma.c => andes_pma.c}         | 0
>  platform/generic/include/andes/{andes45.h => andes.h}         | 0
>  platform/generic/include/andes/{andes45_pma.h => andes_pma.h} | 0
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  rename platform/generic/andes/{andes45-pma.c => andes_pma.c} (100%)
>  rename platform/generic/include/andes/{andes45.h => andes.h} (100%)
>  rename platform/generic/include/andes/{andes45_pma.h => andes_pma.h} (100%)
>
> diff --git a/platform/generic/andes/andes45-pma.c b/platform/generic/andes/andes_pma.c
> similarity index 100%
> rename from platform/generic/andes/andes45-pma.c
> rename to platform/generic/andes/andes_pma.c
> diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes.h
> similarity index 100%
> rename from platform/generic/include/andes/andes45.h
> rename to platform/generic/include/andes/andes.h
> diff --git a/platform/generic/include/andes/andes45_pma.h b/platform/generic/include/andes/andes_pma.h
> similarity index 100%
> rename from platform/generic/include/andes/andes45_pma.h
> rename to platform/generic/include/andes/andes_pma.h
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

