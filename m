From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 09:24:22 +0530
Subject: [PATCH V4 1/2] lib: sbi: add some macros to detect BUG at runtime
In-Reply-To: <08035449-7C4A-4517-A3D4-A928F4C66038@jrtc27.com>
References: <20210916043250.8656-1-wxjstz@126.com>
 <CAAhSdy2nHdmF4oqU0xu5uAmQbT8iSsVuKu4gu0ZY=hQ0BzRjzw@mail.gmail.com>
 <08035449-7C4A-4517-A3D4-A928F4C66038@jrtc27.com>
Message-ID: <CAAhSdy2md+nZdoY-_rugg_B5pmGk2=1gsGtXGAFhU8pJT6jvaA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 23, 2021 at 5:05 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 22 Sep 2021, at 09:14, Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, Sep 16, 2021 at 10:03 AM Xiang W <wxjstz@126.com> wrote:
> >>
> >> Three macros are added. One is called BUG, which is used to put in an
> >> unreachable branch. One is called BUG_ON, which is used to check bugs
> >> and assert conditions are opposite. One is called SBI_ASSERT, used for
> >> assertion checking.
> >>
> >> Signed-off-by: Xiang W <wxjstz@126.com>
> >> ---
> >> include/sbi/sbi_console.h | 19 +++++++++++++++++++
> >> 1 file changed, 19 insertions(+)
> >>
> >> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> >> index e24ba5f..05d2f57 100644
> >> --- a/include/sbi/sbi_console.h
> >> +++ b/include/sbi/sbi_console.h
> >> @@ -11,6 +11,8 @@
> >> #define __SBI_CONSOLE_H__
> >>
> >> #include <sbi/sbi_types.h>
> >> +#include <sbi/riscv_asm.h>
> >
> > Including "sbi/riscv_asm.h" is redundant with the use of sbi_hart_hang().
> >
> >> +#include <sbi/sbi_hart.h>
> >>
> >> struct sbi_console_device {
> >>        /** Name of the console device */
> >> @@ -51,4 +53,21 @@ struct sbi_scratch;
> >>
> >> int sbi_console_init(struct sbi_scratch *scratch);
> >>
> >> +#define BUG() do { \
> >> +       sbi_printf("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
> >
> > This line should be within 80 characters.
> >
> >> +       sbi_hart_hang(); \
> >> +} while (0)
> >> +
> >> +#define BUG_ON(cond) do { \
> >> +       if (cond)       \
> >> +               BUG();  \
> >> +} while (0)
> >> +
> >> +#define SBI_ASSERT(cond) do { \
> >> +       if (!(cond)) { \
> >> +               sbi_printf("ASSERT: %s:%d/%s(): Assertion `%s` failed.\n", __FILE__,__LINE__,__func__, #cond);\
> >
> > same as above.
> >
> >> +               sbi_hart_hang(); \
> >> +       } \
> >> +} while (0)
> >> +
> >> #endif
> >> --
> >> 2.30.2
> >>
> >>
> >> --
> >> opensbi mailing list
> >> opensbi at lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/opensbi
> >
> > Otherwise, this patch looks good.
> >
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> >
> > I have taken care of the above minor comments while merging this
> > patch. Applied this patch to the riscv/opensbi repo.
>
> Hi Anup,
> I?m concerned about the fact this was committed despite two of us
> raising concerns about the APIs themselves that remain unaddressed in
> v4 (one of them was half addressed in that SBI_ASSERT was added, but
> BUG_ON, the thing we suggested might not be a good idea to have,
> remains and so now there are *two* ways of writing the same thing).
> Here?s the relevant part of the thread for v2:

I thought all comments were already addressed. When there are no
Reviewed-by, I generally wait for a week before reviewing it myself
and merging it. I guess I should wait a little more when there are no
Reviewed-by tags.

I also request you (and everyone), if there are unaddressed comments
then please drop a one-line statement in the latest patch so that we
don't accidentally ignore unaddressed comments.

Overall, I did not find anything objectionable at my end.

>
> Me:
> > Mitchell Horne:
>
> >> Maybe it should be named ASSERT or SBI_ASSERT then? It does not seem
> >> like your other patch even uses this however.
> >>
> >> In my opinion, BUG() and BUG_ON() are confusing names to begin with;
> >> they do not obviously describe their semantics. If you insist on using
> >> these names, their behaviour should match Linux.
> >
> > Also BUG is a bit of a lazy interface; line numbers change over time,
> > really you should be using some kind of panic function that takes a
> > format string with a meaningful message. That also gives the user some
> > hope of knowing what went wrong and maybe working around or fixing it.
> > And why not reuse sbi_hart_hang rather than inlining another copy of it?
>
> Obviously the matching Linux part has been fixed, as has reusing
> sbi_hart_hang, but the other fundamental API concerns remain. I believe
> these APIs encourage lazy code writing that will result in useless
> error messages unless you?re a developer who can go read the source
> (and know exactly what files it was built from), rather than forcing
> people to think about writing an error message to communicate the
> problem to the user or developer. Just because Linux defines BUG and
> BUG_ON doesn?t mean that they?re a good idea and that OpenSBI should
> copy them (but even Linux also provides a printf-like panic function).

I am not attached to the BUG()/BUG_ON() macro names and the way
they are implemented so feel free to send a patch for doing this better
way. These macros are recently added so it is better to improve them
now before they are spread throughout the entire code base.

Regards,
Anup

>
> Jess
>

