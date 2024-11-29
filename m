From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Nov 2024 08:44:44 +0530
Subject: [PATCH 0/2] lib: sbi: fixes a few SSE errors
In-Reply-To: <20241125105303.1113607-1-cleger@rivosinc.com>
References: <20241125105303.1113607-1-cleger@rivosinc.com>
Message-ID: <CAAhSdy2RVh63sp=Yh7=hOuoOFnMmTsyA6D_3D6e_9qx38YT9cg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 4:24?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> While reviewing kvm-unit-tests, Andrew Jones found a few implementation
> errors. This small series fixes them.
>
> Cl?ment L?ger (2):
>   lib: sbi: fix GLOBAL_PLAT_DEFINE
>   lib: sbi: sse: Fix a6 and a7 register content upon injection

Do you have corresponding changes in Linux SSE implementation ?

Recently, we had found few more issues and fixed the Linux SSE
implementation which is available in dev-upstream branch at:
https://github.com/ventanamicro/linux.git

Particularly, the Linux SSE entry/exit was not saving and restoring
sscratch CSR in all paths which caused the kernel to crash in certain
cases. The above mentioned branch already has the fix for it.

Regards,
Anup

