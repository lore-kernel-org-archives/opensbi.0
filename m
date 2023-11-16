From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 09:12:54 +0530
Subject: Security and correctness issues around captured FDT pointers
In-Reply-To: <0a3267fa-3dfe-f630-3202-8f6ed6825609@gmail.com>
References: <4caf2c9d-36ba-c1e8-8e38-ec733a41e74a@gmail.com>
 <CAK9=C2W3d1t+83kNoWhkA81M59Wen2gGa_EcgOJA1U19WJP4mQ@mail.gmail.com> <0a3267fa-3dfe-f630-3202-8f6ed6825609@gmail.com>
Message-ID: <CAAhSdy3xDs54CCNzQFBHZsyV+iEMTEf0jw-yXsoi4u9osRYJQA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 16, 2023 at 5:56?AM Bo Gan <ganboing@gmail.com> wrote:
>
> On 11/13/23 9:29 AM, Anup Patel wrote:
> >
> > Yes, #1 is mostly safe.
> >
> > The #2 needs to be fixed in the generic/starfive/jh7110.c and all other places
> > where it exists.
> >
> > We should certainly stop accessing FDT after cold boot hard is done but I don't
> > think we should zero-out pointers as well.
> >
> Thanks for the reply, Anup. I did a little bit more digging on this and I think
> #1 is only safe when OpenSBI's carrying the FDT itself (through FW_FDT_PATH).
> Otherwise, we have to make sure FDT will never be accessed after cold boot done.
> By zeroing-out the pointers, we can avoid speculative access as well. This helps
> to defense against speculative timing attacks. (Maybe I'm too paranoid?).
>
> Given OpenSBI starts at very early stage, it's probably uncommon to not have
> FW_FDT_PATH defined. I have a JH7110 on hand, and the OpenSBI (loaded by U-Boot
> SPL) will carry the FDT built from U-Boot. I'd imagine other boards/vendors do
> it similarly. Just in case folks really don't have FW_FDT_PATH, can we emit a
> warning, and suggest the FDT to be protected through other mechanism?

That's an incorrect understanding of the FDT match table in OpenSBI.

The "generic_plat_match" points to a matching entry in a FDT match table
provided by one of the platform override instances. It does not point to any
part of the FDT. Please look at the fdt_match_node() implementation.

>
> For #2, can @Minda Chen or @Wei Liang help take a look? I see no reason to have
> the `const char *compatible` field in `struct pmic`. The compatible string is
> always going to be "stf,axp15060-regulator" in the current implementation, so
> what's point of strcmp it again in `pmic_ops`? If it's for future extension,
> can you strcmp it inside `pm_reset_init`, and use an enum to indicate the model?
>
> Bo
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

