From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Oct 2022 16:26:34 +0200
Subject: [PATCH 0/3] Add Kconfig option for each extension
In-Reply-To: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <20221013142634.lckftxftddwluzy7@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 11, 2022 at 12:33:02AM +0800, Vivian Wang wrote:
> This series adds support for disabling SBI extensions via Kconfig. In
> the future, Kconfig can also be used to disable obsolete extensions by
> default.
> 
> All of the SBI extensions except Base extension is optional [1]. Users
> of OpenSBI may wish to disable support for some of the extensions for
> reasons such as:
> 
> - Future-proofing S-mode software, replacing SBI calls with
>   new ISA functionality.
> - Testing S-mode software to make sure they work correctly without
>   certain extensions present.
> - Disabling unused extensions to minimize the attack surface of M-mode
>   software. See [2].
> 
> [1]: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#1-introduction
> [2]: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/102
>

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

