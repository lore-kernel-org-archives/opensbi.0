From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 1 Oct 2020 15:40:20 +0000
Subject: [PATCH 1/1] firmware: provide space for firmware fixups
In-Reply-To: <77381bd1-e96a-ae67-0250-26f0690cd9aa@gmx.de>
References: <20201001102836.15622-1-xypron.glpk@gmx.de>
 <DM6PR04MB6201E6C1A30CD6930F472DF78D300@DM6PR04MB6201.namprd04.prod.outlook.com>
 <a499577f-9377-61c2-aae7-2acda489ac14@gmx.de>
 <DM6PR04MB6201F578219E66A9DFA961498D300@DM6PR04MB6201.namprd04.prod.outlook.com>
 <77381bd1-e96a-ae67-0250-26f0690cd9aa@gmx.de>
Message-ID: <DM6PR04MB6201CC1A1241F58AEE15BA368D300@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: 01 October 2020 19:46
> To: Anup Patel <Anup.Patel@wdc.com>; Atish Patra
> <Atish.Patra@wdc.com>
> Cc: OpenSBI List <opensbi@lists.infradead.org>; Atish Patra
> <atishp@atishpatra.org>
> Subject: Re: [PATCH 1/1] firmware: provide space for firmware fixups
> 
> On 01.10.20 14:08, Anup Patel wrote:
> >
> >
> >> -----Original Message-----
> >> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >> Sent: 01 October 2020 16:55
> >> To: Anup Patel <Anup.Patel@wdc.com>; Atish Patra
> >> <Atish.Patra@wdc.com>
> >> Cc: OpenSBI List <opensbi@lists.infradead.org>; Atish Patra
> >> <atishp@atishpatra.org>
> >> Subject: Re: [PATCH 1/1] firmware: provide space for firmware fixups
> >>
> >> On 01.10.20 12:56, Anup Patel wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> >>>> Heinrich Schuchardt
> >>>> Sent: 01 October 2020 15:59
> >>>> To: Atish Patra <Atish.Patra@wdc.com>
> >>>> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>; OpenSBI List
> >>>> <opensbi@lists.infradead.org>; Atish Patra <atishp@atishpatra.org>
> >>>> Subject: [PATCH 1/1] firmware: provide space for firmware fixups
> >>>>
> >>>> We expand the provided device tree by up to 1056 bytes in fixup
> >> operations.
> >>>> This space must be allocated in the firmware binary.
> >>>>
> >>>> An alternative approach would be to allocate RAM for a copy of the
> >>>> device tree but we do not have library functions for dynamic memory
> >> allocation yet.
> >>>>
> >>>> Without this patch devicetree fixups lead to memory corruption.
> >>>>
> >>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >>>> ---
> >>>>  firmware/fw_payload.S | 2 ++
> >>>>  scripts/d2c.sh        | 3 +++
> >>>>  2 files changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S index
> >>>> 9805d8c..fdd082f 100644
> >>>> --- a/firmware/fw_payload.S
> >>>> +++ b/firmware/fw_payload.S
> >>>> @@ -108,6 +108,8 @@ fw_options:
> >>>>  	.globl fdt_bin
> >>>>  fdt_bin:
> >>>>  	.incbin	FW_PAYLOAD_FDT_PATH
> >>>> +	/* space for device tree updates */
> >>>> +	. = . + 0x420;
> >>>>  #endif
> >>>
> >>> We should not add arbitrary padding like this. Instead we should
> >>> have separate FW_PAYLOAD_FDT_PADDING options for config.mk.
> >>>
> >>>>
> >>>>  	.section .payload, "ax", %progbits diff --git a/scripts/d2c.sh
> >>>> b/scripts/d2c.sh index 821a995..1c53a71
> >>>> 100755
> >>>> --- a/scripts/d2c.sh
> >>>> +++ b/scripts/d2c.sh
> >>>> @@ -62,6 +62,9 @@ printf "const char __attribute__((aligned(%s)))
> >>>> %s_start[] = {\n" "${OUTPUT_C_AL
> >>>>
> >>>>  od -v -t x1 -An ${INPUT_PATH} | awk '{for (i=1; i<=NF; i++) printf "
> >>>> 0x%s,", $i; printf "\n"; }'
> >>>>
> >>>> +# Add 1056 bytes for device tree fixups echo dummy | awk '{for
> >>>> +(j=1; j<=0x42; j++) {for (i=1; i<=0x10; i++) printf " 0x00,"; printf "\n"}; }'
> >>>> +
> >>>
> >>> Here again, we should not have arbitrary padding. Instead:
> >>> 1) Add optional parameter to d2c.sh for amount of padding required
> >>> 2) In platform/kendryte/k210/objects.mk, add line "platform-padding-
> >> k210.o = 1056"
> >>
> >> This numbers 1024 and 32 is defined by lib/utils/fdt/fdt_fixup.c. I
> >> understand why defining constants makes sense. These constants may be
> >> used on platform level but should not be defined there but in an
> >> include or common Makefile.
> >
> > The FDT fixups will keep changing over-time so common makefile
> > variable for amount of padding in lib/utils/fdt/objects.mk is fine.
> >
> >>
> >>> 3) Extend "compile_d2c" and make rule to convert .dtb to .c file in
> >>> toplevel Makfile
> >>>
> >>>>  printf "};\n"
> >>>>
> >>>>  printf "const unsigned long %s_size = sizeof(%s_start);\n"
> >>>> "${OUTPUT_C_PREFIX}" "${OUTPUT_C_PREFIX}"
> >>
> >> We already have firmware/fw_payload.S including
> FW_PAYLOAD_FDT_PATH.
> >> Shouldn't we unify the way device trees are included in the firmware.
> >> We could define a new variable defined by FW_PAYLOAD_FDT_PATH with
> a
> >> fallback to a platform device tree.
> >
> > FW_PAYLOAD_FDT_PATH has limitations. The d2c.sh approach is more
> > flexible and allows having multiple built-in DTBs whereas we can only
> > include one DTB with FW_PAYLOAD_FDT_PATH. Also, the
> > FW_PAYLOAD_FDT_PATH
> 
> Do you have an example with multiple dtbs? Will each of the dtbs need a
> fixup? Is the idea that OpenSBI will determine the relevant dtb at runtime?

Let's say we have two DTS  (k210-board1.dts and k210-board2.dts) for same
Kendryte K210 SOC but different boards then both DTS can be linked with
platform objects.mk as follows:

platform-objs-y += k210-board1.o
platform-varprefix-k210-board1.o = dt_k210_board1
platform-objs-y += k210-board2.o
platform-varprefix-k210-board2.o = dt_k210_board2

The OpenSBI kendyte k210 platform can select appropriate built-in DTB
in fw_platform_init() based on some pinstrap or some other way.

We certainly don't need to fixup all built-in DTBs. Only the selected
built-in DTB will be fixed-up.

Regards,
Anup
