From: Xiang W <wxjstz@126.com>
Date: Tue, 12 Oct 2021 13:57:11 +0800
Subject: [PATCH v2] lib: sbi: Save context for all non-retentive suspend
 types
In-Reply-To: <20211011082419.1135425-1-anup.patel@wdc.com>
References: <20211011082419.1135425-1-anup.patel@wdc.com>
Message-ID: <e85f0b160477d43754b40cdb2b2a7cf92b220147.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-10-11???? 13:54 +0530?Anup Patel???
> Instead of saving context only for default non-retentive suspend,
> we should save context for all non-retentive suspend types.
> 
> Fixes: 74756891cc35 ("lib: sbi: Implement SBI HSM suspend function")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
Looks good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> Changes since v1:
> ?- Fixed typo in commit description and improved it.
> ---
> ?lib/sbi/sbi_hsm.c | 13 +++++++------
> ?1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 67890f3..ecd2e45 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -358,12 +358,6 @@ static int
> __sbi_hsm_suspend_non_ret_default(struct sbi_scratch *scratch,
> ?{
> ????????void (*jump_warmboot)(void) = (void (*)(void))scratch-
> >warmboot_addr;
> ?
> -???????/*
> -??????? * Save some of the M-mode CSRs which should be restored
> after
> -??????? * resuming from suspend state
> -??????? */
> -???????__sbi_hsm_suspend_non_ret_save(scratch);
> -
> ????????/* Wait for interrupt */
> ????????wfi();
> ?
> @@ -463,6 +457,13 @@ int sbi_hsm_hart_suspend(struct sbi_scratch
> *scratch, u32 suspend_type,
> ????????/* Save the suspend type */
> ????????hdata->suspend_type = suspend_type;
> ?
> +???????/*
> +??????? * Save context which will be restored after resuming from
> +??????? * non-retentive suspend.
> +??????? */
> +???????if (suspend_type & SBI_HSM_SUSP_NON_RET_BIT)
> +???????????????__sbi_hsm_suspend_non_ret_save(scratch);
> +
> ????????/* Try platform specific suspend */
> ????????ret = hsm_device_hart_suspend(suspend_type, scratch-
> >warmboot_addr);
> ????????if (ret == SBI_ENOTSUPP) {
> -- 
> 2.25.1
> 
> 



