From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2024 17:56:12 +0530
Subject: [PATCH 0/2] Coldboot wait improvements
In-Reply-To: <20240319145930.1827176-1-apatel@ventanamicro.com>
References: <20240319145930.1827176-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0_Wo22dUmhgc0++Qsg8aoOL6rZmaPZRUSB+3cBOYEKUA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 19, 2024 at 8:29?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> These are some of the simplifications/improvements which were found
> upon trying QEMU virt machine with large number of HARTs.
>
> These patches can also be found in the coldboot_wait_simplify_v1
> branch at https://github.com/avpatel/opensbi.git
>
> Anup Patel (2):
>   lib: sbi: Simplify wait_for_coldboot() implementation
>   lib: sbi: Wakeup non-coldboot HARTs early in the coldboot path

Applied this series to the riscv/opensbi repo.

Regards,
Anup

>
>  include/sbi/riscv_barrier.h |  6 ++-
>  lib/sbi/sbi_init.c          | 81 ++++++-------------------------------
>  2 files changed, 17 insertions(+), 70 deletions(-)
>
> --
> 2.34.1

