From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Aug 2022 09:52:14 +0200
Subject: [PATCH 4/5] lib: sbi_trap: Set hypervisor CSRs for HS-mode
In-Reply-To: <TYYP286MB1439D2AB7CFD5C0E58107ECFC69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439C5C64BCF8E9DB7883772C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220804031706.2197187-1-dramforever@live.com>
 <TYYP286MB1439D2AB7CFD5C0E58107ECFC69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <20220804075214.ykudvsh6b5ilqxwc@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 04, 2022 at 11:17:05AM +0800, Vivian Wang wrote:
> The hypervisor CSRs hstatus, htval, htinst should always be set if the
> trap is to be taken in HS-mode, regardless of which mode it came from.
> 
> Signed-off-by: Vivian Wang <dramforever@live.com>
> ---
>  lib/sbi/sbi_trap.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

