From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 May 2024 17:20:03 +0530
Subject: [PATCH 7/7] lib: sbi: sse: check handler entry to belong to
 supervisor mode
In-Reply-To: <20240409100216.263256-8-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com> <20240409100216.263256-8-cleger@rivosinc.com>
Message-ID: <CAAhSdy0yhF5S9-e2-amL0NSZdLU1gqZOXgAU0RKq+TCwUYd8SA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 9, 2024 at 3:32?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> When registering an SSE event, check for the handler_entry_pc to belong
> to supervisor mode domain using sbi_domain_check_addr_range().
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> Reported-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_sse.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index 85137c2..8724f76 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -959,6 +959,12 @@ int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
>         if (handler_entry_pc & 0x1)
>                 return SBI_EINVAL;
>
> +       if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
> +                                        handler_entry_pc,
> +                                        sizeof(unsigned long), PRV_S,
> +                                        SBI_DOMAIN_EXECUTE))
> +               return SBI_EINVALID_ADDR;
> +
>         e = sse_event_get(event_id);
>         if (!e)
>                 return SBI_EINVAL;
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

