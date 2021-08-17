From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 17 Aug 2021 14:17:57 +0800
Subject: [PATCH] lib: sbi_trap: Restore redirect for access faults
In-Reply-To: <20210814134147.14056-1-samuel@sholland.org>
References: <20210814134147.14056-1-samuel@sholland.org>
Message-ID: <CAEUhbmWkBgsZM5NjiDJh6AyZZTGmFUiLLC=WQXyAq8xkwm5XDA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 14, 2021 at 9:42 PM Samuel Holland <samuel@sholland.org> wrote:
>
> commit 764a17d852a8 ("lib: sbi: Implement firmware counters") added
> switch cases for CAUSE_LOAD_ACCESS and CAUSE_STORE_ACCESS. This caused
> them to stop being redirected to U or S mode, as that is handled in the
> default switch case. As a result, an error in userspace could cause the
> system to hang. Fix this by allowing the acces fault case to fall
> through to the default case.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  lib/sbi/sbi_trap.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>

Should have a:

Fixes 764a17d852a8 ("lib: sbi: Implement firmware counters")
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

