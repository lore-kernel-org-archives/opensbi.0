From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 11 Jul 2021 20:15:09 +0800
Subject: [PATCH v5 3/6] firmware: Explicitly pass -pie to the linker, not
 just the driver
In-Reply-To: <20210711022824.29915-4-jrtc27@jrtc27.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-4-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmX5iPaHNHOrYM2SG5JjDG=9bxKABK8v2oE6LizEJpy+rw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 10:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> When using Clang with a bare-metal triple, -pie does not get passed to
> the linker as it's not normally a thing that makes sense, unlike GCC
> which will unconditionally forward it on and potentially result in a
> linker error. However, LLD does support it, and manually forwarding it
> on works as desired, so do so to fully support FW_PIC with Clang and
> LLD.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  firmware/objects.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

