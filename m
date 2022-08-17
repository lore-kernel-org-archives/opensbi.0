From: Samuel Holland <samuel@sholland.org>
Date: Wed, 17 Aug 2022 01:06:02 -0500
Subject: [PATCH v1] lib: sbi_illegal_insn: Fix FENCE.TSO emulation
 infinite trap loop
In-Reply-To: <20220812135442.3771496-1-rpathak@ventanamicro.com>
References: <20220812135442.3771496-1-rpathak@ventanamicro.com>
Message-ID: <5f2c6e25-44df-7984-5277-78b5f0e438f8@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/12/22 8:54 AM, Rahul Pathak wrote:
> In case of missing "FENCE.TSO" instruction implementation,
> opensbi can emulate the "FENCE.TSO" with "FENCE RW,RW", but
> mepc was not incremented to continue from the next instruction
> causing infinite trap.
> 
> Fixes: cb8271c8 ("lib: sbi_illegal_insn: Add emulation for fence.tso")
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

Thanks for catching this!

