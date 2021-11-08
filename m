From: Guo Ren <guoren@linux.alibaba.com>
Date: Mon, 8 Nov 2021 14:29:02 +0800
Subject: [PATCH v2] lib: utils/irqchip: Automatically delegate T-HEAD PLIC
 access
In-Reply-To: <CAAhSdy2ZXWZP2bGEmicWrs7zUWPc-kMgsUMC6v5qJ3Y_NnJkFw@mail.gmail.com>
References: <20211018053350.39184-1-samuel@sholland.org>
 <CAAhSdy0y4LXy0NCZMo+r7_YWJRp5D+1C3eNt9huk7S8UGzFF6Q@mail.gmail.com>
 <87v918hucp.fsf@dell.be.48ers.dk>
 <CAAhSdy2ZXWZP2bGEmicWrs7zUWPc-kMgsUMC6v5qJ3Y_NnJkFw@mail.gmail.com>
Message-ID: <e1abedd6-1b0b-10e0-df33-af9b9b5dfe01@linux.alibaba.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2021/11/4 ??10:36, Anup Patel wrote:
> On Thu, Nov 4, 2021 at 7:54 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>>> "Anup" == Anup Patel <anup@brainfault.org> writes:
>> Hi,
>>
>>   > On Mon, Oct 18, 2021 at 11:04 AM Samuel Holland <samuel@sholland.org> wrote:
>>   >>
>>   >> The T-HEAD PLIC implementation requires setting a delegation bit
>>   >> to allow access from S-mode. Now that the T-HEAD PLIC has its own
>>   >> compatible string, set this bit automatically from the PLIC driver,
>>   >> instead of reaching into the PLIC's MMIO space from another driver.
>>   >>
>>   >> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>   >>
>>   >> ---
>>   >>
>>   >> Changes in v2:
>>   >> - Use the thead,c900-plic compatible instead of the D1 compatible.
>>   >> - Also apply this change to other T-HEAD device tree examples.
>>   >> - Remove the plic-delegate code from the thead,reset-sample driver.
>>   >> - Drop the return value from thead_plic_plat_init().
>>
>>   > Looks good to me.
>>
>>   > Reviewed-by: Anup Patel <anup.patel@wdc.com>
>>
>>   > Applied this patch to the riscv/opensbi repo.
>>
>> ..
>>
>>   >> static const struct fdt_match irqchip_plic_match[] = {
>>   >> { .compatible = "riscv,plic0" },
>>   >> { .compatible = "sifive,plic-1.0.0" },
>>   >> +       { .compatible = "thead,c900-plic",
>>   >> +         .data = thead_plic_plat_init },
>>   >> { },
>>   >> };
>>
>> Sorry, old thread but I just noticed now that the thead,c900-plic
>> compatible should ideally have been before the sifive one, so DTBs with
>> both compatibles behave correctly (drivers are matched according to the
>> order of the driver compatible, NOT the order of the compatible in the
>> DTB).
> Based on discussions on LKML, the T-HEAD PLIC is not compliant with
> RISC-V PLIC (and SiFive PLIC) so SiFive compatible string should not
> be used for any T-HEAD C9xx based board.
>
> @Guo Ren I see that you have dropped the DT bindings patch in your
> recent patch. You need to include the DT bindings patch in your kernel
> series.
Okay
>
> Regards,
> Anup
>
>> --
>> Bye, Peter Korsgaard
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi


