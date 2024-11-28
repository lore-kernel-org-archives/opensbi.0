From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Nov 2024 18:06:31 +0530
Subject: [PATCH v2 03/11] scripts/carray.sh: Avoid useless use of cat
In-Reply-To: <fc7cb0a0-8a46-49a3-af1a-ab1cbf3e7ca7@codethink.co.uk>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
 <20241111220304.1228821-4-samuel.holland@sifive.com> <CAAhSdy0nhyPEyjyt6uFpj6vNWga54h1_WNzRjUN6r_Ld1MD0PQ@mail.gmail.com>
 <fc7cb0a0-8a46-49a3-af1a-ab1cbf3e7ca7@codethink.co.uk>
Message-ID: <CAAhSdy1=k6rDGToAj3DTaVGcHGJk1+rmGFNBGDa=c3v1PqrqTw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 28, 2024 at 6:05?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 28/11/2024 12:33, Anup Patel wrote:
> > On Tue, Nov 12, 2024 at 3:33?AM Samuel Holland
> > <samuel.holland@sifive.com> wrote:
> >>
> >> awk(1) takes input files as positional arguments, so there is no need
> >> to read the file with cat(1).
> >>
> >> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >
> > LGTM.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
> > Regards,
> > Anup
> >
>
> Should I follow up with my patch to just make this one awk script?

Yes, please rebase and send v2 of your patch.

Thanks,
Anup

>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html

