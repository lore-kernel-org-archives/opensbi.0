From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 13 Jan 2022 14:09:21 +0800
Subject: [PATCH] Fix pointer of type 'void *' used in arithmetic
In-Reply-To: <20220112074846.136171-1-jukkax@ssrc.tii.ae>
References: <20220112074846.136171-1-jukkax@ssrc.tii.ae>
Message-ID: <CAEUhbmX7osgyBAmk0m4COchsx9LZTrkWx3V-wOufspMtGfupuQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 12, 2022 at 3:50 PM Jukka Laitinen <jukka.laitinen@iki.fi> wrote:
>
> Using "void *" in arithmetic causes errors with strict compiler settings:
> "error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]"
>
> Just remove these by calculating on "char *" where 1-byte data size is assumed

Missing SoB tag

> ---
>  include/sbi/sbi_scratch.h       | 4 ++--
>  lib/sbi/sbi_fifo.c              | 6 +++---
>  lib/sbi/sbi_string.c            | 4 ++--
>  lib/utils/irqchip/plic.c        | 8 ++++----
>  lib/utils/timer/aclint_mtimer.c | 2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)
>

Regards,
Bin

