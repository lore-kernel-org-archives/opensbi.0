From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 Aug 2024 11:14:10 -0700
Subject: [PATCH v3 2/4] lib: sbi: Zicfilp/Zicfiss detection and elp cfi
 state reflect back in status
In-Reply-To: <20240822174828.4031332-3-debug@rivosinc.com>
References: <20240822174828.4031332-1-debug@rivosinc.com>
 <20240822174828.4031332-3-debug@rivosinc.com>
Message-ID: <Zsd/8kP6sJ4vGWiY@debug.ba.rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 22, 2024 at 10:48:26AM -0700, Deepak Gupta wrote:
>This patch adds support for zicfilp / zicfiss detection in sbi_hart.c
>If zicfilp and zicfiss are detected, this patch turns on menvcfg.LPE and
>menvcfg.SSE

Note to self.
Comment needs fixup. Turn on of LPE and SSE is via FWFT

>
>Zicfilp records status of hart's ELP state in *status csr. Missing landing pad
>sets MPELP in mstatus. When SBI is redirecting back to S/VS/HS, SPELP is
>set in sstatus/vsstatus.
>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>---

