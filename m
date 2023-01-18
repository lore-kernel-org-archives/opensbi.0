From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 18 Jan 2023 09:18:17 +0100
Subject: Upcoming OpenSBI v1.2 release
In-Reply-To: <345ae4e5-c209-3da3-ec42-1b44da25c0f1@microchip.com>
References: <CAAhSdy1MTYZcN0cbwPoM41RTWPwLuhbNvprKqhcXfJiNE8Jamw@mail.gmail.com>
 <CAOnJCUK=XOfNtp6aTveqSdHYwUtNbbrnqn53z06fKU_i6ufTbA@mail.gmail.com>
 <efd224b6-47c4-4f55-b247-5e6156c3d451@microchip.com>
 <af3a653f-1a20-38ad-b8d9-3b6b1a0e66c4@sholland.org>
 <345ae4e5-c209-3da3-ec42-1b44da25c0f1@microchip.com>
Message-ID: <6dc146d1-bfff-3cbd-9e78-67b8e822c0b8@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/17/23 23:59, Conor.Dooley at microchip.com wrote:
> On 27/12/2022 17:06, Samuel Holland wrote:
>> On 12/22/22 04:49, Conor.Dooley at microchip.com wrote:
> 
>>> We are incredibly tight on space in eNVM for the HSS as things stand,
>>> so it is likely that we will not move to later versions of OpenSBI
>>> than (maybe) v1.1 & stick to cherry-picking fixes.
>>> The last time the HSS bumped its OpenSBI version, the change in size
>>> of OpenSBI needed some working around IIRC.
>>
>> Adding Kconfig was quite helpful here. Now that there is an
>> officially-supported way to disable unused FDT drivers, my OpenSBI
>> builds for D1 are comfortably back under 256 KiB.
> 
> I brought it up last week but forgot to respond here.
> eNVM on PolarFire SoC is only 128 KiB and the HSS, of which OpenSBI
> is but a component, has to fit in that.
> As things stand, "we" are already cutting out swathes of code that is
> not used on the platform & relying on self decompression - but even
> with that it's a struggle to fit.
> 
> I don't think v1.2 (or later) is going to happen unfortunately!
> 
> Thanks
> 

Is OpenSBI necessarily a part of HSS or could it be moved in future HSS 
releases to an eMMC/SD-card partition?

Best regards

Heinrich

