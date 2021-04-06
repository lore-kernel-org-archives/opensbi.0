From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 6 Apr 2021 05:05:48 +0000
Subject: [PATCH v3 1/3] include: types: Add __aligned(x) to define the
 minimum alignement
In-Reply-To: <20210406015354.332780-2-cmuellner@linux.com>
References: <20210406015354.332780-1-cmuellner@linux.com>
 <20210406015354.332780-2-cmuellner@linux.com>
Message-ID: <DM6PR04MB6201AC1EFFFBB8154192FA4C8D769@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Christoph Muellner <cmuellner@linux.com>
> Sent: 06 April 2021 07:24
> To: opensbi at lists.infradead.org; Anup Patel <Anup.Patel@wdc.com>; Guo
> Ren <guoren@kernel.org>; Xiang W <wxjstz@126.com>; Jessica Clarke
> <jrtc27@jrtc27.com>
> Cc: Christoph Muellner <cmuellner@linux.com>
> Subject: [PATCH v3 1/3] include: types: Add __aligned(x) to define the
> minimum alignement
> 
> The __aligned(x) macro is a common wrapper around compiler's aligned
> attribute, which allow to define the minimum alignement of a data type. Let's
> add this macro.
> 
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Thanks,
Anup

> ---
>  include/sbi/sbi_types.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h index
> 0952d5c..38e3565 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -63,6 +63,7 @@ typedef unsigned long		physical_size_t;
> 
>  #define __packed		__attribute__((packed))
>  #define __noreturn		__attribute__((noreturn))
> +#define __aligned(x)		__attribute__((aligned(x)))
> 
>  #define likely(x) __builtin_expect((x), 1)  #define unlikely(x)
> __builtin_expect((x), 0)
> --
> 2.30.2


