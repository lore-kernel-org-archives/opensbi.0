From: Jeff Law <jlaw@ventanamicro.com>
Date: Mon, 14 Aug 2023 11:26:06 -0600
Subject: [PATCH] Makefile: Force GNU hashing
In-Reply-To: <mvmedk5datb.fsf@suse.de>
References: <20230814043959.390101-1-mchitale@ventanamicro.com>
 <mvmwmxydqbn.fsf@suse.de>
 <5c7a4dce-60fe-e61f-1596-20378d5204d1@ventanamicro.com>
 <mvmil9hdb5a.fsf@suse.de>
 <2c6d3c9c-d0b4-f00a-e3c9-68df02c9d22d@ventanamicro.com>
 <mvmedk5datb.fsf@suse.de>
Message-ID: <5c1b000b-1d82-bdfb-9a9f-85edc56ad825@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/14/23 07:15, Andreas Schwab wrote:
> On Aug 14 2023, Jeff Law wrote:
> 
>> On 8/14/23 07:08, Andreas Schwab wrote:
>>> On Aug 14 2023, Jeff Law wrote:
>>>
>>>> On 8/14/23 01:40, Andreas Schwab wrote:
>>>>> On Aug 14 2023, Mayuresh Chitale wrote:
>>>>>
>>>>>> The Yocto QA step verifies that binaries and DSOs use DT_GNU_HASH rather than
>>>>>> DT_HASH. If the linker is called directly, then we need to make sure to pass in
>>>>>> the hashing style.
>>>>> Why does it matter?  The ultimate output is a flat binary.
>>>> It matters because the Yocto QA step will fail.
>>> Why does it even look at it?  It's only an intermediate build product.
>> Because that's how Yocto works?
> 
> Whatever Yocto is, it must be doing something strange.
There are many things about Yocto that are strange at best.  IMHO Yocto 
is a necessary evil as part of the bring-up process but you want to get 
away from it as soon as possible :-)

If you've never worked with it, consider yourself lucky.  Think of it as 
a mini distro, but with a unique and complex way of describing the 
components of the distro and how they're patched/built, how qa works, etc.

jeff

