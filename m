From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 21 Mar 2023 09:47:47 +0100
Subject: [RFC PATCH v1 2/4] lib: sbi: Implement SBI CPPC extension
In-Reply-To: <20230321042054.579520-3-sunilvl@ventanamicro.com>
References: <20230321042054.579520-1-sunilvl@ventanamicro.com>
 <20230321042054.579520-3-sunilvl@ventanamicro.com>
Message-ID: <20230321084747.onfwqf32i6vamotr@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 21, 2023 at 09:50:52AM +0530, Sunil V L wrote:
> Implement SBI CPPC extension. This extension is only available when
> OpenSBI platform provides a CPPC device to generic library.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  include/sbi/sbi_cppc.h   |  35 ++++++++++++++
>  lib/sbi/Kconfig          |   4 ++
>  lib/sbi/objects.mk       |   4 ++
>  lib/sbi/sbi_cppc.c       | 101 +++++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_ecall_cppc.c |  63 ++++++++++++++++++++++++
>  5 files changed, 207 insertions(+)
>  create mode 100644 include/sbi/sbi_cppc.h
>  create mode 100644 lib/sbi/sbi_cppc.c
>  create mode 100644 lib/sbi/sbi_ecall_cppc.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


