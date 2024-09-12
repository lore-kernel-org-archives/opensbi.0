From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 12 Sep 2024 17:42:46 -0500
Subject: [PATCH 1/5] lib: sbi: factorize previous virtualization mode read
 from regs
In-Reply-To: <20240912121052.2959596-2-cleger@rivosinc.com>
References: <20240912121052.2959596-1-cleger@rivosinc.com>
 <20240912121052.2959596-2-cleger@rivosinc.com>
Message-ID: <9696e34b-b7ce-4368-ae57-83ccc9cd403c@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-12 7:10 AM, Cl?ment L?ger wrote:
> The same pattern is used at multiple places to verify in which mode
> the exception was actually taken. Factorize it.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/sbi_trap.h    |  9 +++++++++
>  lib/sbi/sbi_emulate_csr.c | 12 ++----------
>  lib/sbi/sbi_trap.c        |  6 +-----
>  3 files changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


