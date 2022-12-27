From: Samuel Holland <samuel@sholland.org>
Date: Tue, 27 Dec 2022 12:22:22 -0600
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
 <374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
 <CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
 <87cz85dmmd.fsf@igel.home>
 <CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
Message-ID: <da726834-79af-8e40-c39e-a6dd4c421ea4@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/27/22 07:13, Bin Meng wrote:
> On Tue, Dec 27, 2022 at 9:04 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>
>> On Dez 27 2022, Bin Meng wrote:
>>
>>> Changing the array size to PLIC_SOURCES + 1 does not make sense. The
>>> PLIC_SOURCES should be 176 which is correct as it includes source 0 on
>>> the Allwinner SoC. The "riscv,ndev" [1] should not be 176 otherwise it
>>> will create a buffer overrun.
>>
>> The range check will always allow that overrrun.
>>
> 
> Well, with a correct dtb it doesn't.

No, the bug has nothing at all to do with the DTB. The bug is purely in
the C code.

> Strictly speaking, your proposed fix allows that overrun too, if the
> given num is an arbitrary larger value than the size of the priority
> array.

This is already what you are doing! You have:

	static u8 plic_priority[PLIC_SOURCES];

and

	fdt_plic_priority_save(plic_priority, PLIC_SOURCES);

The combination of those two lines is necessarily incorrect. Because you
dereference priority[num], the number of elements in the array *must* be
greater than num.

Since the range of external interrupt sources is [1, 175], the
definitions need to be:

#define PLIC_SOURCES                    175
#define PLIC_IE_WORDS                   ((PLIC_SOURCES / 32) + 1)

static u8 plic_priority[1 + PLIC_SOURCES];

Anything else is either wrong or wasting space.

Regards,
Samuel


