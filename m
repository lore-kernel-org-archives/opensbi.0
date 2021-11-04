From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Nov 2021 15:24:22 +0100
Subject: [PATCH v2] lib: utils/irqchip: Automatically delegate T-HEAD PLIC
 access
In-Reply-To: <CAAhSdy0y4LXy0NCZMo+r7_YWJRp5D+1C3eNt9huk7S8UGzFF6Q@mail.gmail.com>
 (Anup Patel's message of "Thu, 21 Oct 2021 10:10:08 +0530")
References: <20211018053350.39184-1-samuel@sholland.org>
 <CAAhSdy0y4LXy0NCZMo+r7_YWJRp5D+1C3eNt9huk7S8UGzFF6Q@mail.gmail.com>
Message-ID: <87v918hucp.fsf@dell.be.48ers.dk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Anup" == Anup Patel <anup@brainfault.org> writes:

Hi,

 > On Mon, Oct 18, 2021 at 11:04 AM Samuel Holland <samuel@sholland.org> wrote:
 >> 
 >> The T-HEAD PLIC implementation requires setting a delegation bit
 >> to allow access from S-mode. Now that the T-HEAD PLIC has its own
 >> compatible string, set this bit automatically from the PLIC driver,
 >> instead of reaching into the PLIC's MMIO space from another driver.
 >> 
 >> Signed-off-by: Samuel Holland <samuel@sholland.org>
 >> 
 >> ---
 >> 
 >> Changes in v2:
 >> - Use the thead,c900-plic compatible instead of the D1 compatible.
 >> - Also apply this change to other T-HEAD device tree examples.
 >> - Remove the plic-delegate code from the thead,reset-sample driver.
 >> - Drop the return value from thead_plic_plat_init().

 > Looks good to me.

 > Reviewed-by: Anup Patel <anup.patel@wdc.com>

 > Applied this patch to the riscv/opensbi repo.

..

 >> static const struct fdt_match irqchip_plic_match[] = {
 >> { .compatible = "riscv,plic0" },
 >> { .compatible = "sifive,plic-1.0.0" },
 >> +       { .compatible = "thead,c900-plic",
 >> +         .data = thead_plic_plat_init },
 >> { },
 >> };

Sorry, old thread but I just noticed now that the thead,c900-plic
compatible should ideally have been before the sifive one, so DTBs with
both compatibles behave correctly (drivers are matched according to the
order of the driver compatible, NOT the order of the compatible in the
DTB).

-- 
Bye, Peter Korsgaard

