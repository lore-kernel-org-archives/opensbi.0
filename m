From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 3 Mar 2021 18:22:29 +0000
Subject: [PATCH 1/3] firmware: Support position independent execution
In-Reply-To: <1614698752-16085-2-git-send-email-vincent.chen@sifive.com>
References: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
 <1614698752-16085-2-git-send-email-vincent.chen@sifive.com>
Message-ID: <B7312B20-B260-4544-B3CF-67EBF6C13AF2@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2 Mar 2021, at 15:25, Vincent Chen <vincent.chen@sifive.com> wrote:
> 
> Enable OpenSBI to support position independent execution. Because the
> position independent code will cause an additional GOT reference when
> accessing the global variables, it will reduce performance a bit. Therefore,
> the position independent execution is disabled by default. Users can
> through specifying "FW_PIC=y" on the make command to enable this feature.
> 
> In theory, after enabling position-independent execution, the OpenSBI
> can run at arbitrary address with appropriate alignment. Therefore, the
> original relocation mechanism will be skipped. In other words, OpenSBI will
> directly run at the load address without any code movement.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
> index ab33e11..8f8e5dc 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> +#ifdef FW_PIC
> +	.option pic
> +#endif

This should be implied if you use the right flags when assembling.

Jess


