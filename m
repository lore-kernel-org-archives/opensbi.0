From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Jul 2022 18:29:07 +0530
Subject: [PATCH v2 00/14] OpenSBI Kconfig Support
In-Reply-To: <10919e46-894c-469c-35f3-1c4fe7389db8@canonical.com>
References: <20220718145611.2211638-1-apatel@ventanamicro.com>
 <20220718184807.dac3r5bvsublyj2n@kamzik> <CAEn-LToptF6LHHZ3nUzCe6KYXBT6FHk0uyVrNfubjC8MppSfhA@mail.gmail.com>
 <CAK9=C2UE088wC3TxUFhrRUNMYQpfzvaCZAt4AGMjBcjnvktqWw@mail.gmail.com>
 <CAK9=C2U7s1FKYw+FqBbZz5mTP=Gz9mRJ-CLr4m3+iqg9PWiQ8A@mail.gmail.com>
 <44b673ad-6458-4d01-fc1d-5cb0a35946dc@canonical.com> <mvmtu7dft1m.fsf@suse.de>
 <CAK9=C2XeNpHKyRNidmpDL0G3tdMA4QZG+_wX-uW4KXTWXpmKyA@mail.gmail.com> <10919e46-894c-469c-35f3-1c4fe7389db8@canonical.com>
Message-ID: <CAK9=C2UWhVEbcfAHpbB7qRGVcjxGC5sTXQ14CqOg+Jv3N0A+tw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 2:57 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 7/19/22 11:05, Anup Patel wrote:
> > On Tue, Jul 19, 2022 at 1:11 PM Andreas Schwab <schwab@suse.de> wrote:
> >>
> >> On Jul 19 2022, Heinrich Schuchardt wrote:
> >>
> >>> Ubuntu provides OpenSBI as a package. So it is package maintainers not
> >>> users that are concerned. kconfig-frontends currently is in the Universe
> >>> repository (community supported). This would have to change since OpenSBI
> >>> is in the main repository (Canonical supported). Putting software based on
> >>> a a dead project into main is not preferred.
> >>
> >> kconfig-frontends is not available on openSUSE Factory either.
> >
> > Fair enough. We should use something else.
> >
> > Kconfiglib seems to be a good option except the issues pointed by Heinrich:
> > 1) Python pip is not recommended security wise
> > 2) The LICENSE of Kconfiglib needs to be compatible with BSD distros
>
> Bugs in kconfiglib are not fixed in a timely manner. See
> https://github.com/ulfalizer/Kconfiglib/issues/105
>
> The last commit was in Jan 2020. So another dead project.

Let me send a v3 with Kconfiglib tools included in OpenSBI sources
so that we are not dependent on the Kconfiglib project to actively fix
issues for us.

Regards,
Anup

>
> Best regards
>
> Heinrich
>
> >
> > The Kconfiglib LICENSE is definitely not GPL and seems compatible
> > with BSD-2-clause and MIT licenses.
> > (Refer, https://github.com/ulfalizer/Kconfiglib/blob/master/LICENSE.txt)
> >
> > To address security concerns, we can do one of the following:
> > A) Include Kconfiglib source under scripts/ directory.
> > B) Recommend that OpenSBI users, install Kconfiglib as distro
> > package instead of python-pip3 installer (e.g. python3-kconfiglib
> > package available on Ubuntu)
> >
> > IMO, the option A mentioned above has a maintenance burden and
> > if possible we should avoid it.
> >
> > Regards,
> > Anup
> >
> >
> >
> >
> >>
> >> --
> >> Andreas Schwab, SUSE Labs, schwab at suse.de
> >> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> >> "And now for something completely different."
>

