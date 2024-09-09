From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Sep 2024 16:25:29 -0700
Subject: [PATCH v4 1/4] include: adding support for Zicfilp / Zicfiss encodings
In-Reply-To: <20240823184735.4154272-2-debug@rivosinc.com>
References: <20240823184735.4154272-1-debug@rivosinc.com> <20240823184735.4154272-2-debug@rivosinc.com>
Message-ID: <CAHBxVyE_z2qVn271C6HqvZO2vS0re_o4nRmJF425bo-DcC_rgQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 23, 2024 at 11:47?AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> Zicfilp / Zicfiss extension (see link) introduces b2 (LPE) in menvcfg CSR to
> enable landing pads and b3 (SSE) in menvcfg CSR to enable shadow stack and
> landing pad for privilege less than M. Additionally extension introduces new
> bits in *status for recording landing pad state and a new exception type
> `software check exception` with cause=0x12.
>
> Link: https://github.com/riscv/riscv-cfi
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 2ed05f2..fa1d373 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -32,6 +32,7 @@
>  #define MSTATUS_TVM                    _UL(0x00100000)
>  #define MSTATUS_TW                     _UL(0x00200000)
>  #define MSTATUS_TSR                    _UL(0x00400000)
> +#define MSTATUS_SPELP          _UL(0x00800000)
>  #define MSTATUS32_SD                   _UL(0x80000000)
>  #if __riscv_xlen == 64
>  #define MSTATUS_UXL                    _ULL(0x0000000300000000)
> @@ -41,12 +42,14 @@
>  #define MSTATUS_GVA                    _ULL(0x0000004000000000)
>  #define MSTATUS_GVA_SHIFT              38
>  #define MSTATUS_MPV                    _ULL(0x0000008000000000)
> +#define MSTATUS_MPELP          _ULL(0x0000020000000000)
>  #else
>  #define MSTATUSH_SBE                   _UL(0x00000010)
>  #define MSTATUSH_MBE                   _UL(0x00000020)
>  #define MSTATUSH_GVA                   _UL(0x00000040)
>  #define MSTATUSH_GVA_SHIFT             6
>  #define MSTATUSH_MPV                   _UL(0x00000080)
> +#define MSTATUSH_MPELP                 _UL(0x00000200)
>  #endif
>  #define MSTATUS32_SD                   _UL(0x80000000)
>  #define MSTATUS64_SD                   _ULL(0x8000000000000000)
> @@ -220,6 +223,8 @@
>  #define ENVCFG_CBIE_ILL                        _UL(0x0)
>  #define ENVCFG_CBIE_FLUSH              _UL(0x1)
>  #define ENVCFG_CBIE_INV                        _UL(0x3)
> +#define ENVCFG_SSE                     (_UL(1) << 3)
> +#define ENVCFG_LPE                     (_UL(1) << 2)
>  #define ENVCFG_FIOM                    _UL(0x1)
>
>  /* ===== User-level CSRs ===== */
> @@ -228,6 +233,7 @@
>  #define CSR_USTATUS                    0x000
>  #define CSR_UIE                                0x004
>  #define CSR_UTVEC                      0x005
> +#define CSR_SSP                                0x011
>
>  /* User Trap Handling (N-extension) */
>  #define CSR_USCRATCH                   0x040
> @@ -763,6 +769,7 @@
>  #define CAUSE_FETCH_PAGE_FAULT         0xc
>  #define CAUSE_LOAD_PAGE_FAULT          0xd
>  #define CAUSE_STORE_PAGE_FAULT         0xf
> +#define CAUSE_SW_CHECK_EXCP                    0x12
>  #define CAUSE_FETCH_GUEST_PAGE_FAULT   0x14
>  #define CAUSE_LOAD_GUEST_PAGE_FAULT    0x15
>  #define CAUSE_VIRTUAL_INST_FAULT       0x16
> --
> 2.44.0
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

