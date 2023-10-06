From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 10:05:30 +0530
Subject: [PATCH 0/3] Sparse HART id improvements
In-Reply-To: <20230924155745.1753120-1-wxjstz@126.com>
References: <20230924155745.1753120-1-wxjstz@126.com>
Message-ID: <CAAhSdy2iZruS48CqB9UDiaqL57KD7zX+DxsC-M8ArmxX8soWzg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 24, 2023 at 9:28?PM Xiang W <wxjstz@126.com> wrote:
>
> Modify last_hartindex_having_scratch/hartindex_to_hartid_table
> /hartindex_to_scratch_table as static variables to prevent accidental
> modification and reduce memory consumption
>
> Xiang W (3):
>   lib: sbi: Refactor sbi_scratch_last_hartindex as a function
>   lib: sbi: Refactor sbi_hartindex_to_hartid as a function
>   lib: sbi: Refactor sbi_hartindex_to_scratch as a function

All these are in hot-path at various places so introducing a
function is certainly not helping.

Also, if some buggy code is accidentally modifying global data
then that buggy code should be fixed rather than papering over
the problem by introducing these functions.

Regards,
Anup

>
>  include/sbi/sbi_scratch.h | 35 ++++++++++++-----------------------
>  lib/sbi/sbi_scratch.c     | 30 ++++++++++++++++++++++++++----
>  2 files changed, 38 insertions(+), 27 deletions(-)
>
> --
> 2.40.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

