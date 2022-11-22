From: Xiang W <wxjstz@126.com>
Date: Tue, 22 Nov 2022 16:17:21 +0800
Subject: [PATCH 1/1] lib: sbi_ecall_base: add check for function
 parameter pointers
In-Reply-To: <20221122071321.4274-2-qinhaijun@eswincomputing.com>
References: <20221122071321.4274-1-qinhaijun@eswincomputing.com>
	 <20221122071321.4274-2-qinhaijun@eswincomputing.com>
Message-ID: <b5cfcd9458ff53b8ee0fb5042003476b9c859338.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-22???? 15:13 +0800?qinhaijun at eswincomputing.com???
> From: haijun qin <qinhaijun@eswincomputing.com>
> 
> When a null pointer is passed in by mistake, the program will
> enter the trap, so the check for the pointer is added.
> 
> Signed-off-by: haijun qin <qinhaijun@eswincomputing.com>

sbi_ecall_extension->handle is only called at
https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_ecall.c#L110, 
where out_val is not empty.

If you want to detect parameters, you also need to detect regs and out_trap. and
add code like this in each extension implementation.

Regards,
Xiang W
> ---
> ?lib/sbi/sbi_ecall_base.c | 3 +++
> ?1 file changed, 3 insertions(+)
> 
> diff --git a/lib/sbi/sbi_ecall_base.c b/lib/sbi/sbi_ecall_base.c
> index 786d2ac..3d4a367 100644
> --- a/lib/sbi/sbi_ecall_base.c
> +++ b/lib/sbi/sbi_ecall_base.c
> @@ -39,6 +39,9 @@ static int sbi_ecall_base_handler(unsigned long extid, unsigned long funcid,
> ?{
> ????????int ret = 0;
> ?
> +???????if(out_val == NULL)
> +???????????????return SBI_EINVALID_ADDR;
> +
> ????????switch (funcid) {
> ????????case SBI_EXT_BASE_GET_SPEC_VERSION:
> ????????????????*out_val = (SBI_ECALL_VERSION_MAJOR <<
> -- 
> 2.17.1
> 
> 



