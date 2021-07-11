From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 11 Jul 2021 17:34:54 +0100
Subject: [PATCH] README: Update toolchain information
In-Reply-To: <20210711163218.11422-1-bmeng.cn@gmail.com>
References: <20210711163218.11422-1-bmeng.cn@gmail.com>
Message-ID: <3B02175B-3C29-4FFD-A575-FBEE7DEE2DAA@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11 Jul 2021, at 17:32, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> Recent FW_PIC=y changes actually require toolchains with PIE support
> and it is on by default. Existing doc uses a bare-metal toolchain as
> examples but it does not support PIE.
> 
> Replace references of bare-metal toolchain prefix with linux toolchain
> prefix everywhere in documentation.

LLVM toolchains should continue to prefer bare-metal triples. Please
also include riscv64-unknown-freebsd- as an alternative to
riscv64-linux-gnu- so there is no bias towards Linux, as is often
unfortunately seen in the RISC-V world.

Jess


