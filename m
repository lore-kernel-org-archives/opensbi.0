From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Aug 2024 08:59:48 +0530
Subject: [PATCH v4 0/3] lib: sbi: Heap improvements for SMMTT
In-Reply-To: <20240809031638.89146-1-gregorhaas1997@gmail.com>
References: <20240809031638.89146-1-gregorhaas1997@gmail.com>
Message-ID: <CAAhSdy2S4CSbKWgbCam4Kr370T172E7++BGngZb_uvBuggXnoA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 9, 2024 at 8:46?AM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>
> This patch series includes two changes to the SBI heap implementation, primarily
> to enable future work on the SMMTT implementation. First, it enables allocations
> from multiple independent heaps on separate memory regions. Then, it adds a simple
> implementation for sbi_memalign for use in allocating aligned memory.
>
> See the individual commit messages in this series for more technical details.
>
> v4:
> - Rename sbi_memalign{_from} -> sbi_aligned_alloc{_from}
> - Miscellaneous code format changes
>
> v3:
> - Add missing Signed-off-by lines
> - Rename struct heap_control -> struct sbi_heap_control
> - Make various functions static inline in sbi_heap.h
> - Fix previously incorrect sbi_memalign() implementation
>
> Gregor Haas (3):
>   lib: sbi: Support multiple heaps
>   lib: sbi: Allocate from beginning of heap blocks
>   lib: sbi: Implement aligned memory allocators

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_heap.h |  66 +++++++++++--
>  lib/sbi/sbi_heap.c     | 204 +++++++++++++++++++++++++++++------------
>  2 files changed, 204 insertions(+), 66 deletions(-)
>
> --
> 2.45.2
>

