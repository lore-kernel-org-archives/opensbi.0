From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 22 Jun 2021 15:00:55 +0000
Subject: [PATCH 1/1] lib: sign conflict in wake_coldboot_harts()
In-Reply-To: <559b27560791d7387f04105482b203396595b2ed.camel@126.com>
References: <20210621193754.31845-1-xypron.glpk@gmx.de>
 <559b27560791d7387f04105482b203396595b2ed.camel@126.com>
Message-ID: <C4037A00-0FD5-4F9F-A3B4-1555A22DCC42@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 22/06/21, 12:13 PM, "Xiang W" <wxjstz@126.com> wrote:

    ? 2021-06-21???? 21:37 +0200?Heinrich Schuchardt???
    > Compiling wake_coldboot_harts() with GCC 11 and -Wextra yields:
    > 
    > lib/sbi/sbi_init.c:208:27:
    > error: comparison of integer expressions of different signedness:
    > ?int? and ?u32? {aka ?unsigned int?} [-Werror=sign-compare]
    >   208 |         for (int i = 0; i <= sbi_scratch_last_hartid(); i++)
    > {
    >       |                           ^~
    > 
    > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
    > 
    Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

    > ---
    >  lib/sbi/sbi_init.c | 2 +-
    >  1 file changed, 1 insertion(+), 1 deletion(-)
    > 
    > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
    > index b158314..e396d95 100644
    > --- a/lib/sbi/sbi_init.c
    > +++ b/lib/sbi/sbi_init.c
    > @@ -205,7 +205,7 @@ static void wake_coldboot_harts(struct
    > sbi_scratch *scratch, u32 hartid)
    >         spin_lock(&coldboot_lock);
    > 
    >         /* Send an IPI to all HARTs waiting for coldboot */
    > -       for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
    > +       for (u32 i = 0; i <= sbi_scratch_last_hartid(); i++) {
    >                 if ((i != hartid) &&
    >                     sbi_hartmask_test_hart(i, &coldboot_wait_hmask))
    >                         sbi_ipi_raw_send(i);
    > --
    > 2.30.2
    > 
    > 



