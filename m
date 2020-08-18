From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 18 Aug 2020 17:16:15 +0800
Subject: [PATCH v3 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldboot_lock
In-Reply-To: <20200818040728.528426-1-anup.patel@wdc.com>
References: <20200818040728.528426-1-anup.patel@wdc.com>
Message-ID: <CAEUhbmU45KSuduO5p+L_N1g+9zcJpJ_NLYZL2V7ub=ReBjT5cg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 18, 2020 at 12:09 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We can have thundering hurd problem with coldboot_lock where the
> boot HART can potentially starve trying to acquire coldboot_lock
> because some of the non-boot HARTs are continuously acquiring and
> releasing coldboot_lock. This can happen if MIP.MSIP bit is already
> set for some of the non-boot HARTs.
>
> To avoid thundering hurd problem for coldboot_lock, we use the
> __smp_load_acquire() and __smp_store_release() for coldboot_done
> flag and use coldboot_lock only for coldboot_wait_hmask.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_init.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

