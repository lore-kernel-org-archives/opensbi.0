From: Samuel Holland <samuel.holland@sifive.com>
Date: Sat, 14 Sep 2024 11:43:00 -0500
Subject: [PATCH v5 1/4] include: adding support for Zicfilp / Zicfiss
 encodings
In-Reply-To: <20240910163522.2584936-2-debug@rivosinc.com>
References: <20240910163522.2584936-1-debug@rivosinc.com>
 <20240910163522.2584936-2-debug@rivosinc.com>
Message-ID: <1c0f1579-fba0-47d4-9026-f1ddceff05ba@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-10 11:35 AM, Deepak Gupta wrote:
> Zicfilp / Zicfiss extension (see link) introduces b2 (LPE) in menvcfg CSR to
> enable landing pads and b3 (SSE) in menvcfg CSR to enable shadow stack and
> landing pad for privilege less than M. Additionally extension introduces new
> bits in *status for recording landing pad state and a new exception type
> `software check exception` with cause=0x12.
> 
> Link: https://github.com/riscv/riscv-cfi
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


