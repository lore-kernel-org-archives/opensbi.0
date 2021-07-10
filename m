From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Jul 2021 10:30:04 +0800
Subject: [PATCH v4 1/5] fw_base: Don't mark fw_platform_init as both
 global and weak
In-Reply-To: <20210709193423.29712-2-jrtc27@jrtc27.com>
References: <20210709193423.29712-1-jrtc27@jrtc27.com>
 <20210709193423.29712-2-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmXVPU3_82G=iYbN2dmx=LRjzRELnLVmHqnyCTgnb5V7Zg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 3:35 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> These are mutually exclusive. GNU as and LLVM both let later binding
> directives override earlier ones so this works as intended, but LLVM 12
> turned this into a warning as there's no good reason to do such a thing
> and could be a potential bug. Thus, remove the redundant and incorrect
> .globl directive for fw_platform_init.
> ---
>  firmware/fw_base.S | 1 -
>  1 file changed, 1 deletion(-)
>

You SoB tag was missed again:

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

And please include people's RB / TB tags in the newer version, if
nothing changed:

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

