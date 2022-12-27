From: Samuel Holland <samuel@sholland.org>
Date: Tue, 27 Dec 2022 11:06:24 -0600
Subject: Upcoming OpenSBI v1.2 release
In-Reply-To: <efd224b6-47c4-4f55-b247-5e6156c3d451@microchip.com>
References: <CAAhSdy1MTYZcN0cbwPoM41RTWPwLuhbNvprKqhcXfJiNE8Jamw@mail.gmail.com>
 <CAOnJCUK=XOfNtp6aTveqSdHYwUtNbbrnqn53z06fKU_i6ufTbA@mail.gmail.com>
 <efd224b6-47c4-4f55-b247-5e6156c3d451@microchip.com>
Message-ID: <af3a653f-1a20-38ad-b8d9-3b6b1a0e66c4@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/22/22 04:49, Conor.Dooley at microchip.com wrote:
> Hey,
> 
> On 21/12/2022 15:02, Atish Patra wrote:
>> On Fri, Dec 16, 2022 at 9:42 PM Anup Patel <anup@brainfault.org> wrote:
>>>
>>> Hi All,
>>>
>>> We are close to the OpenSBI v1.2 release. I plan to complete this
>>> release before the end of next week (i.e. 24th December 2022).
>>>
>>> Next week, I won't be merging patches unless it's a critical fix.
>>> Also, I request everyone to test the latest OpenSBI on their RISC-V
>>> platforms.
>>>
>>
>> Explicitly adding some folks for help in testing. We don't have access
>> to all the boards.
> 
> In terms of PolarFire SoC, neither good nor bad news? Since OpenSBI is
> just one part of the HSS [0] it's non-trivial to do an upgrade & any
> meaningful testing - so probably not a runner in advance of Christmas.
> 
> We are incredibly tight on space in eNVM for the HSS as things stand,
> so it is likely that we will not move to later versions of OpenSBI
> than (maybe) v1.1 & stick to cherry-picking fixes.
> The last time the HSS bumped its OpenSBI version, the change in size
> of OpenSBI needed some working around IIRC.

Adding Kconfig was quite helpful here. Now that there is an
officially-supported way to disable unused FDT drivers, my OpenSBI
builds for D1 are comfortably back under 256 KiB.

> I'll try to give my boards from other vendors a go, but I doubt I'll
> have anything useful done before the 24th.
> 
> Apologies for not being more helpful,
> Conor.
> 
> 0 - https://github.com/polarfire-soc/hart-software-services/tree/master/thirdparty/opensbi
> 
>> It would be great if folks can test the latest head commit b848d87 on
>> the boards they have and send a Tested by tag.

While I still have concerns about the PLIC series that was merged at the
last minute with multiple outstanding concerns, the v1.2 release still
boots and hart suspend still works, so:

Tested-by: Samuel Holland <samuel@sholland.org> # D1

Regards,
Samuel


