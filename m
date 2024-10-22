From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 21 Oct 2024 21:38:13 -0500
Subject: [PATCH v4 7/7] lib: sbi: add Smdbltrp ISA extension support
In-Reply-To: <20241018084010.406285-8-cleger@rivosinc.com>
References: <20241018084010.406285-1-cleger@rivosinc.com>
 <20241018084010.406285-8-cleger@rivosinc.com>
Message-ID: <cc3da7ea-1166-4deb-90e8-ca65c127a95a@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-10-18 3:40 AM, Cl?ment L?ger wrote:
> Add support for the Smdbltrp[1] ISA extension. First thing to do is
> clearing MDT on entry after setting the first MTVEC (since MDT is
> reset to 1). Additionally, during trap handling, clear MDT once all
> critical CSRs have been saved and in return path, restore MSTATUS/H
> before restoring MEPC to avoid taking another trap which would clobber
> it.
> 
> Link: https://github.com/riscv/riscv-double-trap/releases/download/v0.56/riscv-double-trap.pdf [1]
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  firmware/fw_base.S           | 37 +++++++++++++++++++++++++++++++-----
>  include/sbi/riscv_encoding.h |  4 +++-
>  2 files changed, 35 insertions(+), 6 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


