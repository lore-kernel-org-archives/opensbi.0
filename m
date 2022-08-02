From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 2 Aug 2022 07:32:59 +0200
Subject: [PATCH v4 00/15] OpenSBI Kconfig Support
In-Reply-To: <CAK9=C2UDqT6JwME8EdTyHjPqXwPdTG61BaqmcnhhrDOzvZqzJg@mail.gmail.com>
References: <20220731045653.165058-1-apatel@ventanamicro.com>
 <20220801113545.wyy2eyndgcveoatv@kamzik>
 <CAK9=C2UDqT6JwME8EdTyHjPqXwPdTG61BaqmcnhhrDOzvZqzJg@mail.gmail.com>
Message-ID: <20220802053259.c2yg5nb5eo6l6ve2@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 02, 2022 at 10:06:57AM +0530, Anup Patel wrote:
> On Mon, Aug 1, 2022 at 5:05 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Sun, Jul 31, 2022 at 10:26:38AM +0530, Anup Patel wrote:
> > > In future, we will see more drivers in OpenSBI for system reset, serial port,
> > > power management, etc platform specific devices. We need platform specific
> > > compile time configuration to allow users control the size of OpenSBI generic
> > > firmware binaries by only enabling desired drivers. In other words, users
> > > should be allowed to restrict the set of RISC-V platforms on which OpenSBI
> > > generic firmwares built by them can run.
> > >
> > > To address above, we add Kconfig support for OpenSBI platforms using the
> > > Kconfiglib project which is a standalone kconfig parser.
> > >
> > > To try OpenSBI Kconfig support with generic platform, here are few
> > > example commands:
> > > make PLATFORM=generic             <-- builds OpenSBI using "defconfig"
> > > make PLATFORM=generic menuconfig  <-- launches graphical interface for changes
> > >
> > > These patches can also be found in the kconfig_v4 branch at:
> > > https://github.com/avpatel/opensbi.git
> > >
> > > Changes since v3:
> > >  - Strip down the Kconfiglib sources added by PATCH1
> > >  - Removed extra "." in the top-level Makefile updated by PATCH2
> > >
> > > Changes since v2:
> > >  - Use $(FOO) instead of $FOO to access FOO environment variable in
> > >    Kconfig files.
> > >  - Added a new PATCH1 to include Kconfiglib v14.1.0 sources under
> > >    the scripts directory of OpenSBI.
> > >
> > > Changes since v1:
> > >  - Fix SPDX license specifier in new Kconfig files
> > >
> >
> > Hi Anup,
> >
> > I played with this a bit and noticed a new compiler warning when compiling
> > with clang.
> >
> > ...
> >  GEN-DEP   platform/generic/platform_override_modules.dep
> >  GEN-DEP   platform/generic/platform_override_modules.dep
> >  CC-DEP    platform/generic/platform.dep
> > /home/drew/code/github/opensbi/platform/generic/platform.c:10:10: fatal error: 'libfdt.h' file not found
> > #include <libfdt.h>
> >          ^~~~~~~~~~
> > 1 error generated.
> > ...
> 
> Okay, I will fix this in the next revision.
> 
> >
> > I also noticed a bunch of directories and empty .h files (including
> > libfdt.h) get added to build/platform/generic/kconfig/. That seems
> > like a bug.
> 
> Those empty generated headers are used by kconfiglib to track which
> kconfig option changed.

Ah, OK. If the filenames are configurable, like the dependency files are
with gcc's -MF, then it might be nice to make them hidden files and/or
named in ways to indicate their purpose.

> 
> >
> > I also tested the new PLATFORM_DEFCONFIG make variable. I found I needed
> > to specify a defconfig file by a relative path to
> > platform/$PLATFORM/configs/. I think it would be more convenient if
> > the path could be relative to the root where 'make' is run. And, also
> > nice would be if it could be an absolute path. Currently an absolute path
> > is still assumed to be relative to platform/$PLATFORM/configs/ resulting
> > in something like platform/$PLATFORM/configs//$ABSOLUTE_PATH
> 
> This path is relative to platform directory because:
> 1) defconfigs are separate for each platform
> 2) OpenSBI supports out-of-tree platform directories as well. For example,
>    we can have some <xyz> platform outside OpenSBI sources so to
>    build such a platform we use "PLATFORM_DIR=<absolute_path_of_xyz>"
>    instead of "PLATFORM=xyz".

I played with this and it works as expected. I'm mostly convinced that
defaulting to a path relative to $PLATFORM_DIR/configs/ is reasonable,
but I still think PLATFORM_DEFCONFIG should also accept an absolute path.

Thanks,
drew

