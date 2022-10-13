From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Oct 2022 16:31:17 +0200
Subject: [1/1] Makefile: Add cscope support
In-Reply-To: <20221013012623.1077367-1-ende.tan@linux.starfivetech.com>
References: <20221013012623.1077367-1-ende.tan@linux.starfivetech.com>
Message-ID: <20221013143117.awpxea4ijdn6dexz@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 13, 2022 at 09:26:23AM +0800, Tan En De wrote:
> Add cscope support so that running `make cscope` will generate/update
> cscope files used for source code browsing, while running `make
> distclean` will remove the cscope files.
> 
> Also add entry in .gitignore to ignore generated cscope files.
> 
> Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
> ---
>  .gitignore |  1 +
>  Makefile   | 13 +++++++++++++
>  2 files changed, 14 insertions(+)

As a cscope user myself, thank you for this!

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

