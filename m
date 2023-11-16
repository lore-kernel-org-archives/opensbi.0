From: Bo Gan <ganboing@gmail.com>
Date: Wed, 15 Nov 2023 17:29:20 -0800
Subject: Security and correctness issues around captured FDT pointers
In-Reply-To: <43407cfa-5d82-4337-ae99-8ddac8f23bf6@sifive.com>
References: <4caf2c9d-36ba-c1e8-8e38-ec733a41e74a@gmail.com>
 <CAK9=C2W3d1t+83kNoWhkA81M59Wen2gGa_EcgOJA1U19WJP4mQ@mail.gmail.com>
 <0a3267fa-3dfe-f630-3202-8f6ed6825609@gmail.com>
 <43407cfa-5d82-4337-ae99-8ddac8f23bf6@sifive.com>
Message-ID: <9db84767-3623-1ac5-ed56-b11a6e052fa2@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/15/23 5:03 PM, Samuel Holland wrote:
> Hi Bo,
> 
> On 2023-11-15 6:25 PM, Bo Gan wrote:
>> On 11/13/23 9:29 AM, Anup Patel wrote:
>>>
>>> Yes, #1 is mostly safe.
>>>
>>> The #2 needs to be fixed in the generic/starfive/jh7110.c and all other places
>>> where it exists.
>>>
>>> We should certainly stop accessing FDT after cold boot hard is done but I don't
>>> think we should zero-out pointers as well.
>>>
>> Thanks for the reply, Anup. I did a little bit more digging on this and I think
>> #1 is only safe when OpenSBI's carrying the FDT itself (through FW_FDT_PATH).
>> Otherwise, we have to make sure FDT will never be accessed after cold boot done.
>> By zeroing-out the pointers, we can avoid speculative access as well. This helps
>> to defense against speculative timing attacks. (Maybe I'm too paranoid?).
>>
>> Given OpenSBI starts at very early stage, it's probably uncommon to not have
>> FW_FDT_PATH defined. I have a JH7110 on hand, and the OpenSBI (loaded by U-Boot
>> SPL) will carry the FDT built from U-Boot. I'd imagine other boards/vendors do
>> it similarly. Just in case folks really don't have FW_FDT_PATH, can we emit a
>> warning, and suggest the FDT to be protected through other mechanism?
> 
> If the FDT comes from U-Boot (the common case) or another prior stage (e.g.
> QEMU), that means the FDT address was provided in a register, and FW_FDT_PATH is
> *not* defined. So we should not assume FW_FDT_PATH is set.
> 
> Regards,
> Samuel
> 

Hi Samuel, thanks for the reply. Yes, we should not assume FW_FDT_PATH, and if
it's pretty common for real world/production setup to use the FDT from previous
boot stage, I'd suggest we ensure there's never global variables or heap variables
that can capture any pointer to FDT, and all access to FDT must happen before cold-
boot done. Otherwise, the memory region contains FDT passed from previous bootstage
must be protected, but surely it'll complicate things and could potentially involve
platform specific handling.

Bo

