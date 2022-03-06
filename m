From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 6 Mar 2022 16:47:54 +0000
Subject: [PATCH v1 2/2] lib: sbi: Implement Sstc extension
In-Reply-To: <CA+Qh7TmmcNb+6U98fKoNq247d9YgKjBYCY_2szZ-rGwNixcY5g@mail.gmail.com>
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
 <8544E35C-06E2-4790-955A-A29C5A3F72CE@jrtc27.com>
 <CA+Qh7TmmcNb+6U98fKoNq247d9YgKjBYCY_2szZ-rGwNixcY5g@mail.gmail.com>
Message-ID: <437B20A4-FB9D-4208-A4C9-E3F610864276@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[Resending as plain text for the OpenSBI list, and fixing a typo]

On 6 Mar 2022, at 16:28, Greg Favor <gfavor@ventanamicro.com> wrote:
> 
> On Sun, Mar 6, 2022 at 8:13 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> That?s not the question. The question is how an architectural extension can remove an explicitly specified feature from the base privileged spec that all software stacks ({BBL, OpenSBI} x {FreeBSD, Linux, others}) running on Unix-class hardware rely on, thereby making priv+Sstc explicitly backwards incompatible with base priv. Ratified specifications are supposed to provide a compatibility guarantee, and extensions are supposed to add not remove (except where it?s removing choice).
> 
> As to why Sstc couldn't have instead "added" to the STIP definition by OR'ing in a new interrupt signal with the existing writable CSR bit, that was decided by Andrew and John (and ultimately the AR Committee).  I don't remember off-hand the architectural problem with simply doing that, but they were clear at the time about that being a problem (and it made sense to me at the time as well).  Which then led to the current specification.
> 
> Also note that backward compatibility is provided through the *envcfg.STCE bits.  The same backward compatibility issue exists for the Svpbmt extension - which leads to having the *envcfg PBMTE bits.  This was one of the reasons for creation of the *envcfg CSRs.

That works for Svpbmt where S-mode is the only thing responsible, but for Sstc the interaction between M-mode and S-mode means that?s not enough. STCE is an M-mode bit, so either you have firmware that never exposes Sstc to S-mode and keeps using mip.STIP, rendering Sstc useless, or you have firmware that always exposes Sstc to S-mode but then has no clue if S-mode is using it or not, meaning it has to assume that S-mode has control of stimecmp and thus it cannot be used by M-mode for SBI calls (since the SBI spec only states a0 and sometimes a1 as being clobbered, with the exception of sepc/scause/stval in the case of faults for some of the legacy SBI 0.1 calls that require dereferencing S-mode-provided pointers).

And the ?OR?ing in [an] interrupt signal with the [?] writable CSR bit? behaviour already exists for SEIP and, if such a platform-specific method exists, SSIP, so STIP is now inconsistent with the other two core S-mode interrupt sources (i.e. excluding Sscofpmf).

Jess


