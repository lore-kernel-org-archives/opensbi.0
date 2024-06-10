From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Mon, 10 Jun 2024 12:42:02 +0200
Subject: [PATCH 0/9] T-Head: Allow read access to th.mxstatus CSR
In-Reply-To: <CAAhSdy2qpEqcoUD8f6R34kJCTtctyg3ukvCMC6=4homvAzeACw@mail.gmail.com>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu> <CAAhSdy2qpEqcoUD8f6R34kJCTtctyg3ukvCMC6=4homvAzeACw@mail.gmail.com>
Message-ID: <CAEg0e7hvShNLmmqCxYw4xBCYf-hrgMNivyGbWFW6MZzSXK9-Ow@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 10, 2024 at 12:28?PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Christoph,
>
> On Wed, Mar 27, 2024 at 3:41?PM Christoph M?llner
> <christoph.muellner@vrull.eu> wrote:
> >
> > On T-Head C9xx harts, the th.mxstatus CSR provides valuable information
> > about the available vendor extensions. As this CSR is only accessible in
> > M-mode, we need to provide a mechanism for other modes to access this
> > information. This patchset solves this by extending the existing
> > platform abstraction such that platforms (or platform overrides)
> > can provide a CSR read/write handler.
> >
> > A CSR read-handler for th.mxstatus is then added that is utilized by
> > the Allwinner D1, the T-Head TH1520, and the Sophgo SG2042.
> > Further, a generic mvendorid-based platform override is added that also
> > enables the CSR read-handler for th.mxstatus (needed for QEMU).
> >
> > The CSR is documented here:
> >   https://github.com/T-head-Semi/thead-extension-spec/pull/45
> >
> > For QEMU this patch depends on
> >   https://lists.gnu.org/archive/html/qemu-devel/2024-03/msg06368.html
> >
> > Christoph M?llner (9):
> >   sbi_platform: Add mechanism to handle CSR reads/writes in platform
> >   platform: generic: Add mechanism to handle CSR reads/writes in
> >     overrides
> >   lib: sbi_emulate_csr: Utilize platform hooks for unknown CSRs
> >   platform: generic: thead: Add CSR read handler for T-Head C9xx
> >   {allwinner/sun20i-d1,sophgo/sg2042,thead-generic}: Enable T-Head CSR
> >     read access
> >   platform: thead: Rename thead-generic to thead-th1520
> >   platform: generic: Add mechanism to match via mvendorid
> >   platform: generic: thead: Add definition of T-Head's vendor ID
> >   platform: generic: Add generic T-Head override
>
> There is no activity on this series so I assume it is abandoned.

Yes, this can be abandoned.

> My only comment is that exposing M-mode CSRs to S-mode via
> CSR trap-n-emulate has been discouraged. If you really require
> to expose read-only information to supervisor software then prefer
> DT/ACPI.

Besides th.mxstatus there is also th.sxstatus to access the same
information from S-mode. So, no need to access th.mxstatus from Linux
anymore and thus no need for this series.

And yes, exposing the vendor extensions implied by that CSR bit
via DT/ACPI would be the better approach.

Thanks,
Christoph

>
> Regards,
> Anup
>
> >
> >  include/sbi/sbi_platform.h                    | 48 +++++++++++++++
> >  lib/sbi/sbi_emulate_csr.c                     |  8 ++-
> >  platform/generic/Kconfig                      | 12 +++-
> >  platform/generic/allwinner/sun20i-d1.c        |  2 +
> >  platform/generic/configs/defconfig            |  3 +-
> >  platform/generic/include/platform_override.h  |  5 ++
> >  platform/generic/include/thead/c9xx_csr.h     | 16 +++++
> >  .../generic/include/thead/c9xx_encoding.h     |  2 +
> >  platform/generic/platform.c                   | 58 ++++++++++++++++++-
> >  platform/generic/sophgo/sg2042.c              |  2 +
> >  platform/generic/thead/Kconfig                |  4 ++
> >  platform/generic/thead/objects.mk             |  9 ++-
> >  platform/generic/thead/thead-generic.c        | 42 +++-----------
> >  platform/generic/thead/thead-th1520.c         | 55 ++++++++++++++++++
> >  platform/generic/thead/thead_c9xx_csr.c       | 30 ++++++++++
> >  15 files changed, 252 insertions(+), 44 deletions(-)
> >  create mode 100644 platform/generic/include/thead/c9xx_csr.h
> >  create mode 100644 platform/generic/thead/thead-th1520.c
> >  create mode 100644 platform/generic/thead/thead_c9xx_csr.c
> >
> > --
> > 2.44.0
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

