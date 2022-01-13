From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 13 Jan 2022 11:41:57 +0000
Subject: [PATCH v2] lib: fix pointer of type 'void *' used in arithmetic
In-Reply-To: <13e331c3-ec2b-7e23-ad84-0d48f24a99c6@opensource.wdc.com>
References: <20220113084744.70982-1-jukkax@ssrc.tii.ae>
 <34228bc1-5083-fee8-8cce-be52f9d9a9a1@opensource.wdc.com>
 <905f4ed1-023f-f7db-1ab4-d8c801ec474c@ssrc.tii.ae>
 <13e331c3-ec2b-7e23-ad84-0d48f24a99c6@opensource.wdc.com>
Message-ID: <F0FE2C63-DC7C-413F-8AD2-4B0B4CCCC612@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

]On 13 Jan 2022, at 11:37, Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
> 
> On 2022/01/13 20:03, Jukka Laitinen wrote:
>> Thanks for comments!
>> 
>> 
>> On 13.1.2022 12.52, Damien Le Moal wrote:
>>> [Re-sending this since my emails end up being empty...]
>>> 
>>> On 2022/01/13 17:49, Jukka Laitinen wrote:
>>>> Using "void *" in arithmetic causes errors with strict compiler settings:
>>>> "error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]"
>>>> 
>>>> Just remove these by calculating on "char *" where 1-byte data size is assumed
>>> s/Just Remove/Avoid
>>> (and nit: add a period at the end of the sentence)
>> 
>> I will add these to patchset v3 !
>> 
>>> 
>>> I would also suggest a cast to unsigned long instead of char *. unsigned long is
>>> more common/natural for addresses arithmetic.
>> 
>> You are right, that is is more natural to do arithmetic on integers than 
>> pointers.
>> 
>> However, I don't like to change pointer to unsigned long and back for 
>> several reasons; one being that afaik no stardard states that 
>> sizeof(unsigned long) == sizeof(void *). And even while this is a 
>> typical case, there is quarantee that this wouldn't have other side 
>> effects (such as padding bits ...).
> 
> Well, unlike Linux kernel, the nice thing with OpenSBI is that we only need this
> unsigned long cast to work on risc-v 32 and 64. And as far as I know, it does,
> and that is mandated by the RISC-V ISA specs.

Except for our work unsigned long *does not work*. We extend RISC-V
with new instructions and add a new ABI where pointers are not unsigned
long and any attempt to treat them like that will result in crashing
when you dereference the result. So please don?t or I will just have to
later submit a patch to fix it to use an actual pointer rather than
rely on implementation-defined behaviour. Keep the Linux kernel
abominations like unsigned long everywhere out of OpenSBI.

Jess


