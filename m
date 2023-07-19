From: Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 19 Jul 2023 08:07:31 +0100
Subject: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
In-Reply-To: <CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
References: <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <CAAhSdy3J5HUoVP21jo11FBuAFSPSxHNKtuL7amn-5t7n_smoSg@mail.gmail.com>
 <20230714-reoccur-confined-4b37494b1201@spud>
 <20230714-hash-handwrite-339817b93ba1@spud>
 <CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
 <CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
Message-ID: <20230719-dioxide-panic-cda48b1d8d1b@wendy>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 19, 2023 at 11:32:55AM +1000, Alistair Francis wrote:

> If there is no OpenSBI 1.3.1 release we should add something to the
> release notes. @Conor Dooley are you able to give a clear sentence on
> how the boot fails?

Uhh, I'll give it a shot, but hopefully it is not required :)

In version v1.3, OpenSBI's aclint drivers fail to initialise if they
encounter a disabled CPU node in the devicetree. Attempting to boot
using, for example, the Linux kernel's PolarFire SoC or Freedom U540
devicetrees, will fail with the error:
"init_coldboot: ipi init failed (error -1009)"
Please see OpenSBI commit c6a3573 ("lib: utils: Fix sbi_hartid_to_scratch()
usage in ACLINT drivers")
<https://github.com/riscv-software-src/opensbi/commit/c6a35733b74aeff612398f274ed19a74f81d1f37>
for the fix.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230719/839e4402/attachment.sig>
