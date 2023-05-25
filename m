From: Guo Ren <guoren@kernel.org>
Date: Thu, 25 May 2023 14:06:10 +0800
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <B31C373E-7DDF-43A5-B855-DB664C940C7B@kernel.org>
References: <20230523094649.4100554-1-guoren@kernel.org> <20230523094649.4100554-3-guoren@kernel.org>
 <20230523-manatee-providing-77413fac0c58@spud> <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
 <20230524-vertebrae-slip-84584f5bb65b@wendy> <CAJF2gTQPyyi5twqdboo=4t0KgP0RqgOpqd0PX239PQZKC-Z8Uw@mail.gmail.com>
 <20230524-claw-obligate-e4815c3e232b@spud> <0115F3EA-6071-4876-A50B-CCCB6496FBB6@jrtc27.com>
 <20230524-climate-citrus-4959e052bf56@spud> <CAJF2gTRgE2ceqZ7Ddi6NwT++qFGEzK-YZ4gg9mYPwTSUKiTwRw@mail.gmail.com>
 <B31C373E-7DDF-43A5-B855-DB664C940C7B@kernel.org>
Message-ID: <CAJF2gTT-PkUUceDR8d3GXq4v40daJuNQ6rFHzLTAkLA_=ie=cA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 25, 2023 at 1:33?PM Conor Dooley <conor@kernel.org> wrote:
>
>
>
> On 25 May 2023 04:15:36 IST, Guo Ren <guoren@kernel.org> wrote:
>
> >So it could be "thead,cpu-reset", okay?
>
> As a generic fallback compatible.
>
> >Actually, our core could let SoC vendors define their own custom
> >CSRs/custom reset values of CSRs, so we don't know what would be added
> >in the future. Put a array in dts instead of hard-code table is much
> >more flexiblity.
>
> If there's going to be 700 different variations depending on what people do with openc910, then allowing it to be passed sounds like a good idea.
Yes, that is what we want. th1520 is a example.

Thanks for the review and correction! Your help is greatly appreciated
in improving th1520 upstream.

>
> Thanks,
> Conor.



-- 
Best Regards
 Guo Ren

