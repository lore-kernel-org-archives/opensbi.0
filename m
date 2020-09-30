From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Wed, 30 Sep 2020 13:12:26 +0200
Subject: OpenSBI: Boot HART ISA display
In-Reply-To: <19cc6098-2816-59d6-20b1-c9c19b43354a@gmx.de>
References: <3e977253-0836-e76f-964b-49b7f2541fde@gmx.de>
 <CAOnJCULFvSArogZzzHLN-QW+2D7nPWh7JcxSUcxMOprnJVK-zQ@mail.gmail.com>
 <46daebe0-4099-c2a6-54ab-0010a0317b3e@gmx.de>
 <CAOnJCUKnY0fLZr6OjD5SWF8Fbk8vCQtWgniJanJrGZtPZW3NnQ@mail.gmail.com>
 <01c4c704e0672a755483ca7124ca691047ffc7b7.camel@wdc.com>
 <915a8ca70d5d0ab737d22d6199a9c8ce1b4dd75b.camel@wdc.com>
 <19cc6098-2816-59d6-20b1-c9c19b43354a@gmx.de>
Message-ID: <07f615f0-7f2e-a04c-36d8-ff5395b03194@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 30.09.20 10:45, Heinrich Schuchardt wrote:
> On 30.09.20 10:22, Damien Le Moal wrote:
>> On Wed, 2020-09-30 at 14:08 +0900, Damien Le Moal wrote:
>>> On Tue, 2020-09-29 at 13:38 -0700, Atish Patra wrote:
>>>> On Tue, Sep 29, 2020 at 12:38 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>> On 9/29/20 9:05 PM, Atish Patra wrote:
>>>>>> On Mon, Sep 28, 2020 at 3:18 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>>>> Hello Atish,
>>>>>>>
>>>>>>> on the Kendryte 210 MaixDuino the OpenSBI output line
>>>>>>>
>>>>>>> Boot HART ISA       : rv64cicacsidcacsi
>>>>>>>
>>>>>>> looks a bit strange to me (see full output at the end of the mail).
>>>>>>
>>>>>> Yeah. It doesn't make any sense.
>>>>>>
>>>>>>> Assuming that the characters after rv64 are related to extensions I
>>>>>>> would expect every letter appearing only once.
>>>>>>>
>>>>>>
>>>>>> That's correct. See 3.1.1. Machine ISA Register misa in priv spec.
>>>>>>
>>>>>>> I tried to add sbi_printf() statements to lib/sbi/riscv_asm.c but they
>>>>>>> do not print out correctly.
>>>>>>>

<snip />

In build/platform/kendryte/k210/firmware/fw_payload.bin the string for
the extensions

valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg"

directly follows the embedded device tree:

.......................n........................
....#address-cells.#size-cells.compatible.bootar
gs.device_type.clock-frequency.i-cache-size.d-ca
che-size.mmu-type.reg.riscv,isa.status.#interrup
cells.interrupt-controller.linux,phandle.inter
rupts-extended......iemafdqclbjtpvnsuhkorwxyzg..
.*..z*..t*..n*..h*..b*..\*..V*..P*..J*..D*..>*..

When running fixups the device-tree becomes longer.

Whenever we do device-tree fixups we have to copy the device tree to a
different memory location with enough space for the fixups or we need
the linker script to leave enough space.

If OpenSBI is run from a NOR flash anyway we first have to copy the
device-tree to RAM before we can do any fixup.

Which way should we go:
- allocate space for a copy of the fdt with sbi_scratch_alloc_offset, or
- change the linker script to leave 1 KiB free space after the dtb

Best regards

Heinrich

