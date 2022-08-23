From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Aug 2022 09:18:42 +0530
Subject: [PATCH v4] lib: utils: serial: Add Cadence UART driver
In-Reply-To: <20220822083817.huwicyk7gc4p4miq@kamzik>
References: <20220817154056.543158-1-junliang.tan@linux.starfivetech.com>
 <CAAhSdy1WXjWVEoA6gxGUWm5NtZeFGZbzu500Q4Rkv4hxxWiW+g@mail.gmail.com> <20220822083817.huwicyk7gc4p4miq@kamzik>
Message-ID: <CAAhSdy0+URfDDmYXCRh1zz04U6QQ9eSbKm-0XbaZ-4Xk28Wc6g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 22, 2022 at 2:08 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Aug 22, 2022 at 08:38:40AM +0530, Anup Patel wrote:
> > On Wed, Aug 17, 2022 at 9:11 PM Jun Liang Tan
> > <junliang.tan@linux.starfivetech.com> wrote:
> > >
> > > Add Cadence UART driver
> > >
> > > Signed-off-by: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> > > Signed-off-by: Wei Liang Lim <weiliang.lim@linux.starfivetech.com>
> >
> > Overall, this looks good except the divide-by-zero question raised by
> > other folks in uart_min_clk_divisor().
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
>
> Hi Anup,
>
> I don't think there's an issue with the baud divisor calculation.
> The manual[1] I looked at for this UART states
>
>  baud_rate = sel_clk / (CD * (BDIV + 1)
>
> which is the same as the sifive calculation except for the additional
> 'CD' term.
>
> However this driver sets CD == 1, which reduces it to the exact same
> as the sifive calculation.
>
> So the '- 1' in the calculation is correct, as just comes from the
> algebra applied to get BDIV.
>
> [*] https://docs.xilinx.com/v/u/en-US/ug585-Zynq-7000-TRM

Thanks for the explanation Drew.

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

