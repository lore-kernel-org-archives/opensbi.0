From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jan 2023 17:15:22 +0530
Subject: [PATCH v2 9/9] docs: Update domain's region permissions and requirements
In-Reply-To: <20230109052043.55473-10-hchauhan@ventanamicro.com>
References: <20230109052043.55473-1-hchauhan@ventanamicro.com> <20230109052043.55473-10-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy0F+=86tyeXP_02xtoxgYbFmiFc8BRquVNXN3oU3iLSoQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 10:51 AM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Updated the various permissions bits available for domains
> defined in DT node and restrictions on them.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  docs/domain_support.md | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index 8963b57..11a4dee 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -160,8 +160,16 @@ The DT properties of a domain instance DT node are as follows:
>  * **regions** (Optional) - The list of domain memory region DT node phandle
>    and access permissions for the domain instance. Each list entry is a pair
>    of DT node phandle and access permissions. The access permissions are
> -  represented as a 32bit bitmask having bits: **readable** (BIT[0]),
> -  **writeable** (BIT[1]), **executable** (BIT[2]), and **m-mode** (BIT[3]).
> +  represented as a 32bit bitmask having bits: **M readable** (BIT[0]),
> +  **M writeable** (BIT[1]), **M executable** (BIT[2]), **SU readable**
> +  (BIT[3]), **SU writable** (BIT[4]), and **SU executable** (BIT[5]).
> +  The enforce permission bit (BIT[6]), if set, will lock the permissions
> +  in the PMP. This will enforce the permissions on M-mode as well which
> +  otherwise will have unrestricted access. This bit must be used with
> +  caution because no changes can be made to a PMP entry once its locked
> +  until the hart is reset.
> +  Any region of a domain defined in DT node cannot have only M-bits set
> +  in access permissions i.e. it cannot be an m-mode only accessible region.
>  * **boot-hart** (Optional) - The DT node phandle of the HART booting the
>    domain instance. If coldboot HART is assigned to the domain instance then
>    this DT property is ignored and the coldboot HART is assumed to be the
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

