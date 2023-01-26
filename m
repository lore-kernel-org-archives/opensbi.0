From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 26 Jan 2023 12:25:14 +0100
Subject: OpenSBI (c45992c [master branch]) and U-Boot 2023.01 on QEMU
 7.2.0 does not boot?
In-Reply-To: <CAEn-LTqz3+Xr8PxPZvemW3g=Rmujcrt5Ukqn9-Jk9jCyWxdydQ@mail.gmail.com>
References: <CAEn-LTqz3+Xr8PxPZvemW3g=Rmujcrt5Ukqn9-Jk9jCyWxdydQ@mail.gmail.com>
Message-ID: <20230126112514.b6gwdnht4ih4oqgm@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 26, 2023 at 12:04:26PM +0200, David Abdurachmanov wrote:
> Hi,
> 
> I have been updating U-Boot + OpenSBI on Fedora/RISCV because it
> didn't work on QEMU, but worked on Unmatched. I picked up U-Boot
> 2023.01 + OpenSBI (master branch, c45992c) and to my surprise that got
> even worse. I am getting nothing after:
> 
> U-Boot SPL 2023.01 (Jan 25 2023 - 00:00:00 +0000)
> Trying to boot from RAM
> 
> New binaries are passed to QEMU via:
> [..]
> -bios c/usr/share/uboot/qemu-riscv64_spl/u-boot-spl.bin \
> -device loader,file=c/usr/share/uboot/qemu-riscv64_spl/u-boot.itb,addr=0x80200000
> \
> [..]
> 
> I decided to pick OpenSBI v1.2 (final tag) and that works fine. Is
> there a regression with OpenSBI master?

Hi David,

Maybe you're hitting the same thing that Jessica just fixed

http://lists.infradead.org/pipermail/opensbi/2023-January/004329.html

Thanks,
drew

