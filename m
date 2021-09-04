From: Sean Anderson <seanga2@gmail.com>
Date: Sat, 4 Sep 2021 11:53:56 -0400
Subject: [RFC 1/1] platform/kendryte: disable FW_PIC
In-Reply-To: <CAAhSdy09GB8Ni5QxCZ9kik-O531AqRyM7bGvZoaqDinH1ab-hg@mail.gmail.com>
References: <20210904094814.157823-1-xypron.glpk@gmx.de>
 <CAEUhbmWCFfPXTzOAenONkq3kUkuNuS4ctTPTPPvYDNrPsUK0Kw@mail.gmail.com>
 <83b0c28e-4150-dfe9-19db-172365758b3c@gmail.com>
 <CAAhSdy09GB8Ni5QxCZ9kik-O531AqRyM7bGvZoaqDinH1ab-hg@mail.gmail.com>
Message-ID: <ad5f3a7d-63a2-bd46-934e-d9dcf7ad27cc@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 9/4/21 11:37 AM, Anup Patel wrote:
> On Sat, Sep 4, 2021 at 8:38 PM Sean Anderson <seanga2@gmail.com> wrote:
>>
>> On 9/4/21 9:56 AM, Bin Meng wrote:
>>> On Sat, Sep 4, 2021 at 5:49 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>
>>>> Since commit bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
>>>> building with
>>>>
>>>> make \
>>>> PLATFORM=kendryte/k210 \
>>>> FW_PAYLOAD=y \
>>>> FW_PAYLOAD_OFFSET=0x40000 \
>>>> FW_PAYLOAD_PATH=u-boot-dtb.bin
>>>>
>>>> fails:
>>>>
>>>> riscv64-linux-gnu/bin/ld:
>>>> opensbi/build/platform/kendryte/k210/firmware/fw_payload.o:
>>>> in function `.L0 ':
>>>> opensbi/firmware/fw_base.S:77:
>>>> undefined reference to `__rel_dyn_start'
>>>> riscv64-linux-gnu/bin/ld:
>>>> opensbi/firmware/fw_base.S:78:
>>>> undefined reference to `__rel_dyn_end'
>>>> riscv64-linux-gnu/bin/ld:
>>>> opensbi/firmware/fw_base.S:89:
>>>> undefined reference to `__dyn_sym_start'
>>>> collect2: error: ld returned 1 exit status
>>>>
>>>
>>> It looks like your toolchain is broken. I can build with your command
>>> without any error. I am using buildroot 2020.08-1 toolchain.
>>
>> With the "riscv64-linux-gnu" [1] toolchain, I get the above error.
>>
>> With the "riscv64-elf" toolchain [2], everything compiles fine.
> 
> I am not seeing this compile error. I am using riscv64-unknown-linux-gnu
> toolchain.
> 
> Using built-in specs.
> COLLECT_GCC=riscv64-unknown-linux-gnu-gcc
> COLLECT_LTO_WRAPPER=/home/anup/Work/tools/riscv/mlocal/libexec/gcc/riscv64-unknown-linux-gnu/9.2.0/lto-wrapper
> Target: riscv64-unknown-linux-gnu
> Configured with:
> /home/anup/Work/riscv-test/riscv-gnu-toolchain/riscv-gcc/configure
> --target=riscv64-unknown-linux-gnu
> --prefix=/home/anup/Work/tools/riscv/mlocal
> --with-sysroot=/home/anup/Work/tools/riscv/mlocal/sysroot
> --with-system-zlib --enable-shared --enable-tls
> --enable-languages=c,c++,fortran --disable-libmudflap --disable-libssp
> --disable-libquadmath --disable-nls --disable-bootstrap
> --src=.././riscv-gcc --enable-multilib --with-abi=lp64d
> --with-arch=rv64imafdc --with-tune=rocket 'CFLAGS_FOR_TARGET=-O2
> -mcmodel=medlow' 'CXXFLAGS_FOR_TARGET=-O2   -mcmodel=medlow'
> Thread model: posix
> gcc version 9.2.0 (GCC)
> 
> What am I missing ?

Mine reports

Using built-in specs.
COLLECT_GCC=riscv64-elf-gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/riscv64-elf/11.1.0/lto-wrapper
Target: riscv64-elf
Configured with: /build/riscv64-elf-gcc/src/gcc-11.1.0/configure --target=riscv64-elf --prefix=/usr --with-sysroot=/usr/riscv64-elf --with-native-system-header-dir=/include --libexecdir=/usr/lib --enable-languages=c,c++ --enable-threads=single --enable-plugins --enable-multilib --enable-libgcc --disable-libgomp --disable-libquadmath --disable-libffi --disable-libssp --disable-libmudflap --disable-decimal-float --disable-libstdcxx-pch --disable-nls --disable-shared --disable-tls --with-newlib --with-gnu-as --with-gnu-ld --with-system-zlib --with-headers=/usr/riscv64-elf/include --with-python-dir=share/gcc-riscv64-elf --with-gmp --with-mpfr --with-mpc --with-isl --with-libelf --enable-gnu-indirect-function --with-pkgversion='Arch Linux Repositories' --with-bugurl=https://bugs.archlinux.org/
Thread model: single
Supported LTO compression algorithms: zlib zstd
gcc version 11.1.0 (Arch Linux Repositories)

with the difference being

--- gcc-anup	2021-09-04 11:47:35.801813191 -0400
+++ gcc-linux	2021-09-04 11:47:32.411810152 -0400
@@ -1,27 +1,41 @@
  Using built-in specs.
