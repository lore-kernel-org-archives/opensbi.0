From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Thu, 28 Mar 2024 15:33:46 +0100
Subject: [PATCH 0/9] T-Head: Allow read access to th.mxstatus CSR
In-Reply-To: <IA1PR20MB4953940AF68B8AAE3E8E28CBBB3B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu> <IA1PR20MB4953940AF68B8AAE3E8E28CBBB3B2@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAEg0e7j_zC5NOeLyaU6nv6xxf8NR+PQdRdNBnPHjnN+Qjfc4XA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 28, 2024 at 8:30?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> On Wed, Mar 27, 2024 at 11:11:28AM +0100, Christoph M?llner wrote:
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
>
> Although using something like vendor id to provide basic init code for
> platform with the same cpus is a good idea, it may be too hard to
> provide common code for the whole vendor. As the cpu evolves, a vendor
> may provide something different completely from the previous cpu. This
> make provide common code for the entire vendor almost impossible.
>
> There is an another suggestion discussed in the kernel, which suggest
> using pseudo extension to provide generic support. I think you want
> to check it.
> https://lore.kernel.org/all/20240311063018.1886757-1-dqfext at gmail.com/

This is all about custom extensions and their discovery.
In this particular case, we have the additional challenge that MAEE
affects early boot.
We have modeled it such that:
* XTheadMxStatus/XTheadSxStatus provides the CSR to probe
(https://github.com/T-head-Semi/thead-extension-spec/pull/45)
* XTheadMaee is the extension for the page-based memory attributes
So, all functionality is covered by custom extensions.

The question if the kernel reads out the CSR or a DT property is a different
discussion (DT is preferred but implies dependencies to FW providing that,
and requires a boot process stage where we can already process a DT).

