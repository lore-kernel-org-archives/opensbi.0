From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Oct 2022 09:55:48 +0800
Subject: [PATCH] docs/firmware: update the document
In-Reply-To: <20221020144108.4034-1-pyjmstr@gmail.com>
References: <20221020144108.4034-1-pyjmstr@gmail.com>
Message-ID: <CAEUhbmXrmar9_VHXA5s16cLp9bf3Tp6WL0-bcjJvQuOLmEO06A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 20, 2022 at 10:42 PM <pyjmstr@gmail.com> wrote:
>
> From: Yangjie Zhang <pyjmstr@gmail.com>
>
> Since
> commit 9c07c513aa9b ("firmware:Remove FW_PAYLOAD_FDT_PATH compile-time option"),
> the section where FDT would be embedded in has changed from *.text* to *.rodata*,
> but some places in fw_payload.md and fw.md are still *.text*.
> This patch updates the document.
>
> Signed-off-by: Yangjie Zhang <pyjmstr@gmail.com>
> ---
>  docs/firmware/fw.md         | 2 +-
>  docs/firmware/fw_payload.md | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

