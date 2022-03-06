From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 6 Mar 2022 16:13:19 +0000
Subject: [PATCH v1 2/2] lib: sbi: Implement Sstc extension
In-Reply-To: <CA+Qh7Tm4GspwKsYudmYRHSGz66maSZNgu1cLj-Ykuubjc-xLmg@mail.gmail.com>
References: <20220228082604.3649231-1-atishp@rivosinc.com>
 <20220228082604.3649231-3-atishp@rivosinc.com>
 <17C1041E-B6B4-406F-8DB7-B703F74E8400@jrtc27.com>
 <CAHBxVyGvj+7Z=9mxdyayP-xc+=_QNRVznsqXX7wBPDCRecpxvQ@mail.gmail.com>
 <490A275F-85D2-4A76-A105-0F5AC46C9414@jrtc27.com>
 <CAHBxVyERWidrca9Vp9Jc14XYfkV1B9pPWVvrcY1ZgEBVxzHfjA@mail.gmail.com>
 <23FC9827-CE39-430A-B529-A17E39C2B6BD@jrtc27.com>
 <CAOnJCU+xsqa263sJw8wjdWhn9=Hj6f-yeT2=L45z9Nd+y=suow@mail.gmail.com>
 <70A2DBA6-0110-4549-AC50-E29F9446C8B9@jrtc27.com>
 <CAOnJCULUnsvzDtj7TipQ6_K3ep_qgpeswzEQyJ3F5kojkc98Ww@mail.gmail.com>
 <CA+Qh7Tm4GspwKsYudmYRHSGz66maSZNgu1cLj-Ykuubjc-xLmg@mail.gmail.com>
Message-ID: <8544E35C-06E2-4790-955A-A29C5A3F72CE@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6 Mar 2022, at 16:08, Greg Favor <gfavor@ventanamicro.com> wrote:
> 
> On Sat, Mar 5, 2022 at 3:04 PM Atish Patra <atishp@atishpatra.org> wrote:
> > The Sstc spec also made STIP bit in mip as read only. Here is exact
> > snippet from the spec
> > 
> > "If the stimecmp (supervisor-mode timer compare) register is implemented,
> > STIP is read-only in mip and reflects the supervisor-level timer
> > interrupt signal resulting from
> > stimecmp."
> > 
> > Thus, M-mode can't update the STIP bit if sstc is enabled.
> 
> This directly contradicts text from ratified privileged specs (quoting
> Volume 2, Privileged Spec v. 20211203, the current version linked from
> riscv.org):
> 
> +Greg who may shed some light behind the reasoning for this sstc requirement. 
> 
> The proper way to interpret Sstc or any new arch extension that modifies existing arch functionality, is simply that the new extension modifies or overrides the existing functionality.  As new arch extensions get integrated into the same document as existing documents (for which there is a lot of outstanding integration work for both the Unpriv and Priv documents, mixed in with all the work to convert all that stuff to adoc), that will be more readily apparent in one document and, as appropriate, existing ratified architecture text will be modified (aka "clarified") to include forward reference to being modified by an optional arch extension.  The H extension is a big example of modifying (as well as adding to) the pre-existing architecture.  If one doesn't support the H extension, then one can read the existing M and S chapters as is.  But if one does support the H extension, then they and the H chapter need to be read and comprehended together since the pre-existing arch text doesn't directly incorporate all the modifications (as, of course, conditional modifications).


That?s not the question. The question is how an architectural extension can remove an explicitly specified feature from the base privileged spec that all software stacks ({BBL, OpenSBI} x {FreeBSD, Linux, others}) running on Unix-class hardware rely on, thereby making priv+Sstc explicitly backwards incompatible with base priv. Ratified specifications are supposed to provide a compatibility guarantee, and extensions are supposed to add not remove (except where it?s removing choice).

Jess


