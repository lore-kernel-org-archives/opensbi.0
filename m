From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Jul 2021 10:52:24 +0800
Subject: [PATCH v4 2/5] fw_base: Put data in .data rather than .text
In-Reply-To: <20210709193423.29712-3-jrtc27@jrtc27.com>
References: <20210709193423.29712-1-jrtc27@jrtc27.com>
 <20210709193423.29712-3-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmXTP8UScYuhh462ekXoFP+v+nJBn-OuaiYOVC-1dqWNHw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 3:35 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> The -N linker option is supposed to make .text writable, but GNU ld and
> LLD differ in interpreting what that means. GNU ld will happily let you
> have relocations in it, but LLD will see that the input section is
> read-only (even though the output section is writable) and give an
> error. It's unclear if either of them intend to have that behaviour in
> this edge case, but regardless there's no reason not to just put the
> data in a writable .data section.
> ---
>  firmware/fw_base.S | 1 +
>  1 file changed, 1 insertion(+)
>

Again, your SoB tag was missed:

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

With this patch the following error seen when building with full LLVM
toolchain no longer exists:

 ELF       platform/generic/firmware/fw_dynamic.elf
ld.lld: error: can't create dynamic relocation R_RISCV_64 against
symbol: _fw_start in readonly segment; recompile object files with
-fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
>>> defined in opensbi/build/platform/generic/firmware/fw_dynamic.elf.ld:8
>>> referenced by fw_base.S:502 (opensbi/firmware/fw_base.S:502)
>>>               opensbi/build/platform/generic/firmware/fw_dynamic.o:(.entry+0x3A0)

ld.lld: error: can't create dynamic relocation R_RISCV_64 against
symbol: _fw_reloc_end in readonly segment; recompile object files with
-fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
>>> defined in opensbi/build/platform/generic/firmware/fw_dynamic.elf.ld:92
>>> referenced by fw_base.S:502 (opensbi/firmware/fw_base.S:502)
>>>               opensbi/build/platform/generic/firmware/fw_dynamic.o:(.entry+0x3B0)
clang-12: error: linker command failed with exit code 1 (use -v to see
invocation)
make: *** [Makefile:396:
opensbi/build/platform/generic/firmware/fw_dynamic.elf] Error 1

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

