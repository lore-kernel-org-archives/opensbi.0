From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Wed, 13 Jan 2021 19:44:20 +0000
Subject: [PATCH 2/3] include: sbi: No need to pack struct sbi_scratch
In-Reply-To: <20210113100657.809754-3-anup.patel@wdc.com>
References: <20210113100657.809754-1-anup.patel@wdc.com>
 <20210113100657.809754-3-anup.patel@wdc.com>
Message-ID: <07d593bd32779db57abd0daa5c8cba707e79137e.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-01-13 at 15:36 +0530, Anup Patel wrote:
> All members in struct sbi_scrach are of machine word size so no need
> to pack this structure. This also allows GCC to generate more
> optimized
> instruction sequence when accessing members of struct sbi_scratch.
> 
> Reported-by: Paul Campbell <taniwha@gmail.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> ?include/sbi/sbi_scratch.h | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index e7079f5..e35122b 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -71,7 +71,7 @@ struct sbi_scratch {
> ????????unsigned long tmp0;
> ????????/** Options for OpenSBI library */
> ????????unsigned long options;
> -} __packed;
> +};
> ?
> ?/** Possible options for OpenSBI library */
> ?enum sbi_scratch_options {

