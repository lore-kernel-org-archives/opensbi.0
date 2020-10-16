From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 16 Oct 2020 16:31:23 -0700
Subject: [PATCH 5/5] platform: kendryte/k210: Add some padding for FDT
 fixups
In-Reply-To: <20201015081211.1956554-6-anup.patel@wdc.com>
References: <20201015081211.1956554-1-anup.patel@wdc.com>
 <20201015081211.1956554-6-anup.patel@wdc.com>
Message-ID: <CAOnJCUJrebru+LWfZrUmBzOTbGdmJ-uy9D3wwmGZUaS7QmDhvw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2020 at 1:13 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The Kendryte K210 platform has built-in DTB and does not provides
> FW_PAYLOAD_FDT_ADDR. This means the FDT fixups will be done on
> the built-in DTB in absence of FW_PAYLOAD_FDT_ADDR. This patch
> adds some padding in built-in DTB for FDT fixups.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  platform/kendryte/k210/objects.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/platform/kendryte/k210/objects.mk b/platform/kendryte/k210/objects.mk
> index 106f9f2..b74da74 100644
> --- a/platform/kendryte/k210/objects.mk
> +++ b/platform/kendryte/k210/objects.mk
> @@ -11,3 +11,4 @@ platform-objs-y += platform.o
>
>  platform-objs-y += k210.o
>  platform-varprefix-k210.o = dt_k210
> +platform-padding-k210.o = 2048
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

