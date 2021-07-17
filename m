From: Anup Patel <anup@brainfault.org>
Date: Sat, 17 Jul 2021 17:47:27 +0530
Subject: [PATCH 1/1] firware: use __SIZEOF_LONG__ for field offsets in
 fw_dynamic.h
In-Reply-To: <CAEUhbmX1tNa5NRjxfhiYMX0eoy_1iqKyURQJDkiyUCEGODY=fg@mail.gmail.com>
References: <20210712092405.6772-1-Alexander.Richardson@cl.cam.ac.uk>
 <CAEUhbmX1tNa5NRjxfhiYMX0eoy_1iqKyURQJDkiyUCEGODY=fg@mail.gmail.com>
Message-ID: <CAAhSdy1HhNybVefGag=zszJiAnUBOcPW3Y5qKHQ+k2PvP3ORVA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 12, 2021 at 6:38 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jul 12, 2021 at 5:25 PM Alex Richardson
> <Alexander.Richardson@cl.cam.ac.uk> wrote:
> >
> > The fields are of type unsigned long and are not pointers. While this
> > happens to be the same for RV32/RV64, it is not correct when compiling
> > for a CHERI-RISC-V system where pointers are twice the size of long.
> >
> > Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
> > ---
> >  include/sbi/fw_dynamic.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

