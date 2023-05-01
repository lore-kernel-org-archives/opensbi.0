From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 1 May 2023 14:09:17 +0200
Subject: [PATCH v2] lib: sbi: Ensure SBI extension is available
In-Reply-To: <20230427094138.349029-1-ajones@ventanamicro.com>
References: <20230427094138.349029-1-ajones@ventanamicro.com>
Message-ID: <20230501-9d2aee781ad1dfa437c28adf@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 27, 2023 at 11:41:38AM +0200, Andrew Jones wrote:
> Ensure attempts to invoke SBI extension functions fail with
> SBI_ERR_NOT_SUPPORTED when the extension's probe function has
> reported that the extension is not available. By adding a new status
> member to the extension, which has three states (uninitialized,
> available, unavailable), we can ensure that the probe functions of
> single ID extensions, i.e.  extid_start == extid_end, are only
> invoked once, lazily, upon first use. Extensions that have multiple
> IDs cannot use a single status field to avoid making probe calls, as
> probe functions are extension ID specific. It's expected that these
> multi-ID extension probe functions implement their own optimizations
> in order to ensure extension lookups are fast.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  include/sbi/sbi_ecall.h | 14 ++++++++++++++
>  lib/sbi/sbi_ecall.c     | 26 ++++++++++++++++++++++----
>  2 files changed, 36 insertions(+), 4 deletions(-)
>

self-nack. Sent a v3 based on feedback I got on v1.

Thanks,
drew

