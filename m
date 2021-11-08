From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Nov 2021 09:58:50 +0800
Subject: [PATCH v4 03/11] lib: sbi: Detect Sscofpmf extension at run time
In-Reply-To: <20211105220527.2771269-4-atish.patra@wdc.com>
References: <20211105220527.2771269-1-atish.patra@wdc.com>
 <20211105220527.2771269-4-atish.patra@wdc.com>
Message-ID: <CAEUhbmU2swmuNm0pMuRUWPnAMRHKnv3q6XukvqVTAS_o1R97Rw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 6, 2021 at 6:06 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Sscofpmf ISA extension introduces PMU counter overflow and filtering support.
> It introduces a read only `scountovf` csr that can be used to detect if
> a hart supports this extension at runtime. However, this feature is only
> useful if the hart already supports mcounteren and mcountinhibit.
>
> Add a dynamic detection mechanism and boot time print message if sscofpmf
> is present.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/sbi_hart.h |  4 +++-
>  lib/sbi/sbi_hart.c     | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

