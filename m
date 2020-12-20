From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 20 Dec 2020 04:26:42 +0000
Subject: [PATCH] lib: sbi: Fix sign-extension in
 sbi_misaligned_load_handler()
In-Reply-To: <20201220041737.4113-1-anup.patel@wdc.com>
References: <20201220041737.4113-1-anup.patel@wdc.com>
Message-ID: <B5BC4C34-F6F9-436A-ABA7-151098881DEE@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> --- a/lib/sbi/sbi_misaligned_ldst.c
> +++ b/lib/sbi/sbi_misaligned_ldst.c
> @@ -128,7 +128,7 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> 	}
> 
> 	if (!fp)
> -		SET_RD(insn, regs, val.data_ulong << shift >> shift);
> +		SET_RD(insn, regs, (long)val.data_ulong << shift >> shift);

Left-shifting is undefined behaviour if it sets the sign bit, so a
standards-conforming C compiler is free to ignore the cast entirely
and assume the intermediate left-shifted value is non-negative.

Jess


