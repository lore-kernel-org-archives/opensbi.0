From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Aug 2024 12:18:44 +0530
Subject: [PATCH v2 0/2] lib: sbi: Heap improvements for SMMTT
In-Reply-To: <20240710210924.817753-1-gregorhaas1997@gmail.com>
References: <20240710210924.817753-1-gregorhaas1997@gmail.com>
Message-ID: <CAAhSdy1ZaVg6eBbbiFjaU+erosnCyQ+KAteq-=nwqOFmwQB_Mw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 2:39?AM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>
> This patch series includes two changes to the SBI heap implementation, primarily
> to enable future work on the SMMTT implementation. First, it enables allocations
> from multiple independent heaps on separate memory regions. Then, it adds a simple
> implementation for sbi_memalign for use in allocating aligned memory.

This is useful for managing RAS CPER record memory as well.

>
> See the individual commit messages in this series for more technical details.
>
> Gregor Haas (2):
>   lib: sbi: Support multiple heaps
>   lib: sbi: Implement aligned memory allocators
>
>  include/sbi/sbi_heap.h |  23 ++++++
>  lib/sbi/sbi_heap.c     | 181 +++++++++++++++++++++++++++++------------
>  2 files changed, 151 insertions(+), 53 deletions(-)
>
> --
> 2.45.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

