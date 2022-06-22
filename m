From: Samuel Holland <samuel@sholland.org>
Date: Wed, 22 Jun 2022 00:31:41 -0500
Subject: [RFC PATCH 2/2] lib: utils/timer: Add a separate compatible for
 the D1 CLINT
In-Reply-To: <CAAhSdy3PJuAj-jY5ifJ_pRZXsH7zx07JMuBVCHBjoUUu=Tf=ZA@mail.gmail.com>
References: <20211020015838.45399-1-samuel@sholland.org>
 <20211020015838.45399-3-samuel@sholland.org>
 <CAAhSdy3r20Q4mBkTR58Befo+SYhsLx3ueq=MOb4UQXk3P=8F-w@mail.gmail.com>
 <d57d4cb7-bf64-c1c8-a0bf-174e36207d3c@sholland.org>
 <CAAhSdy0+2GY1U==iGHn5udFwSWUTEEKbtG=fSxu2vC4As1E2gg@mail.gmail.com>
 <d9249dd3-ae0d-d2ff-f785-d2a1df2e6d45@sholland.org>
 <CAAhSdy3PJuAj-jY5ifJ_pRZXsH7zx07JMuBVCHBjoUUu=Tf=ZA@mail.gmail.com>
Message-ID: <d38ecf54-2851-dfe6-6f22-d96cd62227cf@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/21/22 8:29 AM, Anup Patel wrote:
> On Tue, Jun 21, 2022 at 10:50 AM Samuel Holland <samuel@sholland.org> wrote:
>>
>> On 6/20/22 11:54 PM, Anup Patel wrote:
>>> On Tue, Jun 21, 2022 at 10:13 AM Samuel Holland <samuel@sholland.org> wrote:
>>>>
>>>> On 6/20/22 11:20 PM, Anup Patel wrote:
>>>>> On Wed, Oct 20, 2021 at 7:28 AM Samuel Holland <samuel@sholland.org> wrote:
>>>>>>
>>>>>> The CLINT in the Allwinner D1 SoC apparently does not support 64-bit
>>>>>> MMIO access. A property was added to support this quirk (and that
>>>>>> property was copied to the ACLINT MTIMER code). However, since this
>>>>>> difference in behavior makes the D1 CLINT incompatible with the SiFive
>>>>>> CLINT's programming interface, a better solution is to use a separate
>>>>>> compatible string.
>>>>>>
>>>>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>>>>
>>>>> Due to some unknown reason, this patch slipped through cracks and was
>>>>> never applied.
>>>>
>>>> Oh, I intentionally did not send a new version of the series because I later
>>>> found out that C9xx CLINT has no mtime register at all[1][2]. The issue has
>>>> nothing to do with 64-bit vs 32-bit access. So this change is wrong; I will need
>>>> to send a follow-up removing the allwinner,sun20i-d1-clint compatibles.
>>>
>>> I had tested on QEMU virt and sifive_u machine so at least this does not
>>> break anything on QEMU and SiFive boards.
>>
>> OK, I will send a follow-up patch tomorrow.
> 
> Thanks. I was thinking of having a quirk in the mtimer driver for the D1 clint
> situation. I sent a quirk patch but I have tested only on QEMU RV32 and RV64.
I think your patch is what we want to do eventually, but I want to get the
binding settled first.

Regards,
Samuel

