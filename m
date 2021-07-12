From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Jul 2021 08:43:06 +0800
Subject: [PATCH v2] README: Update toolchain information
In-Reply-To: <1E43F020-34C7-4442-BB73-4AC8059ABB40@jrtc27.com>
References: <20210712003029.19956-1-bmeng.cn@gmail.com>
 <1E43F020-34C7-4442-BB73-4AC8059ABB40@jrtc27.com>
Message-ID: <CAEUhbmWsnUBq-CBRTX_7rbOcw-ypf0CPdQC2yiXiBvu=vq++iA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 12, 2021 at 8:38 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 12 Jul 2021, at 01:30, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Recent FW_PIC=y changes actually require toolchains with PIE support
> > and it is on by default. Existing doc uses a GNU bare-metal toolchain
> > as examples but it does not support PIE.
> >
> > Replace references of bare-metal toolchain prefix with Linux toolchain
> > prefix everywhere in documentation.
> >
> > Also indicate that "riscv64-unknown-freebsd-" as an alternative to
> > "riscv64-linux-" GNU toolchain.
>
> Thanks for the changes. The Linux triple is riscv64-linux-gnu (which is
> really riscv64-unknown-linux-gnu, but nobody uses that), though.

Should we do "riscv64-freebsd-gcc", by omitting the "unknown" vendor?

> All of Debian, Fedora and Arch ship their cross toolchains using
> riscv64-linux-gnu- as the prefix. The Bootlin toolchains are weird in
> providing riscv64-linux-gcc symlinks, though you?ll note those all
> symlink to riscv64-buildroot-linux-gnu tools (or indirect through
> toolchain-wrapper). I don?t know why they do that, they really should
> have a -gnu in there for the triples that don?t have a vendor. I
> suggest using riscv64-linux-gnu throughout and adding a note that the
> Bootlin toolchains currently omit the -gnu.

Maybe omitting "-gnu" means that they can be used for building Linux
kernel. "gun" sounds like for user space only?

The Linux kernel.org provided pre-built toolchains that are all
"<arch>-linux-" triples.
See https://mirrors.edge.kernel.org/pub/tools/crosstool/

Regards,
Bin

