From: Xiang W <wxjstz@126.com>
Date: Thu, 29 Feb 2024 10:36:47 +0800
Subject: [PATCH] lib: sbi_domain: Fix PMP condition for addresses
In-Reply-To: <20240227200743.22661-1-cmax@mailbox.org>
References: <20240227200743.22661-1-cmax@mailbox.org>
Message-ID: <272de5922603af4a3080eba37b2368bb8b3ead64.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-02-27???? 21:07 +0100?cmax at mailbox.org???
> From: max <cmax@mailbox.org>
> 
> In order to put an address/size into an NAPOT PMP region, the address
> needs to be aligned to the size shifted two to the right.
The address that needs to be aligned is
scratch->fw_start
scratch->fw_start + scratch->fw_rw_offset

Regards,
Xiang W

> 
> Example:
> fw_start: 0x80040000
> fw_size:? 0x00040000
> PMP address: 0x80040000 | (0x00040000 >> 2)
> fw_size is valid, but not in the current implementation
> 
> Signed-off-by: max <cmax@mailbox.org>
> ---
> ?lib/sbi/sbi_domain.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 4e9f742..94ee717 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -749,7 +749,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
> ?		return SBI_EINVAL;
> ?	}
> ?
> -	if ((scratch->fw_start & (scratch->fw_rw_offset - 1)) != 0) {
> +	if ((scratch->fw_start & ((scratch->fw_rw_offset >> 2) - 1)) != 0) {
> ?		sbi_printf("%s: fw_start and fw_rw_offset not aligned\n",
> ?			?? __func__);
> ?		return SBI_EINVAL;
> -- 
> 2.43.0
> 
> 


