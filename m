From: Xiang W <wxjstz@126.com>
Date: Fri, 01 Dec 2023 21:45:25 +0800
Subject: [PATCH] lib: sbi_hsm: Put the resume_pending hart in the
 interruptible hart mask
In-Reply-To: <20231201095147.1791731-1-nick.hu@sifive.com>
References: <20231201095147.1791731-1-nick.hu@sifive.com>
Message-ID: <43b6cd22fcd145471e25b13aec545ca67368657c.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-01???? 17:51 +0800?Nick Hu???
> Current interruptible hart mask doesn't include the hart which HSM state
> is SBI_HSM_STATE_RESUME_PENDING. So when there is a request to send an
> IPI to the hart which is in the resume process, this hart would miss the
> IPI forever. Put the SBI_HSM_STATE_RESUME_PENDING hart in the
> interruptible hart mask to fix the issue.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/sbi/sbi_hsm.c | 3 ++-
> ?1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 147f954..3d60ceb 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -128,7 +128,8 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
> ?
> ?		hstate = __sbi_hsm_hart_get_state(hbase + i);
> ?		if (hstate == SBI_HSM_STATE_STARTED ||
> -		??? hstate == SBI_HSM_STATE_SUSPENDED)
> +		??? hstate == SBI_HSM_STATE_SUSPENDED ||
> +		??? hstate == SBI_HSM_STATE_RESUME_PENDING)
> ?			*out_hmask |= hmask;
> ?	}
> ?
> -- 
> 2.34.1
> 
> 


