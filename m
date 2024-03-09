From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 Mar 2024 19:14:33 +0530
Subject: [PATCH v6 0/5] Improvements to fw_base.S
In-Reply-To: <20240304121557.502655-1-wxjstz@126.com>
References: <20240304121557.502655-1-wxjstz@126.com>
Message-ID: <CAAhSdy3RVsgnzrxfXu=rxEdyCeRW=Ve3PATsRRiqcWyvnaTxEQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 4, 2024 at 5:46?PM Xiang W <wxjstz@126.com> wrote:
>
> v6 changes:
> - drop patch1 firmware: remove copy-base relocation
> - drop patch7 firmware: Improve fw_boot_hart
> - drop patch8 firmware: Use C if possible
> - rebase code
>
> Xiang W (5):
>   firmware: fw_base.S: Simplify address get
>   firmware: fw_base: Simplified setup trap handler
>   firmware: fw_dynamic.S: Remove _bad_dynamic_info
>   firmware: fw_base.S: Remove _relocate_lottery
>   firmware: fw_base.S: fix _reset_regs

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  firmware/fw_base.S    | 85 ++++++++++++-------------------------------
>  firmware/fw_dynamic.S | 10 +----
>  2 files changed, 26 insertions(+), 69 deletions(-)
>
> --
> 2.43.0
>

