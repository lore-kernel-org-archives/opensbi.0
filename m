From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 12 Jul 2021 01:59:00 +0100
Subject: [PATCH v2] README: Update toolchain information
In-Reply-To: <CAEUhbmWsnUBq-CBRTX_7rbOcw-ypf0CPdQC2yiXiBvu=vq++iA@mail.gmail.com>
References: <20210712003029.19956-1-bmeng.cn@gmail.com>
 <1E43F020-34C7-4442-BB73-4AC8059ABB40@jrtc27.com>
 <CAEUhbmWsnUBq-CBRTX_7rbOcw-ypf0CPdQC2yiXiBvu=vq++iA@mail.gmail.com>
Message-ID: <8C6C62EE-E0D7-4941-80A8-6A461822C1F4@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12 Jul 2021, at 01:43, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> On Mon, Jul 12, 2021 at 8:38 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 12 Jul 2021, at 01:30, Bin Meng <bmeng.cn@gmail.com> wrote:
>>> 
>>> Recent FW_PIC=y changes actually require toolchains with PIE support
>>> and it is on by default. Existing doc uses a GNU bare-metal toolchain
>>> as examples but it does not support PIE.
>>> 
>>> Replace references of bare-metal toolchain prefix with Linux toolchain
>>> prefix everywhere in documentation.
>>> 
>>> Also indicate that "riscv64-unknown-freebsd-" as an alternative to
>>> "riscv64-linux-" GNU toolchain.
>> 
>> Thanks for the changes. The Linux triple is riscv64-linux-gnu (which is
>> really riscv64-unknown-linux-gnu, but nobody uses that), though.
> 
> Should we do "riscv64-freebsd-gcc", by omitting the "unknown" vendor?

No, FreeBSD likes to leave the unknown in there, I guess because people
like their triples to be actual triples and not doubles, even if it?s a
waste of space.

>> All of Debian, Fedora and Arch ship their cross toolchains using
>> riscv64-linux-gnu- as the prefix. The Bootlin toolchains are weird in
>> providing riscv64-linux-gcc symlinks, though you?ll note those all
>> symlink to riscv64-buildroot-linux-gnu tools (or indirect through
>> toolchain-wrapper). I don?t know why they do that, they really should
>> have a -gnu in there for the triples that don?t have a vendor. I
>> suggest using riscv64-linux-gnu throughout and adding a note that the
>> Bootlin toolchains currently omit the -gnu.
> 
> Maybe omitting "-gnu" means that they can be used for building Linux
> kernel. "gun" sounds like for user space only?

It?s a bit of a mess. In theory, yes, -gnu means glibc (there?s also a
-musl and -android). But there are several reasons that?s not entirely
true:

* arm-linux-gnueabi complicates things, as there is no non-libc way to
  get the EABI instead of the OABI (though there is a -musleabi)

* Some parts of the Linux kernel documentation say to use $CPU-linux-,
  others say to use $CPU-linux-gnu

* The Bootlin toolchain is a glibc toolchain (it has glibc libraries
  and headers, plus the full executable names are
  riscv46-buildroot-linux-gnu, not riscv64-buildroot-linux) yet gives
  the shortened paths as just riscv64-linux, which is incorrect, as
  that?s not the same thing, even if in practice people take it to be

So, you?re right in the sense that riscv64-linux- means no glibc, but
not in the sense that the binaries shipped by Bootlin mean that, I
believe.

Jess

> The Linux kernel.org provided pre-built toolchains that are all
> "<arch>-linux-" triples.
> See https://mirrors.edge.kernel.org/pub/tools/crosstool/
> 
> Regards,
> Bin


