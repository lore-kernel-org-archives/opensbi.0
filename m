From: Samuel Holland <samuel@sholland.org>
Date: Tue, 21 Jun 2022 00:20:50 -0500
Subject: [RFC PATCH 2/2] lib: utils/timer: Add a separate compatible for
 the D1 CLINT
In-Reply-To: <CAAhSdy0+2GY1U==iGHn5udFwSWUTEEKbtG=fSxu2vC4As1E2gg@mail.gmail.com>
References: <20211020015838.45399-1-samuel@sholland.org>
 <20211020015838.45399-3-samuel@sholland.org>
 <CAAhSdy3r20Q4mBkTR58Befo+SYhsLx3ueq=MOb4UQXk3P=8F-w@mail.gmail.com>
 <d57d4cb7-bf64-c1c8-a0bf-174e36207d3c@sholland.org>
 <CAAhSdy0+2GY1U==iGHn5udFwSWUTEEKbtG=fSxu2vC4As1E2gg@mail.gmail.com>
Message-ID: <d9249dd3-ae0d-d2ff-f785-d2a1df2e6d45@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/20/22 11:54 PM, Anup Patel wrote:
> On Tue, Jun 21, 2022 at 10:13 AM Samuel Holland <samuel@sholland.org> wrote:
>>
>> On 6/20/22 11:20 PM, Anup Patel wrote:
>>> On Wed, Oct 20, 2021 at 7:28 AM Samuel Holland <samuel@sholland.org> wrote:
>>>>
>>>> The CLINT in the Allwinner D1 SoC apparently does not support 64-bit
>>>> MMIO access. A property was added to support this quirk (and that
>>>> property was copied to the ACLINT MTIMER code). However, since this
>>>> difference in behavior makes the D1 CLINT incompatible with the SiFive
>>>> CLINT's programming interface, a better solution is to use a separate
>>>> compatible string.
>>>>
>>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>>
>>> Due to some unknown reason, this patch slipped through cracks and was
>>> never applied.
>>
>> Oh, I intentionally did not send a new version of the series because I later
>> found out that C9xx CLINT has no mtime register at all[1][2]. The issue has
>> nothing to do with 64-bit vs 32-bit access. So this change is wrong; I will need
>> to send a follow-up removing the allwinner,sun20i-d1-clint compatibles.
> 
> I had tested on QEMU virt and sifive_u machine so at least this does not
> break anything on QEMU and SiFive boards.

OK, I will send a follow-up patch tomorrow.

> Just a heads-up, we are planning to do OpenSBI v1.1 release sometime
> this week.
> 
> Do you have a list of things that are still missing to support upstream
> OpenSBI on D1 board ?

D1 already has enough support to boot/run with v1.0.

The only remaining functionality I know of is:
 - CLINT, which needs a DT binding plus further driver changes, and
 - PMU, which will be nontrivial to implement.

Lack of CLINT driver is no real problem, because D1 has several other MMIO
timers available, so the SBI timer extension is not even used right now.

And the generic PMU code gracefully handles the lack of overflow interrupt
support, so that can also be added later.

Regards,
Samuel

