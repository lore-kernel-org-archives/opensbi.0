From: Xiang W <wxjstz@126.com>
Date: Thu, 14 Apr 2022 14:11:52 +0800
Subject: [PATCH] lib: sbi/hart: preserve csr validation value.
Message-ID: <a9d1f0b3fa2aeaed5a471781bdc99ca8dda41f73.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> The OpenSBI hart init function hart_detect_features() try to read
> important CSRs but reasign the last read value to the variable that
> initially contains write probe value. So for series of CSRs (like
> PMPADDRx) the secong CSR probe value will became the initial value of
> first probing CSR. To avoid of this issue the CSR read value should be
> saved in different variable. In this configuration the count of PMP
> will detect rightly if any PMPADDR is hardwired to zero.
>  
> Signed-off-by: Dmitry Dunaev <dunaich@mail.ru>
only change name from val to oldval?

Regards,
Xiang W
> ---
>  lib/sbi/sbi_hart.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 7b602c3..891fa18 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -478,7 +478,7 @@ static void hart_detect_features(struct sbi_scratch
> *scratch)
>  {
>      struct sbi_trap_info trap = {0};
>      struct hart_features *hfeatures;
> -    unsigned long val;
> +    unsigned long val, oldval;
>  
>      /* Reset hart features */
>      hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
> @@ -487,14 +487,14 @@ static void hart_detect_features(struct
> sbi_scratch *scratch)
>      hfeatures->mhpm_count = 0;
>  
>  #define __check_csr(__csr, __rdonly, __wrval, __field, __skip)    \
> -    val = csr_read_allowed(__csr, (ulong)&trap);            \
> +    oldval = csr_read_allowed(__csr, (ulong)&trap);            \
>      if (!trap.cause) {                        \
>          if (__rdonly) {                        \
>              (hfeatures->__field)++;                \
>          } else {                        \
>              csr_write_allowed(__csr, (ulong)&trap, __wrval);\
>              if (!trap.cause) {                \
> -                if (csr_swap(__csr, val) == __wrval)    \
> +                if (csr_swap(__csr, oldval) == __wrval)    \
>                      (hfeatures->__field)++;        \
>                  else                    \
>                      goto __skip;            \
> --
> 2.25.1
>  
> ---
> BW, Dmitry




