From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 2 Sep 2023 13:29:18 +0530
Subject: [RFC PATCH 0/2] miscellaneous about hartmask
In-Reply-To: <20230831033930.694299-1-wxjstz@126.com>
References: <20230831033930.694299-1-wxjstz@126.com>
Message-ID: <CAK9=C2UQGVOeXLWyxdaD7TghpggJSX3geMogz+8WxdJXuXpkqQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 31, 2023 at 9:10?AM Xiang W <wxjstz@126.com> wrote:
>
> Originally, the bits in sbi_hartmask represent hartid. Because hartid can
> be discontinuous, there may be gaps. Represent hartindex instead.
>
> Xiang W (2):
>   ilib: sbi: add sbi_platform_hart_index2id
>   lib: sbi: improve sbi_hartmask

For the past several months, I have been gradually improving OpenSBI
to eventually support totally sparse hartid.

I have another series which adds full sparse hartid support in OpenSBI
which includes patches from this series.

Thanks,
Anup

>
>  include/sbi/sbi_hartmask.h | 40 ++++++++++++++++++++++++++++----------
>  include/sbi/sbi_platform.h | 10 ++++++++++
>  lib/sbi/sbi_domain.c       | 26 +++++++++----------------
>  lib/sbi/sbi_init.c         |  2 +-
>  lib/sbi/sbi_ipi.c          |  4 ++--
>  lib/sbi/sbi_platform.c     |  9 +++++++++
>  lib/sbi/sbi_system.c       |  4 ++--
>  lib/sbi/sbi_tlb.c          |  4 ++--
>  8 files changed, 65 insertions(+), 34 deletions(-)
>
> --
> 2.40.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

