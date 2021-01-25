From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 25 Jan 2021 10:27:50 +0800
Subject: Questions for OpenSBI to support position independent execution
In-Reply-To: <CAAhSdy0SrvzxnQdpeNhpCXfH1c=dOycNGis2=otNs=xdCUbxGg@mail.gmail.com>
References: <CABvJ_xh87_8omB+E-e3h4OuQXJEdfbL46D4mNr6mx2Y4oJG4NA@mail.gmail.com>
 <CAAhSdy0SrvzxnQdpeNhpCXfH1c=dOycNGis2=otNs=xdCUbxGg@mail.gmail.com>
Message-ID: <CABvJ_xgTchyovxOoFBnXex12v2uOJkdws6t6QvcEhxf5bQLDvA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 22, 2021 at 1:31 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Jan 22, 2021 at 9:41 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > Hi,
> > For the current implementation,  if we configure the OpenSBI as the
> > generic platform, we can execute the same OpenSBI image on the
> > different platforms. It eliminates many troubles in use. However, I
> > found there is an assumption that the OpenSBI only can run at the same
> > address (default: 0x80000000). If users want to change the OpenSBI
> > running address due to platform memory layout or other reasons, users
> > need to change the FW_TEXT_START and recompile the OpenSBI. In this
> > case, users still need to prepare multiple images for different
> > platforms. In order to overcome this issue, I am evaluating the
> > feasibility of enabling OpenSBI to support position-independent
> > execution. If someone has any concerns about this issue or any
> > suggestions, please let me know. Thanks
>
> The proposal for position-independent OpenSBI firmwares has been
> suggested in the past. Our only concern with position-independent
> code is additional instructions added in hot-path which can affect
> performances because all global variables and global functions will
> now be referred via GOT.
>
> We need a better analysis about performance impact due to
> position-independent OpenSBI firmwares.
>
> >
> > In addition, when I review the current implementation, I encounter a
> > question shown below. After OpenSBI enables to support the
> > position-independent execution, ideally, the code can run at an
> > arbitrary place. Hence, I think the codes could be removed from
> > firmware/fw_base.S, which are used to copy the code from the load
> > address to the run address. Before removing them, I want to know the
> > original purpose and usages of these codes, but I can't find them. If
> > some can tell me the answer, I would appreciate it.
>
> The self-relocation copy in firmware/fw_base.S allows us to load
> OpenSBI firmwares anywhere in RAM and it will relocate/copy itself
> to designated runtime address. This feature is very useful to U-Boot
> SPL when U-Boot SPL and OpenSBI firmwares are linked at the same
> runtime address (0x80000000).
>
I got it. However, when position-independent execution is supported,
it can be executed directly at the load address. In addition, in this
case, we will not specify the execution address at compile time.
Therefore, after enabling position-independent execution, it seems
possible to skip these relocation codes. is it right?

> To evaluate OpenSBI position independent firmwares, I would suggest
> to keep it optional using compile-time option FW_PIC. This means
> whenever "FW_PIC=y" is passed to OpenSBI make, everything will
> be compiled as position independent and all changes for FW_PIC
> will be under firmwares/ directory using "#ifdef". You will also need
> to change the firmware trap handler to set up GOT on every trap
> whenever FW_PIC is enabled.
>
I agreed with you. I have the same concerns regarding the performance
and code size too when enabling position-independent execution. I will
create a new configuration for this feature to avoid affecting the
current implementation.

Thank you very much for these useful suggestions.

Best regards,
Vincent

