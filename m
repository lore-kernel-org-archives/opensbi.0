From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 12 Apr 2021 08:16:19 +0000
Subject: [PATCH] docs: fix link to OpenPiton documentation
In-Reply-To: <20210410120803.238457-1-georgedanielmangum@gmail.com>
References: <20210410120803.238457-1-georgedanielmangum@gmail.com>
Message-ID: <DM6PR04MB62011C037726DCA94ED964288D709@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> hasheddan
> Sent: 10 April 2021 17:38
> To: opensbi at lists.infradead.org
> Cc: hasheddan <georgedanielmangum@gmail.com>
> Subject: [PATCH] docs: fix link to OpenPiton documentation
> 
> Updates link in platforms documentation to point to the correct OpenPiton
> document.
> 
> Signed-off-by: hasheddan <georgedanielmangum@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> ---
>  docs/platform/platform.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/platform/platform.md b/docs/platform/platform.md index
> 7f47068..8ee8754 100644
> --- a/docs/platform/platform.md
> +++ b/docs/platform/platform.md
> @@ -36,7 +36,7 @@ OpenSBI currently supports the following virtual and
> hardware platforms:
> 
>  * **OpenPiton FPGA SoC**: Platform support OpenPiton research platform
> based
>    on ariane core. More details on this platform can be found in the file
> -  *[fpga_openpiton.md]*.
> +  *[fpga-openpiton.md]*.
> 
>  * **Shakti C-class SoC Platform**: Platform support for Shakti C-class
>    processor based SOCs. More details on this platform can be found in the
> @@ -55,5 +55,5 @@ facilitate the implementation.
>  [andes-ae350.md]: andes-ae350.md
>  [thead-c910.md]: thead-c910.md
>  [spike.md]: spike.md
> -[fpga_openpiton.md]: fpga_openpiton.md
> +[fpga-openpiton.md]: fpga-openpiton.md
>  [shakti_cclass.md]: shakti_cclass.md
> --
> 2.25.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

