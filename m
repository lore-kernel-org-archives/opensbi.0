From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Dec 2022 00:10:12 +0800
Subject: [PATCH 3/4] docs: andes-ae350.md: fix watchdog nodename in dts example
In-Reply-To: <20221128083046.6799-4-peterlin@andestech.com>
References: <20221128083046.6799-1-peterlin@andestech.com> <20221128083046.6799-4-peterlin@andestech.com>
Message-ID: <CAEUhbmU6YUrLF8Yk8t2kY0qU8AtC5iOG+NTjLWM6xPBt2GHaTA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 4:33 PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> The example should use watchdog as nodename instead of wdt.
> This is defined in watchdog common schemas:
> https://github.com/torvalds/linux/blob/v6.0/Documentation/devicetree/bindings/watchdog/watchdog.yaml#L19
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  docs/platform/andes-ae350.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

