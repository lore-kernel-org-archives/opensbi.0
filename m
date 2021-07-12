From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 12 Jul 2021 01:38:33 +0100
Subject: [PATCH v2] README: Update toolchain information
In-Reply-To: <20210712003029.19956-1-bmeng.cn@gmail.com>
References: <20210712003029.19956-1-bmeng.cn@gmail.com>
Message-ID: <1E43F020-34C7-4442-BB73-4AC8059ABB40@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12 Jul 2021, at 01:30, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> Recent FW_PIC=y changes actually require toolchains with PIE support
> and it is on by default. Existing doc uses a GNU bare-metal toolchain
> as examples but it does not support PIE.
> 
> Replace references of bare-metal toolchain prefix with Linux toolchain
> prefix everywhere in documentation.
> 
> Also indicate that "riscv64-unknown-freebsd-" as an alternative to
> "riscv64-linux-" GNU toolchain.

Thanks for the changes. The Linux triple is riscv64-linux-gnu (which is
really riscv64-unknown-linux-gnu, but nobody uses that), though. All of
Debian, Fedora and Arch ship their cross toolchains using
riscv64-linux-gnu- as the prefix. The Bootlin toolchains are weird in
providing riscv64-linux-gcc symlinks, though you?ll note those all
symlink to riscv64-buildroot-linux-gnu tools (or indirect through
toolchain-wrapper). I don?t know why they do that, they really should
have a -gnu in there for the triples that don?t have a vendor. I
suggest using riscv64-linux-gnu throughout and adding a note that the
Bootlin toolchains currently omit the -gnu.

Jess


