From: Xiang W <wxjstz@126.com>
Date: Tue, 22 Jun 2021 14:41:55 +0800
Subject: [PATCH 1/1] lib: sign conflict in sbi_tlb_entry_process()
In-Reply-To: <20210621195010.33557-1-xypron.glpk@gmx.de>
References: <20210621195010.33557-1-xypron.glpk@gmx.de>
Message-ID: <7ee398bac890aa3df905608a8583167c1aae4875.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-06-21???? 21:50 +0200?Heinrich Schuchardt???
> Compiling sbi_tlb_entry_process() with GCC 11 and -Wextra yields:
> 
> lib/sbi/sbi_tlb.c: In function ?sbi_tlb_process_count?:
> lib/sbi/sbi_tlb.c:206:31:
> error: comparison of integer expressions of different signedness:
> ?u32? {aka ?unsigned int?} and ?int? [-Werror=sign-compare]
> ? 206 |???????????????? if (deq_count > count)
> 
Reviewed-by: Xiang W <wxjstz@126.com>

Regards,
Xiang W

> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> ?lib/sbi/sbi_tlb.c | 5 +++--
> ?1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index 2ba1b7b..8bbe92b 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -193,10 +193,11 @@ static void sbi_tlb_entry_process(struct
> sbi_tlb_info *tinfo)
> ????????}
> ?}
> 
> -static void sbi_tlb_process_count(struct sbi_scratch *scratch, int
> count)
> +static void sbi_tlb_process_count(struct sbi_scratch *scratch,
> +???????????????????????????????? unsigned int count)
> ?{
> ????????struct sbi_tlb_info tinfo;
> -???????u32 deq_count = 0;
> +???????unsigned int deq_count = 0;
> ????????struct sbi_fifo *tlb_fifo =
> ????????????????????????sbi_scratch_offset_ptr(scratch,
> tlb_fifo_off);
> 
> --
> 2.30.2
> 
> 



