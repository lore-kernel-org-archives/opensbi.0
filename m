From: Vivian Wang <uwu@dram.page>
Date: Tue, 13 Sep 2022 22:15:39 +0800
Subject: [PATCH 1/1] docs/firmware: Update FW_JUMP documentation
In-Reply-To: <20220913054605.19929-1-nylon.chen@sifive.com>
References: <20220913054605.19929-1-nylon.chen@sifive.com>
Message-ID: <4d15d742-85f9-d679-d21e-528f6a09e4c4@dram.page>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

(Resent to avoid mailing list error wrt HTML messages. Sorry.)

On 9/13/22 13:46, Nylon Chen wrote:
> From: "Nylon.Chen" <nylon.chen@sifive.com>
>
> Add a tip for OpenSBI's Jump mode.
>
> help user avoids the kernel overwritten.
>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Signed-off-by: Nylon.Chen <nylon.chen@sifive.com>
> ---
>  docs/firmware/fw_jump.md | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> index 35a4301..c20d722 100644
> --- a/docs/firmware/fw_jump.md
> +++ b/docs/firmware/fw_jump.md
> @@ -40,6 +40,24 @@ follows:
>    the booting stage following the OpenSBI firmware. If this option is not
>    provided, then the OpenSBI firmware will pass the FDT address passed by the
>    previous booting stage to the next booting stage.
> +  
> +  If your *PLATFORM=generic* and your *FW_JUMP_FDT_ADDR* is default, you must check
> +  your Linux size because Linux will be overwritten in OpneSBI's FDT copy loop.
Typo: OpneSBI -> OpenSBI
> +  You can use the following method.
> +
> +  ```
> +  LAST_SECTION=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" | awk '{print $5,$3}'\
> +  | sort -rfu | head -n 1 | awk '{split($0,addr," ");print addr[1]}'` \
> +  && LAST_SECTION_SIZE=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" |awk '{print $5,$3}'\
> +  | sort -rfu | head -n 1 | awk '{split($0,addr,"")}'` \
> +  && OFFSET_ADDR=$(( 16#$LAST_SECTION_SIZE + 16#$LAST_SECTION)) \
> +  && printf "The LMA of the last section of the Kernel is 0x%X\n" ${OFFSET_ADDR}
> +  ```

I couldn't get this particular shell command/script to work on a random
kernel I've built. LAST_SECTION_SIZE seems to be the empty string, which
gives the following error:

bash: 16#: invalid integer constant (error token is "16#")

I'm not sure how this command works, so I have pasted the output of
objdump at the bottom of this message. Hopefully it should help with
fixing it.

Also, It seems that the intention is to parse the output of 'objdump -h
vmlinux' and find the maximum value of LMA + Size among the sections,
which in my case corresponds to the .bss section. It would be helpful if
there's an explanation for this code, so that those reading the
documentation know what they are doing.

Thanks,
dram

> +  If the result is bigger than the default of FW_JUMP_FDT_ADDR(0x2200000), 
> +  you must change it to avoid the problem of being overwritten.
> +
> +
>  
>  *FW_JUMP* Example
>  -----------------

Output of 'riscv64-unknown-linux-gnu-objdump -h vmlinux':

vmlinux:     file format elf64-littleriscv

Sections:
Idx Name          Size      VMA               LMA               File off  Algn
  0 .head.text    0000019a  ffffffff80000000  0000000000000000  00001000  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .text         005bca24  ffffffff80001000  0000000000001000  00002000  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .init.text    0002a3e6  ffffffff80600000  0000000000600000  00600000  2**21
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  3 .exit.text    00001402  ffffffff8062a3e8  000000000062a3e8  0062a3e8  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  4 .init.data    00013da0  ffffffff80800000  0000000000800000  0062c000  2**12
                  CONTENTS, ALLOC, LOAD, DATA
  5 .data..percpu 00008178  ffffffff80814000  0000000000814000  00640000  2**6
                  CONTENTS, ALLOC, LOAD, DATA
  6 .alternative  00000750  ffffffff8081c178  000000000081c178  00648178  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  7 .rodata       0015cbb8  ffffffff80a00000  0000000000a00000  00649000  2**6
                  CONTENTS, ALLOC, LOAD, DATA
  8 .pci_fixup    00003ba0  ffffffff80b5cbb8  0000000000b5cbb8  007a5bb8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  9 __ksymtab     00016650  ffffffff80b60758  0000000000b60758  007a9758  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 10 __ksymtab_gpl 000166e0  ffffffff80b76da8  0000000000b76da8  007bfda8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 11 __ksymtab_strings 00022833  ffffffff80b8d488  0000000000b8d488  007d6488  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 12 __param       00002170  ffffffff80bafcc0  0000000000bafcc0  007f8cc0  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 13 __modver      000001f8  ffffffff80bb1e30  0000000000bb1e30  007fae30  2**3
                  CONTENTS, ALLOC, LOAD, DATA
 14 __ex_table    000019ec  ffffffff80bb2028  0000000000bb2028  007fb028  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 15 .notes        00000054  ffffffff80bb3a14  0000000000bb3a14  007fca14  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 16 .srodata      00000960  ffffffff80c00000  0000000000c00000  007fd000  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 17 .data         000ba460  ffffffff80e00000  0000000000e00000  007fe000  2**12
                  CONTENTS, ALLOC, LOAD, DATA
 18 __bug_table   00015798  ffffffff80eba460  0000000000eba460  008b8460  2**0
                  CONTENTS, ALLOC, LOAD, DATA
 19 .sdata        00000934  ffffffff80ecfbf8  0000000000ecfbf8  008cdbf8  2**3
                  CONTENTS, ALLOC, LOAD, DATA
 20 .sbss         00001dac  ffffffff80ed1000  0000000000ed1000  008ce52c  2**6
                  ALLOC
 21 .bss          0005fc28  ffffffff80ed3000  0000000000ed3000  008ce52c  2**12
                  ALLOC
 22 .debug_aranges 000157b0  0000000000000000  0000000000000000  008ce530  2**4
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 23 .debug_info   05c15652  0000000000000000  0000000000000000  008e3ce0  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 24 .debug_abbrev 002ec6e9  0000000000000000  0000000000000000  064f9332  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 25 .debug_line   0127e177  0000000000000000  0000000000000000  067e5a1b  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 26 .debug_frame  001c9e50  0000000000000000  0000000000000000  07a63b98  2**3
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 27 .debug_str    002287ec  0000000000000000  0000000000000000  07c2d9e8  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 28 .debug_line_str 0000af3c  0000000000000000  0000000000000000  07e561d4  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 29 .debug_loclists 01367310  0000000000000000  0000000000000000  07e61110  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 30 .debug_rnglists 00552cc6  0000000000000000  0000000000000000  091c8420  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 31 .comment      00000012  0000000000000000  0000000000000000  0971b0e6  2**0
                  CONTENTS, READONLY
 32 .riscv.attributes 00000037  0000000000000000  0000000000000000  0971b0f8  2**0
                  CONTENTS, READONLY