-COLLECT_GCC=riscv64-unknown-linux-gnu-gcc
-COLLECT_LTO_WRAPPER=/home/anup/Work/tools/riscv/mlocal/libexec/gcc/riscv64-unknown-linux-gnu/9.2.0/lto-wrapper
-Target: riscv64-unknown-linux-gnu
+COLLECT_GCC=riscv64-linux-gnu-gcc
+COLLECT_LTO_WRAPPER=/usr/lib/gcc/riscv64-linux-gnu/11.1.0/lto-wrapper
+Target: riscv64-linux-gnu
  Configured with:
-/home/anup/Work/riscv-test/riscv-gnu-toolchain/riscv-gcc/configure
-'CXXFLAGS_FOR_TARGET=-O2'
---disable-bootstrap
---disable-libmudflap
---disable-libquadmath
+/build/riscv64-linux-gnu-gcc/src/gcc-11.1.0/configure
+--build=x86_64-pc-linux-gnu
  --disable-libssp
+--disable-libstdcxx-pch
+--disable-libunwind-exceptions
+--disable-multilib
  --disable-nls
---enable-languages=c,c++,fortran
---enable-multilib
+--disable-werror
+--enable-__cxa_atexit
+--enable-checking=release
+--enable-clocale=gnu
+--enable-default-pie
+--enable-gnu-indirect-function
+--enable-gnu-unique-object
+--enable-install-libiberty
+--enable-languages=c,c++
+--enable-linker-build-id
+--enable-lto
+--enable-plugin
  --enable-shared
---enable-tls
---prefix=/home/anup/Work/tools/riscv/mlocal
---src=.././riscv-gcc
---target=riscv64-unknown-linux-gnu
---with-abi=lp64d
---with-arch=rv64imafdc
---with-sysroot=/home/anup/Work/tools/riscv/mlocal/sysroot
+--enable-threads=posix
+--host=x86_64-pc-linux-gnu
+--libdir=/usr/lib
+--libexecdir=/usr/lib
+--prefix=/usr
+--program-prefix=riscv64-linux-gnu-
+--target=riscv64-linux-gnu
+--with-build-sysroot=/usr/riscv64-linux-gnu
+--with-isl
+--with-linker-hash-style=gnu
+--with-local-prefix=/usr/riscv64-linux-gnu
+--with-sysroot=/usr/riscv64-linux-gnu
  --with-system-zlib
---with-tune=rocket
--mcmodel=medlow
  Thread model: posix
-gcc version 9.2.0 (GCC)
+Supported LTO compression algorithms: zlib zstd
+gcc version 11.1.0 (GCC)

Nothing in the configure flags pops out to me, but perhaps the issue is
between 9 and 11? For comparison, the difference between my -linux-gnu
and -elf is:

--- gcc-linux	2021-09-04 11:47:32.411810152 -0400
+++ gcc-elf	2021-09-04 11:48:26.141859419 -0400
@@ -1,41 +1,42 @@
  Using built-in specs.
-COLLECT_GCC=riscv64-linux-gnu-gcc
-COLLECT_LTO_WRAPPER=/usr/lib/gcc/riscv64-linux-gnu/11.1.0/lto-wrapper
-Target: riscv64-linux-gnu
-Configured with:
-/build/riscv64-linux-gnu-gcc/src/gcc-11.1.0/configure
---build=x86_64-pc-linux-gnu
+COLLECT_GCC=riscv64-elf-gcc
+COLLECT_LTO_WRAPPER=/usr/lib/gcc/riscv64-elf/11.1.0/lto-wrapper
+Target: riscv64-elf
+Configured with: /build/riscv64-elf-gcc/src/gcc-11.1.0/configure
+--disable-decimal-float
+--disable-libffi
+--disable-libgomp
+--disable-libmudflap
+--disable-libquadmath
  --disable-libssp
  --disable-libstdcxx-pch
---disable-libunwind-exceptions
---disable-multilib
  --disable-nls
---disable-werror
---enable-__cxa_atexit
---enable-checking=release
---enable-clocale=gnu
---enable-default-pie
+--disable-shared
+--disable-tls
  --enable-gnu-indirect-function
---enable-gnu-unique-object
---enable-install-libiberty
  --enable-languages=c,c++
---enable-linker-build-id
---enable-lto
---enable-plugin
---enable-shared
---enable-threads=posix
---host=x86_64-pc-linux-gnu
---libdir=/usr/lib
+--enable-libgcc
+--enable-multilib
+--enable-plugins
+--enable-threads=single
  --libexecdir=/usr/lib
  --prefix=/usr
---program-prefix=riscv64-linux-gnu-
---target=riscv64-linux-gnu
---with-build-sysroot=/usr/riscv64-linux-gnu
+--target=riscv64-elf
+--with-bugurl=https://bugs.archlinux.org/
+--with-gmp
+--with-gnu-as
+--with-gnu-ld
+--with-headers=/usr/riscv64-elf/include
  --with-isl
---with-linker-hash-style=gnu
---with-local-prefix=/usr/riscv64-linux-gnu
---with-sysroot=/usr/riscv64-linux-gnu
+--with-libelf
+--with-mpc
+--with-mpfr
+--with-native-system-header-dir=/include
+--with-newlib
+--with-pkgversion='Arch Linux Repositories'
+--with-python-dir=share/gcc-riscv64-elf
+--with-sysroot=/usr/riscv64-elf
  --with-system-zlib
-Thread model: posix
+Thread model: single
  Supported LTO compression algorithms: zlib zstd
-gcc version 11.1.0 (GCC)
+gcc version 11.1.0 (Arch Linux Repositories)

--Sean

