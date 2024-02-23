From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Feb 2024 10:35:14 +0530
Subject: [PATCH 0/4] Add relocatable address support for jump and payload firmware
In-Reply-To: <IA1PR20MB495352218C0BF2CE8D86B3B9BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495352218C0BF2CE8D86B3B9BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy1gcFvPgp5WRSh=u3xc=zRW7kHs6T3CfK3FH5PY6DW37g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 2, 2024 at 9:34?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> If FW_PIC=y is defined, the jump and payload firmware and will
> be broken if FW_TEXT_START is wrong. This is not the desired behavior.
>
> Add some new variable to support relocatable address.
>
> build command:
> make BUILD_INFO=y DEBUG=1 FW_PIC=y PLATFORM=generic FW_TEXT_START=0x0
>
> test command:
> qemu-system-riscv64 -smp cpus=4 -M virt -m 256M \
>   -bios build/platform/generic/firmware/fw_payload.bin

Overall this patch is in the right direction but the new options should not
depend on FW_PIC.

Regards,
Anup

>
> Inochi Amaoto (4):
>   firmware: Add relocatable FW_JUMP_ADDR and FW_JUMP_FDT_ADDR
>   firmware: Add relocatable FW_PAYLOAD_FDT_ADDR
>   platform: Apply relocatable address
>   doc/firmware: add new configuration options for jump and payload
>     firmware
>
>  docs/firmware/fw_jump.md    | 17 ++++++++++++++---
>  docs/firmware/fw_payload.md |  6 ++++++
>  firmware/fw_jump.S          | 20 ++++++++++++++++----
>  firmware/fw_payload.S       |  4 ++++
>  firmware/objects.mk         | 21 +++++++++++++++++++++
>  platform/generic/objects.mk |  8 ++++----
>  6 files changed, 65 insertions(+), 11 deletions(-)
>
> --
> 2.43.0
>

