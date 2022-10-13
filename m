From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Oct 2022 16:25:59 +0200
Subject: [PATCH 3/3] lib: sbi_ecall: Add Kconfig option for each extension
In-Reply-To: <TYYP286MB14396945149DFFB36ADA5D8FC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14396945149DFFB36ADA5D8FC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <20221013142559.nzpxafcsp3yaffdp@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 11, 2022 at 12:34:45AM +0800, Vivian Wang wrote:
> For each SBI extension, we:
> 
> - Add a Kconfig option for it
> - Add the extension to sbi_ecall_exts only if the extension is enabled
> - Add the corresponding sbi_ecall_* object file only if the extension is
>   enabled
> 
> Special cases are as follows:
> 
> - The legacy extensions are lumped together as one 'big' extension, as
>   has always been the case in OpenSBI code.
> - The platform-defined vendor extensions are regarded as one extension.
> - The Base extension cannot be disabled.
> - sbi_ecall_replace implements multiple extensions, so it's not easy to
>   avoid linking it in. Enable it always, and use #ifdef to
>   disable/enable individual extensions.

It's tempting to use this as an opportunity to break sbi_ecall_replace up
into different files, but I'm not sure it's worth it.

