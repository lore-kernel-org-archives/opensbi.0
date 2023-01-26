From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 26 Jan 2023 06:48:49 +0000
Subject: [PATCH v3 5/5] Add two entries:
In-Reply-To: <c37ea578-6048-12d7-911a-0ac751e17792@sholland.org>
References: <20230119151826.59697-1-hchauhan@ventanamicro.com>
 <20230119151826.59697-6-hchauhan@ventanamicro.com>
 <CA+V-a8u0vhfD8Bqus0bx4guwYo5+EQufB7fvf3JxZ-DooqksPQ@mail.gmail.com>
 <1C640FDA-840C-4018-A44A-089D833B33D2@jrtc27.com>
 <CE80FC13-AC30-45A1-AD53-CDF13EE4CE5B@jrtc27.com>
 <CA+V-a8v+txgCQmo60j3Vvq5xkMddx9g87B7seGq_LB3vmZLXEQ@mail.gmail.com>
 <383241D7-283F-4C9E-A203-607F1880FAB2@jrtc27.com>
 <908B5532-D994-4359-A605-DA5A0CC359FB@jrtc27.com>
 <c37ea578-6048-12d7-911a-0ac751e17792@sholland.org>
Message-ID: <3A3708D9-3437-4BB1-A800-01F0966ACF71@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26 Jan 2023, at 04:41, Samuel Holland <samuel@sholland.org> wrote:
> On 1/25/23 15:06, Jessica Clarke wrote:
>> On 25 Jan 2023, at 20:56, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>> 
>>> On 25 Jan 2023, at 20:53, Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>>> 
>>>> Hi,
>>>> 
>>>> Thank you for the feedback.
>>>> 
>>>> On Wed, Jan 25, 2023 at 8:36 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>> 
>>>>> On 25 Jan 2023, at 20:14, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>>> 
>>>>>> On 25 Jan 2023, at 19:42, Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>>>>>> 
>>>>>>> Hi Himanshu,
>>>>>>> 
>>>>>>> On Thu, Jan 19, 2023 at 3:19 PM Himanshu Chauhan
>>>>>>> <hchauhan@ventanamicro.com> wrote:
>>>>>>>> 
>>>>>>>> 1. TEXT: fw_start to _fw_rw_offset with RX permissions
>>>>>>>> 2. DATA: _fw_rw_offset to fw_size with RW permissions
>>>>>>>> 
>>>>>>>> These permissions are still not enforced from M-mode but lay
>>>>>>>> the ground work for enforcing them for M-mode. SU-mode don't
>>>>>>>> have any access to these regions.
>>>>>>>> 
>>>>>>>> Sample output:
>>>>>>>> Domain0 Region01  : 0x0000000080000000-0x000000008001ffff M: (R,X) S/U: ()
>>>>>>>> Domain0 Region02  : 0x0000000080020000-0x000000008003ffff M: (R,W) S/U: ()
>>>>>>>> 
>>>>>>>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>>>>>>>> ---
>>>>>>>> lib/sbi/sbi_domain.c | 24 ++++++++++++++++++++++--
>>>>>>>> 1 file changed, 22 insertions(+), 2 deletions(-)
>>>>>>>> 
>>>>>>> After updating to the latest master, RZ/Five SoC doesn't boot up.
>>>>>>> Bisecting pointed me to this commit 230278d "lib: sbi: Add separate
>>>>>>> entries for firmware RX and RW regions"
>>>>>>> 
>>>>>>> I get no prints from OpenSBI ; the only prints I get are from SPL.
>>>>>>> After reverting this patch I get RZ/Five working as expected (log
>>>>>>> below). Do you see any reason why this fails on RZ/Five ?
>>>>>>> 
>>>>>>> U-Boot SPL 2023.01-00206-g1026336bc6 (Jan 25 2023 - 19:36:23 +0000)
>>>>>>> Trying to boot from NOR
>>>>>>> 
>>>>>>> OpenSBI v1.2-40-g031b6db
>>>>>>> ____                    _____ ____ _____
>>>>>>> / __ \                  / ____|  _ \_   _|
>>>>>>> | |  | |_ __   ___ _ __ | (___ | |_) || |
>>>>>>> | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>>>>>>> | |__| | |_) |  __/ | | |____) | |_) || |_
>>>>>>> \____/| .__/ \___|_| |_|_____/|____/_____|
>>>>>>>    | |
>>>>>>>    |_|
>>>>>>> 
>>>>>>> Platform Name             : Renesas SMARC EVK based on r9a07g043f01
>>>>>>> Platform Features         : medeleg
>>>>>>> Platform HART Count       : 1
>>>>>>> Platform IPI Device       : andes_plicsw
>>>>>>> Platform Timer Device     : andes_plmt @ 12000000Hz
>>>>>>> Platform Console Device   : renesas_scif
>>>>>>> Platform HSM Device       : ---
>>>>>>> Platform PMU Device       : ---
>>>>>>> Platform Reboot Device    : ---
>>>>>>> Platform Shutdown Device  : ---
>>>>>>> Firmware Base             : 0x44000000
>>>>>>> Firmware Size             : 228 KB
>>>>>>> Firmware RW Offset        : 0xffffffffc4020000
>>>>>> 
>>>>>> This is clearly nonsense. What does readelf -Ws show for _fw_rw_offset?
>>>>>> 
>>>>>> Worth noting that 0x44000000 + 0xffffffffc4020000 = 0x8020000, so it
>>>>>> sounds like relocation inconsistency to me somehow?
>>>>> 
>>>>> Ok, figured it out, this is an LLD vs BFD linker script difference. For
>>>>> whatever reason, BFD decides that . - _fw_start is not an absolute
>>>>> address, whereas LLD gives you the more sensible (or at least what we
>>>>> want here) behaviour, probably because . = in the various output
>>>>> section statements makes it a relative address, but _fw_start remains
>>>>> absolute, and so it thinks you?re trying to compute relative -
>>>>> absolute, which gives a relative address. This then means that the
>>>>> value located at __fw_rw_offset is subject to relocation and so loading
>>>>> at an address other than 0x80000000 breaks things like you see (your
>>>>> observed _fw_rw_offset value is out by 0x44000000 - 0x80000000). The
>>>>> following diff should fix it (I?ve verified it with a toy example with
>>>>> BFD that reproduced the symbol not being absolute); let me know if it
>>>>> does and I?ll make a proper patch out of it.
>>>>> 
>>>>> Jess
>>>>> 
>>>>> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
>>>>> index 9a1304e..918357d 100644
>>>>> --- a/firmware/fw_base.ldS
>>>>> +++ b/firmware/fw_base.ldS
>>>>> @@ -64,7 +64,7 @@
>>>>>      . = ALIGN(1 << LOG2CEIL((SIZEOF(.rodata) + SIZEOF(.text)
>>>>>                              + SIZEOF(.dynsym) + SIZEOF(.rela.dyn))));
>>>>> 
>>>>> -       PROVIDE(_fw_rw_offset = (.  - _fw_start));
>>>>> +       PROVIDE(_fw_rw_offset = ABSOLUTE(. - _fw_start));
>>>>> 
>>>>>      /* Beginning of the read-write data sections */
>>>>> 
>>>>> 
>>>> I did try the above diff and was able to see the same issue.
>>>> 
>>>> After this change:
>>>> readelf -Ws build/platform/generic/firmware/fw_dynamic.elf | grep -w
>>>> _fw_rw_offset
>>>> 805: 0000000000020000     0 NOTYPE  GLOBAL DEFAULT  ABS _fw_rw_offset
>>>> 
>>>> Before this change:
>>>> $ readelf -Ws build/platform/generic/firmware/fw_dynamic.elf | grep -w
>>>> _fw_rw_offset
>>>> 805: 0000000000020000     0 NOTYPE  GLOBAL DEFAULT    8 _fw_rw_offset
>>> 
>>> Are you sure you tested the new file? That looks like the exact change
>>> I was intending and should have an effect at run time on platforms that
>>> load OpenSBI to an address other than 0x80000000 (well, whatever the
>>> config set FW_TEXT_START to, which is that for generic by default).
>> 
>> I guess you could be getting further and hanging for some other reason.
>> Despite the sbi_printf calls, sbi_domain_init will never actually print
>> anything, because it?s run before sbi_console_init and thus the prints
>> are just slow no-ops.
>> 
>> What do you see with the problematic patch reverted but my fix applied?
> 
> The same patch breaks booting for me as well on Allwinner D1. I get the
> same value reported with or without your linker script change:
> 
> Firmware RW Offset        : 0xffffffffc0020000
> 
> (OpenSBI is loaded at 0x40000000)

Ok, so it seems BFD just does totally nonsensical things for SHN_ABS
symbols when producing position-independent outputs (both -pie and
-shared) for various historical reasons, and so SHN_ABS symbols are
still subject to relocation as far as BFD is concerned (except AArch64,
which fixes it in limited cases that don?t apply here...). I think the
only way to make this work with BFD is:

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index e04b683..fb6ac92 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -526,7 +526,7 @@ _link_start:
 _link_end:
 	RISCV_PTR	_fw_reloc_end
 __fw_rw_offset:
-	RISCV_PTR	_fw_rw_offset
+	RISCV_PTR	_fw_rw_start - _fw_start
 
 	.section .entry, "ax", %progbits
 	.align 3
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 9a1304e..3d68484 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -64,7 +64,7 @@
 	. = ALIGN(1 << LOG2CEIL((SIZEOF(.rodata) + SIZEOF(.text)
 				+ SIZEOF(.dynsym) + SIZEOF(.rela.dyn))));
 
-	PROVIDE(_fw_rw_offset = (.  - _fw_start));
+	PROVIDE(_fw_rw_start = .);
 
 	/* Beginning of the read-write data sections */
 

Jess


